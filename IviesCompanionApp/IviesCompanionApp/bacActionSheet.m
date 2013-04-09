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
        self.baseWeight = BASEWEIGHT;
        self.actionSheetStyle = UIActionSheetStyleBlackOpaque;
        self.bacDetailsPicker = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 95, 320, 162)];
        self.bacDetailsPicker.delegate = self;
        self.bacDetailsPicker.showsSelectionIndicator = YES;
        [self addSubview:self.bacDetailsPicker];
        NSLog(@"%@", [self subviews].description);
        
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
        int weight = self.baseWeight + row * WEIGHTINCREMENT;
        return [NSString stringWithFormat:@"%i", weight];
    }
    else {
        NSLog(@"Something wrong with picker");
        return @"N/A";
    }
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
    else
        return 0;
}

@end
