//
//  TestModel.h
//  TestItunes
//
//  Created by Alex Amelchenko on 04/06/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchEntity.h"

@interface TestModel : NSObject

@property NSNumber *resultCount;
@property (nonatomic, strong) NSArray* results;

@end
