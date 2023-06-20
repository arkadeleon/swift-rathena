//
//  ExportConstantsPlugin.swift
//  rAthena
//
//  Created by Leon Li on 2023/6/20.
//

import Foundation
import PackagePlugin

@main
struct ExportConstantsPlugin: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        let input = context.package.directory.appending(["src", "map", "script_constants.hpp"])
        let output1 = context.package.directory.appending(["Sources", "rAthenaCommon", "RAConstants.h"])
        let output2 = context.package.directory.appending(["Sources", "rAthenaCommon", "RAConstants.mm"])

        var constants = [String]()

        let inputContents = try String(contentsOfFile: input.string)
        let lines = inputContents.split(separator: "\n")
        for line in lines {
            let trimmedLine = line.trimmingCharacters(in: .whitespaces)
            if trimmedLine.hasPrefix("//") {
                continue
            }
            if trimmedLine.hasPrefix("export_constant(") {
                if let open = trimmedLine.firstIndex(of: "("), let close = trimmedLine.firstIndex(of: ")") {
                    let start = trimmedLine.index(after: open)
                    let end = close
                    let constant = trimmedLine[start..<end]
                    constants.append(String(constant))
                }
            }
        }

        constants = constants
            .filter { constant in
                constant != "true" && constant != "false"
            }

        let output1Contents = """
        \(constants.map({ "extern const NSInteger RA_\($0);" }).joined(separator: "\n"))

        extern NSInteger RAConstantGetValue(NSString *name);

        """

        let output2Contents = """
        #import "RAConstants.h"
        #include "config/core.hpp"
        #include "map/achievement.hpp"
        #include "map/battle.hpp"
        #include "map/battleground.hpp"
        #include "map/channel.hpp"
        #include "map/cashshop.hpp"
        #include "map/chat.hpp"
        #include "map/clif.hpp"
        #include "map/date.hpp"
        #include "map/elemental.hpp"
        #include "map/homunculus.hpp"
        #include "map/instance.hpp"
        #include "map/map.hpp"
        #include "map/mercenary.hpp"
        #include "map/pet.hpp"
        #include "map/pc.hpp"
        #include "map/quest.hpp"
        #include "map/storage.hpp"

        \(constants.map({ "const NSInteger RA_\($0) = \($0);" }).joined(separator: "\n"))

        NSInteger RAConstantGetValue(NSString *name) {
            static NSDictionary<NSString *, NSNumber *> *constants = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                constants = @{
        \(constants.map({ "            @\"\($0)\": @(\($0))," }).joined(separator: "\n"))
                };
            });

            NSNumber *value = constants[name];
            if (value) {
                return value.integerValue;
            } else {
                return NSNotFound;
            }
        }

        """

        try output1Contents.write(toFile: output1.string, atomically: true, encoding: .utf8)
        try output2Contents.write(toFile: output2.string, atomically: true, encoding: .utf8)
    }
}
