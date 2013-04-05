//
//  FoodCell.m
//  IviesCompanionApp
//
//  Created by Tristan on 4/4/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "FoodCell.h"

@implementation FoodCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
