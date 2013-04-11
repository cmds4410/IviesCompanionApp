//
//  bacActionSheet.m
//  IviesCompanionApp
//
//  Created by Tristan on 4/6/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "bacActionSheet.h"


@implementation bacActionSheet

@synthesize baseWeight = _baseWeight;
@synthesize dateStartedDrinking = _dateStartedDrinking;
@synthesize bacDetailsPicker = _bacDetailsPicker;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    return self;

}

-(id) initWithTitle:(NSString *)title delegate:(id<UIActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ... {
    
    self = [super initWithTitle:title delegate:delegate cancelButtonTitle:cancelButtonTitle destructiveButtonTitle:destructiveButtonTitle otherButtonTitles:otherButtonTitles, nil];
    if(self) {
        self.baseWeight = 0;
        self.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        self.bacDetailsPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 95, 320, self.frame.size.height)];
        self.bacDetailsPicker.delegate = self;
        self.bacDetailsPicker.showsSelectionIndicator = YES;
        [self addSubview:self.bacDetailsPicker];
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

#pragma - mark UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if(component == 0) {
        if (row == 0) {
            return @"Female";
        }
        return @"Male";
    }
    else if (component == 1) {
        int weight = BASEWEIGHT + (WEIGHTINCREMENT * row);
        return [NSString stringWithFormat:@"%ilbs", weight];
    }
    else if (component == 2) {
        if(row == 0) {
            return @"now";
        }
        return [NSString stringWithFormat:@"%i hrs ago", row];
    }
    else
        return nil;
}

#pragma - mark UIPickerViewDataSource

-(int) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return NUMBEROFCOMPONENTS;
    
}

-(int) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return 2;
    }
    else if (component == 1) {
        return NUMBEROFWEIGHTS;
    }
    else if (component ==2) {
        return NUMBEROFHOURS;
    }
    else
        return 0;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        return 95;
    }
    else if (component == 1) {
        return 80;
    }
    else
        return 130;
}

@end
