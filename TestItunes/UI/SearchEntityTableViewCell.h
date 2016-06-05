//
//  SearchEntityTableViewCell.h
//  TestItunes
//
//  Created by Alex Amelchenko on 04/06/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchEntity.h"
#import "YYWebImage.h"

@interface SearchEntityTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *albumImageView;

- (void)bindWithEntity:(SearchEntity *)entity;

@end
