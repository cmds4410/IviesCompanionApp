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
@synthesize BAC = _BAC;
@synthesize gender = _gender;
@synthesize weight = _weight;
@synthesize bacConst = _bacConst;

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
    self.bacConst = 0.5;
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

- (IBAction)incrementedDrinkCounter:(UIStepper *)sender {
    self.drinkCounter.text = [NSString stringWithFormat:@"%.f", self.stepper.value];
    if([self.BAC.text isEqualToString:@"Sobered up, huh?"]) {
        [self.BAC setText:@"Back at it. Nice."];
    }
    float adjustedBAC = [self.drinkCounter.text floatValue] * self.bacConst;
    [self.BAC setText:[NSString stringWithFormat:@"%.f", adjustedBAC]];

}

#pragma - mark UIActionSheetDegate

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    int genderIndex = [self.bacActionSheet.bacDetailsPicker selectedRowInComponent:0];
    if(genderIndex == 0) {
        self.gender = @"Female";
    }
    else if(genderIndex == 1) {
        self.gender = @"Male";
    }
    else
        self.gender = @"N/A";
    
    int weightIndex = [self.bacActionSheet.bacDetailsPicker selectedRowInComponent:1];
    self.weight = 100 + 25 * (weightIndex - 1);
    
    self.BAC.text = [NSString stringWithFormat:@"G: %@, W: %@", self.gender, [NSString stringWithFormat:@"%i", self.weight]];
}

-(void)presentActionSheet {
    if(!self.bacActionSheet) {
        self.bacActionSheet = [[bacActionSheet alloc] initWithTitle:@"Details" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    }
    [self.bacActionSheet showInView:self.drinkCounterView];
    [self.bacActionSheet setFrame:CGRectMake(self.drinkCounterView.frame.origin.x, self.drinkCounterView.frame.origin.y + 300, 320, self.drinkCounterView.frame.size.height)];
}
@end
