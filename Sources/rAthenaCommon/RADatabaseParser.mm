//
//  RADatabaseParser.m
//  rAthena
//
//  Created by Leon Li on 2023/2/20.
//

#import "RADatabaseParser.h"
#import "RAResourceManager.h"

#include <ryml_std.hpp>
#include <ryml.hpp>

@interface RADatabaseParser ()

@property (nonatomic, readonly, copy) NSString *resource;

@end

@implementation RADatabaseParser

- (instancetype)initWithResource:(NSString *)name {
    self = [super init];
    if (self) {
        _resource = [name copy];
    }
    return self;
}

- (void)parse {
    NSString *path = [RAResourceManager.sharedManager pathForResource:self.resource];

    NSMutableData *data = [[RAResourceManager.sharedManager dataForResource:self.resource] mutableCopy];
    [data appendData:[@"\0" dataUsingEncoding:NSASCIIStringEncoding]];

    ryml::Parser parser = {};
    ryml::Tree tree;

    try {
        tree = parser.parse_in_arena(c4::to_csubstr(std::string([path cStringUsingEncoding:NSASCIIStringEncoding])), c4::to_csubstr(std::string((char *)data.bytes)));
    } catch (const std::runtime_error& e) {
//        ShowError( "Failed to load %s database file from '" CL_WHITE "%s" CL_RESET "'.\n", this->type.c_str(), path.c_str() );
//        ShowError( "There is likely a syntax error in the file.\n" );
//        ShowError( "Error message: %s\n", e.what() );
        return;
    }

    const ryml::NodeRef& header = tree["Header"];

    uint64_t count = 0;

    const ryml::NodeRef& bodyNode = tree["Body"];
    size_t childNodesCount = bodyNode.num_children();
    size_t childNodesProgressed = 0;
//    const char* fileName = this->currentFile.c_str();

    for( const ryml::NodeRef &node : bodyNode ){
        count += [self parseBodyNode:node];

//        ShowStatus( "Loading [%" PRIdPTR "/%" PRIdPTR "] entries from '" CL_WHITE "%s" CL_RESET "'" CL_CLL "\r", ++childNodesProgressed, childNodesCount, fileName );
        }

//    ShowStatus( "Done reading '" CL_WHITE "%" PRIu64 CL_RESET "' entries in '" CL_WHITE "%s" CL_RESET "'" CL_CLL "\n", count, fileName );
}

- (int)parseBodyNode:(const ryml::NodeRef&)node1 {
    NSMutableDictionary *element = [[NSMutableDictionary alloc] init];

    for (const ryml::NodeRef& node : node1) {
        if (node.is_map()) {
            // TODO: Parse map
        } else if (node.is_seq()) {
            // TODO: Parse seq
        } else if (node.is_keyval()) {
            c4::csubstr key = node.key();
            NSData *keyData = [[NSData alloc] initWithBytes:(void *)key.data() length:key.size()];
            NSString *keyString = [[NSString alloc] initWithData:keyData encoding:NSASCIIStringEncoding];

            c4::csubstr val = node.val();
            NSData *valData = [[NSData alloc] initWithBytes:(void *)val.data() length:val.size()];
            NSString *valString = [[NSString alloc] initWithData:valData encoding:NSASCIIStringEncoding];

            element[keyString] = valString;
        }
    }

    if (self.delegate && [self.delegate respondsToSelector:@selector(parser:foundElement:)]) {
        [self.delegate parser:self foundElement:[element copy]];
    }
}

@end
