//
//  API.m
//  TestItunes
//
//  Created by Alex Amelchenko on 04/06/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

#import "API.h"
#import "TestModel.h"
#import "SearchEntity.h"

@implementation API

RKObjectManager *testAPIManager;
RKObjectMapping *entityMapping;
RKResponseDescriptor *responseDescriptor;
RKResponseDescriptor *errorDescriptor;

+ (API *)sharedInstance {
    static API *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[API alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    if (self == [super init]) {
        testAPIManager = [self configAPIManager];
        [self configAPI];
    }
    return self;
}

- (RKObjectManager *)configAPIManager {
    NSURL *baseURL = [NSURL URLWithString:@"https://itunes.apple.com/"];
    AFHTTPClient *client = [[AFHTTPClient alloc] initWithBaseURL:baseURL];
    RKObjectManager *objectManager = [[RKObjectManager alloc] initWithHTTPClient:client];
    [[objectManager HTTPClient] setDefaultHeader:@"Content-Type" value:@"application/JSON"];
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/javascript"];
    return objectManager;
}

- (void)configAPI {
    [self configDescriptors];
}

- (void)configDescriptors {
    [self configResponseDescriptor];
}

- (void)configResponseDescriptor {
    _mapping = [RKObjectMapping mappingForClass:[TestModel class]];
    _mapping.assignsNilForMissingRelationships = true;
    
    entityMapping = [RKObjectMapping mappingForClass:[SearchEntity class]];
    [entityMapping addAttributeMappingsFromDictionary:@{
                                                        @"collectionType" : @"collectionType",
                                                        @"artistName" : @"artistName",
                                                        @"collectionName" : @"collectionName",
                                                        @"artworkUrl60" : @"artworkUrl60"
                                                        }];
    [_mapping addAttributeMappingsFromDictionary:@{
                                                   @"resultCount" : @"resultCount"
                                                   }];
    RKRelationshipMapping *rowsR = [RKRelationshipMapping relationshipMappingFromKeyPath:@"results" toKeyPath:@"results" withMapping:entityMapping];
    [_mapping addPropertyMapping:rowsR];
    responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:_mapping
                                                                      method:RKRequestMethodAny
                                                                 pathPattern:nil
                                                                     keyPath:nil
                                                                 statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [testAPIManager addResponseDescriptor:responseDescriptor];
}


- (void)getSearchResultsByLine:(NSString *)searchLine success:(void (^)(TestModel *model))success failure:(void (^)())failure {
    NSDictionary *queryParams = @{@"term" : searchLine,
                                  @"entity" : @"album"};
    testAPIManager.requestSerializationMIMEType = RKMIMETypeFormURLEncoded;
    
    [testAPIManager getObject:nil path:@"search" parameters:queryParams success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        success((TestModel*) mappingResult.firstObject);
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        failure();
    }];
}

@end
