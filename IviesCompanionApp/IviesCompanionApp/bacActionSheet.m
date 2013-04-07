//
//  bacActionSheet.m
//  IviesCompanionApp
//
//  Created by Tristan on 4/6/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "bacActionSheet.h"


@implementation bacActionSheet

@synthesize gender = _gender;
@synthesize weight = _weight;
@synthesize baseWeight = _baseWeight;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    self.weight = 0;
    self.gender = @"";
    self.baseWeight = 75;
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

#pragma - mark UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSLog(@"row: %d", row);
    if(component == 0) {
        if (row == 0) {
            return @"Female";
        }
        return @"Male";
    }
    else if (component == 1) {
        int weight = self.baseWeight + row * WEIGHTINCREMENT;
        return [NSString stringWithFormat:@"%i", weight];
    }
    else {
        NSLog(@"Something wrong with pickerRowLabels");
        return @"N/A";
    }
    return @"N/A";
}


@end
