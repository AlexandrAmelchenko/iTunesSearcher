//
//  TestModel.m
//  TestItunes
//
//  Created by Alex Amelchenko on 04/06/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

#import "TestModel.h"

@implementation TestModel

#pragma mark NSCoding

#define kResultsCountKey       @"resultCount"


- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_resultCount forKey:kResultsCountKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    TestModel *newModel = [[TestModel alloc] init];
    newModel.resultCount = [decoder decodeObjectForKey:kResultsCountKey];
    return newModel;
}

@end
