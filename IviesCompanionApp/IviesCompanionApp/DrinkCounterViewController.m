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

@synthesize stepper = _stepper;
@synthesize drinkCounter = _drinkCounter;
@synthesize bacActionSheet = _bacActionSheet;
@synthesize BAC = _BAC;
@synthesize beganDrinking = _beganDrinking;
@synthesize weight = _weight;
@synthesize gender = _gender;
@synthesize bacCalculator = _bacCalculator;

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
    self.BAC.lineBreakMode = 0;
    self.BAC.adjustsFontSizeToFitWidth = YES;
    self.BAC.textAlignment = 1;
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:24.0/255.0 green:156.0/255.0 blue:254.0/255.0 alpha:0.3]];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"bkgd-green-short.png", @"bkgd-green-long.png")]];
    
}

- (void) viewWillAppear:(BOOL)animated {
    self.drinkCounter.text = [NSString stringWithFormat:@"%i", (int)self.stepper.value];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) clearPressed {
    if(![self.drinkCounter.text isEqualToString:@"0"]) {
        self.BAC.text = @"Sobered up, huh?";
    }
    else
        self.BAC.text = @"0.0";
    self.drinkCounter.text = @"0";
    self.stepper.value = 0;
}

- (IBAction)detailsPressed:(UIButton *)sender {
    [self presentActionSheet];
    
}

- (IBAction)resetStartTimePressed:(UIButton *)sender {
    /*implement function to enter in number of hours since you started drinking
    and realloc-init the NSDate property using [NSDate alloc] initWithInterval or
    whatever, so that the bac is calculated from x number of hours ago instead of
    when the user (just) pressed Start Drinking
    */
}

- (IBAction)incrementedDrinkCounter:(UIStepper *)sender {
    self.numDrinks = self.stepper.value;
    self.drinkCounter.text = [NSString stringWithFormat:@"%.f", self.stepper.value];
    if([self.BAC.text isEqualToString:@"Sobered up, huh?"]) {
        [self.BAC setText:@"Back at it. Nice."];
    }
    [self.BAC setText:[NSString stringWithFormat:@"%f", [self calculateBAC]]];

}

- (float)calculateBAC
{
    widmarkCalculator* widmark = [[widmarkCalculator alloc] initWithGender:self.gender Weight:self.weight Drinks:self.numDrinks andTime:self.beganDrinking];
    return [widmark calculateBAC];
}

#pragma - mark UIActionSheetDegate

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(buttonIndex == [self.bacActionSheet cancelButtonIndex]) {
        int genderIndex = [self.bacActionSheet.bacDetailsPicker selectedRowInComponent:0];
        if(genderIndex == 0) {
            self.gender = @"F";
        }
        else if(genderIndex == 1) {
            self.gender = @"M";
        }
        else
            self.gender = @"N/A";
        
        int weightIndex = [self.bacActionSheet.bacDetailsPicker selectedRowInComponent:1];
        self.weight = BASEWEIGHT + (WEIGHTINCREMENT * weightIndex);
        
        self.BAC.text = [NSString stringWithFormat:@"G: %@, W: %@", self.gender, [NSString stringWithFormat:@"%i", self.weight]];
        
        self.beganDrinking = [[NSDate alloc] init];
        self.bacCalculator = [[widmarkCalculator alloc] initWithGender:self.gender Weight:self.weight Drinks:self.stepper.value andTime:self.beganDrinking];
    }
    
}

- (void)presentActionSheet {
    if(!self.bacActionSheet) {
        self.bacActionSheet = [[bacActionSheet alloc] initWithTitle:@"Details" delegate:self cancelButtonTitle:@"Done" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    }
    [self.bacActionSheet showInView:self.view];
    [self.bacActionSheet setFrame:CGRectMake(0, self.view.frame.size.height - 255, 320, self.view.frame.size.height)];
}
@end
