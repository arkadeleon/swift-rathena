//
//  RADatabaseDecoder.m
//  rAthena
//
//  Created by Leon Li on 2023/2/20.
//

#import "RADatabaseDecoder.h"
#import "RAResourceManager.h"

#import <YYModel/YYModel.h>

#include <ryml_std.hpp>
#include <ryml.hpp>

@implementation RADatabaseDecoder

- (NSArray *)decodeArrayOfObjectsOfClass:(Class)cls fromResource:(NSString *)name {
    NSString *path = [RAResourceManager.sharedManager pathForResource:name];

    NSMutableData *data = [[RAResourceManager.sharedManager dataForResource:name] mutableCopy];
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

    NSMutableArray *objects = [[NSMutableArray alloc] init];
    uint64_t count = 0;

    const ryml::NodeRef& bodyNode = tree["Body"];
    size_t childNodesCount = bodyNode.num_children();
    size_t childNodesProgressed = 0;
//    const char* fileName = this->currentFile.c_str();

    for( const ryml::NodeRef &node : bodyNode ){
        NSDictionary *element = [self parseMapNode:node];
        NSObject *object = [cls yy_modelWithJSON:element];
        [objects addObject:object];

        count++;

//        ShowStatus( "Loading [%" PRIdPTR "/%" PRIdPTR "] entries from '" CL_WHITE "%s" CL_RESET "'" CL_CLL "\r", ++childNodesProgressed, childNodesCount, fileName );
        }

//    ShowStatus( "Done reading '" CL_WHITE "%" PRIu64 CL_RESET "' entries in '" CL_WHITE "%s" CL_RESET "'" CL_CLL "\n", count, fileName );

    return [objects copy];
}

- (NSDictionary *)parseMapNode:(const ryml::NodeRef&)mapNode {
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    for (const ryml::NodeRef& node : mapNode) {
        c4::csubstr key = node.key();
        NSData *keyData = [[NSData alloc] initWithBytes:(void *)key.data() length:key.size()];
        NSString *keyString = [[NSString alloc] initWithData:keyData encoding:NSASCIIStringEncoding];

        if (node.is_map()) {
            dictionary[keyString] = [self parseMapNode:node];
        } else if (node.is_seq()) {
            dictionary[keyString] = [self parseSeqNode:node];
        } else if (node.is_keyval()) {
            dictionary[keyString] = [self parseValNode:node];
        }
    }
    return [dictionary copy];
}

- (NSArray *)parseSeqNode:(const ryml::NodeRef&)seqNode {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (const ryml::NodeRef& node : seqNode) {
        if (node.is_map()) {
            [array addObject:[self parseMapNode:node]];
        } else if (node.is_val()) {
            [array addObject:[self parseValNode:node]];
        }
    }
    return [array copy];
}

- (NSString *)parseValNode:(const ryml::NodeRef&)valNode {
    c4::csubstr val = valNode.val();
    NSData *valData = [[NSData alloc] initWithBytes:(void *)val.data() length:val.size()];
    NSString *valString = [[NSString alloc] initWithData:valData encoding:NSASCIIStringEncoding];
    return valString;
}

@end
