//
//  API.h
//  TestItunes
//
//  Created by Alex Amelchenko on 04/06/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestKit.h"
#import "TestModel.h"

@interface API : NSObject

@property RKObjectMapping *mapping;

+ (API *)sharedInstance;

- (void)getSearchResultsByLine:(NSString *)searchLine
                       success:(void (^)(TestModel *model))success
                       failure:(void (^)())failure;

@end
