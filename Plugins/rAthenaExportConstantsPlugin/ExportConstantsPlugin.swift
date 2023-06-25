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
    typealias Constant = (name: String, value: String)

    func performCommand(context: PluginContext, arguments: [String]) async throws {
        let input = context.package.directory.appending(["src", "map", "script_constants.hpp"])
        let output1 = context.package.directory.appending(["Sources", "rAthenaCommon", "RAConstants.h"])
        let output2 = context.package.directory.appending(["Sources", "rAthenaCommon", "RAConstants.mm"])

        var constants = [Constant]()

        let inputContents = try String(contentsOfFile: input.string)
        let lines = inputContents.split(separator: "\n")
        for line in lines {
            let line = line.trimmingCharacters(in: .whitespaces)
            if line.hasPrefix("//") {
                continue
            }
            if line.hasPrefix("export_constant(") {
                let open = line.firstIndex(of: "(")!
                let close = line.firstIndex(of: ")")!
                let start = line.index(after: open)
                let end = close
                let constant = line[start..<end].trimmingCharacters(in: .whitespaces)
                let constantName = constant
                let constantValue = constant
                constants.append((constantName, constantValue))
            } else if line.hasPrefix("export_constant2(") {
                let open = line.firstIndex(of: "(")!
                let close = line.firstIndex(of: ")")!
                let start = line.index(after: open)
                let end = close
                let constant = line[start..<end].split(separator: ",")
                let constantName = constant[0].trimmingCharacters(in: .whitespaces).trimmingCharacters(in: CharacterSet(charactersIn: "\""))
                let constantValue = constant[1].trimmingCharacters(in: .whitespaces)
                constants.append((constantName, constantValue))
            }
        }

        constants = constants
            .filter { constant in
                constant.value != "true" && constant.value != "false"
            }

        var uniqueConstantValues = [String]()
        for constant in constants {
            if constant.value.contains("|") {
                continue
            }
            if !uniqueConstantValues.contains(constant.value) {
                uniqueConstantValues.append(constant.value)
            }
        }

        let output1Contents = """
        #import <Foundation/Foundation.h>

        \(uniqueConstantValues.map({ "extern const NSInteger RA_\($0);" }).joined(separator: "\n"))

        #ifdef __cplusplus
        extern "C" {
        #endif

        extern NSInteger RAConstantFromName(NSString * _Nonnull name, NSString * _Nullable defaultName);

        #ifdef __cplusplus
        }
        #endif

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

        \(uniqueConstantValues.map({ "const NSInteger RA_\($0) = \($0);" }).joined(separator: "\n"))

        NSInteger RAConstantFromName(NSString *name, NSString *defaultName) {
            static NSDictionary<NSString *, NSNumber *> *constants = nil;
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                constants = @{
        \(constants.map({ "            @\"\($0.name)\": @(\($0.value))," }).joined(separator: "\n"))
                };
            });

            NSNumber *value = constants[name];
            if (value) {
                return value.integerValue;
            }

            if (defaultName) {
                NSNumber *defaultValue = constants[defaultName];
                if (defaultValue) {
                    return defaultValue.integerValue;
                }
            }

            return NSNotFound;
        }

        """

        try output1Contents.write(toFile: output1.string, atomically: true, encoding: .utf8)
        try output2Contents.write(toFile: output2.string, atomically: true, encoding: .utf8)
    }
}
