//
//  SearchEntity.h
//  TestItunes
//
//  Created by Alex Amelchenko on 04/06/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchEntity : NSObject 

@property (nonatomic, strong) NSString* collectionType;
@property (nonatomic, strong) NSString* artistName;
@property (nonatomic, strong) NSString* collectionName;
@property (nonatomic, strong) NSString* artworkUrl60;

@end
