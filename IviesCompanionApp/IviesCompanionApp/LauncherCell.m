//
//  LauncherCell.m
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/3/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "LauncherCell.h"

@implementation LauncherCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSArray* nibArray = [[NSBundle mainBundle] loadNibNamed:@"LauncherCell" owner:self options:nil];
        
        if ([nibArray count] < 1 && [[nibArray objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]])
        {
            return nil;
        }
        else
        {
            self = [nibArray objectAtIndex:0];
        }

    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
