//
//  SearchEntityTableViewCell.m
//  TestItunes
//
//  Created by Alex Amelchenko on 04/06/16.
//  Copyright © 2016 Alex Amelchenko. All rights reserved.
//

#import "SearchEntityTableViewCell.h"

@implementation SearchEntityTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)bindWithEntity:(SearchEntity *)entity {
    self.artistNameLabel.text = entity.artistName;
    self.albumNameLabel.text = entity.collectionName;
    self.albumImageView.yy_imageURL = [NSURL URLWithString:entity.artworkUrl60];
}

@end
