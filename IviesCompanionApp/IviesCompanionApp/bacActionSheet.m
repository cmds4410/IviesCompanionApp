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
@synthesize baseDate = _baseDate;

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
        self.weight = 0;
        self.gender = @"";
        self.baseWeight = 75;
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        self.baseDate = [[NSDateComponents alloc] init];
        [self.baseDate setCalendar:gregorian];
        [self.baseDate setHour:0];
        [self.baseDate setMinute:0];
        
        UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(20, self.superview.frame.origin.y + 30, 280, 46)];
        
        //Configure picker...
        pickerView.delegate = self;
        pickerView.dataSource = self;
        pickerView.showsSelectionIndicator = YES;
        
        //Add picker to action sheet
        [self addSubview:pickerView];
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
    else if (component == 2) {
        NSDateComponents *tempDate = [[NSDateComponents alloc] init];
        [tempDate setMinute:self.baseDate.minute + 15 * row];
        if(row % 4 == 0) {
            [tempDate setHour:self.baseDate.hour + 1];
        }
        return [NSString stringWithFormat:@"%i:%i", self.baseDate.hour, self.baseDate.minute];
    }
    else {
        NSLog(@"Something wrong with picker");
        return @"N/A";
    }
    return @"N/A";
}

#pragma - mark UIPickerViewDataSource

-(int) numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return NUMBEROFCOMPONENTS;
    
}

-(int) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return 2;
    }
    else
        return NUMBEROFWEIGHTS;
}


@end
