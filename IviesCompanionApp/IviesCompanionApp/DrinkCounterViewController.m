//
//  DrinkCounterViewController.m
//  IviesCompanionApp
//
//  Created by Tristan on 4/5/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "DrinkCounterViewController.h"

@interface DrinkCounterViewController ()

@end


@implementation DrinkCounterViewController
@synthesize drinkCounterView = _drinkCounterView;
@synthesize stepper = _stepper;
@synthesize drinkCounter = _drinkCounter;
@synthesize bacActionSheet = _bacActionSheet;
@synthesize bacDetailsPicker = _bacDetailsPicker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    


    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.stepper.value = 0;
    self.stepper.minimumValue = 0;
    self.stepper.maximumValue = 25;
    self.stepper.autorepeat = NO;
    self.stepper.continuous = YES;
    self.drinkCounter.numberOfLines = 1;
    self.drinkCounter.adjustsFontSizeToFitWidth = YES;
    self.drinkCounter.text = [NSString stringWithFormat:@"%i", (int)self.stepper.value];
    self.drinkCounter.textAlignment = 1;
    self.BAC.numberOfLines = 1;
    self.BAC.adjustsFontSizeToFitWidth = YES;
    self.BAC.textAlignment = 1;

}

- (void) viewWillAppear:(BOOL)animated {
    self.drinkCounter.text = [NSString stringWithFormat:@"%i", (int)self.stepper.value];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clearPressed:(UIButton *)sender {
    if(self.bacActionSheet) {
        return;
    }
    if(![self.drinkCounter.text isEqualToString:@"0"]) {
        self.BAC.text = @"Sobered up, huh?";
    }
    else
        self.BAC.text = @"0.0";
    self.drinkCounter.text = @"0";
    self.stepper.value = 0;
}

- (IBAction)bacDetailsPressed:(UIButton *)sender {
    
    self.bacActionSheet = [[bacActionSheet alloc] initWithTitle:@"BAC Details" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"done" otherButtonTitles:nil];
    [self.bacActionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    CGPoint bacActionSheetOrigin = CGPointMake(0, self.drinkCounterView.frame.size.height / 4);
    CGRect bacActionSheetFrame = CGRectMake(0,bacActionSheetOrigin.y, self.drinkCounterView.frame.size.width, self.drinkCounterView.frame.size.height);
    [self.bacActionSheet setFrame:bacActionSheetFrame];
    [self.drinkCounterView addSubview:self.bacActionSheet];
}

- (IBAction)incrementedDrinkCounter:(UIStepper *)sender {
    if(self.bacActionSheet) {
        return;
    }
    self.drinkCounter.text = [NSString stringWithFormat:@"%.f", self.stepper.value];
    if([self.BAC.text isEqualToString:@"Sobered up, huh?"]) {
        [self.BAC setText:@"Back at it. Nice."];
    }
    if (self.stepper.value >= 5) {
        if(self.stepper.value >= 10) {
            if(self.stepper.value >= 15) {
                if(self.stepper.value == 25) {
                    self.BAC.text = @"You're probably dead dude";
                }
                else
                    self.BAC.text = @"Kid's blackout";
            }
            else
                self.BAC.text = @"Kid's hammered";
        }
        else
            self.BAC.text = @"Kid's buzzed";
    }
}

#pragma - mark UIActionSheetDegate

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    int genderIndex = [self.bacDetailsPicker selectedRowInComponent:0];
    if(genderIndex == 0) {
        self.bacActionSheet.gender = @"Male";
    }
    else if(genderIndex == 1) {
        self.bacActionSheet.gender = @"Female";
    }
    else
        self.bacActionSheet.gender = @"N/A";
    
    int weightIndex = [self.bacDetailsPicker selectedRowInComponent:1];
    self.bacActionSheet.weight = 100 + 25 * weightIndex;
    
    self.BAC.text = [NSString stringWithFormat:@"G: %@, W: %@", self.bacActionSheet.gender, [NSString stringWithFormat:@"%i", self.bacActionSheet.weight]];
}
@end
