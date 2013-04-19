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
@synthesize hoursSinceUserStartedDrinking = _hoursSinceUserStartedDrinking;

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
    self.hoursSinceUserStartedDrinking = 0;
    self.bacCalculator = [[widmarkCalculator alloc] init];
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:24.0/255.0 green:156.0/255.0 blue:254.0/255.0 alpha:0.3]];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"tally-short.png", @"tally-long.png")]];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:kDefaultsDate])
    {
        self.beganDrinking = [defaults objectForKey:kDefaultsDate];
        NSLog(@"self.beganDrinking: %@", self.beganDrinking);
    }
    if ([defaults integerForKey:kDefaultsNumDrinks])
    {
        self.numDrinks = [defaults integerForKey:kDefaultsNumDrinks];
        NSLog(@"self.numDrinks: %d", self.numDrinks);
        [self.drinkCounter setText:[NSString stringWithFormat:@"%i", self.numDrinks]];
        self.stepper.value = self.numDrinks;
    }
    if ([defaults integerForKey:kDefaultsWeight])
    {
        self.weight = [defaults integerForKey:kDefaultsWeight];
        NSLog(@"weight: %d", self.weight);
    }
    if ([defaults objectForKey:kDefaultsGender])
    {
        self.gender = [defaults objectForKey:kDefaultsGender];
        NSLog(@"self.gender: %@", self.gender);
    }
    [self.BAC setText:[NSString stringWithFormat:@"%f", [self.bacCalculator calculateBACWithGender:self.gender Weight:self.weight Drinks:self.numDrinks andTime:self.beganDrinking]]];
    
}

- (void) viewWillAppear:(BOOL)animated {
    if (self.numDrinks == 0)
    {
        [self.drinkCounter setText:[NSString stringWithFormat:@"%i", self.numDrinks]];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) clearFields {
    self.beganDrinking = nil;
    self.numDrinks = 0;
    self.drinkCounter.text = @"";
    self.BAC.text = @"";
    self.stepper.value = 0;
}

- (IBAction)detailsPressed:(UIButton *)sender {
    [self presentActionSheet];
}


- (IBAction)incrementedDrinkCounter:(UIStepper *)sender {
    self.numDrinks = self.stepper.value;
    self.drinkCounter.text = [NSString stringWithFormat:@"%i", self.numDrinks];
    [self.BAC setText:[NSString stringWithFormat:@"%f", [self.bacCalculator calculateBACWithGender:self.gender Weight:self.weight Drinks:self.numDrinks andTime:self.beganDrinking]]];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.numDrinks forKey:kDefaultsNumDrinks];
    [defaults synchronize];

}

#pragma - mark UIActionSheetDegate

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex {
    if(buttonIndex == [self.bacActionSheet cancelButtonIndex]) {
        //Aquire which gender and weight rows were selected and
        //set gender and weight properties appropriately 
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
        //int hoursSinceStartedDrinkingIndex = [self.bacActionSheet.bacDetailsPicker selectedRowInComponent:2];
        //Determine whether the hoursSinceStartedDrinking selected is different than
        //it has been.
        /*if(hoursSinceStartedDrinkingIndex != self.hoursSinceUserStartedDrinking) {
            //If it is, then reset the date
            self.hoursSinceUserStartedDrinking = hoursSinceStartedDrinkingIndex;
            float secondsSinceUserStartedDrinking = self.hoursSinceUserStartedDrinking * 3600;
            NSTimeInterval timeInterval = secondsSinceUserStartedDrinking;
            self.beganDrinking = [NSDate dateWithTimeIntervalSinceNow:(-1) * timeInterval];
        }*/
        //self.bacCalculator = [[widmarkCalculator alloc] initWithGender:self.gender Weight:self.weight Drinks:self.numDrinks andTime:self.beganDrinking];
        self.drinkCounter.text = [NSString stringWithFormat:@"%i", self.numDrinks];
        
//        if(!self.bacCalculator.startTime) {
//            self.bacCalculator.startTime = [[NSDate alloc] init];
//        }
        
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.gender forKey:kDefaultsGender];
        [defaults setInteger:self.weight forKey:kDefaultsWeight];
        
        self.BAC.text = [NSString stringWithFormat:@"%f", [self.bacCalculator calculateBACWithGender:self.gender Weight:self.weight Drinks:self.numDrinks andTime:self.beganDrinking]];
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
