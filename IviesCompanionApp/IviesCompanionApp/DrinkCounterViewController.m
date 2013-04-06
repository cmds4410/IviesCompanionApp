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


- (IBAction)incrementedDrinkCounter:(UIStepper *)sender {
    self.drinkCounter.text = [NSString stringWithFormat:@"%.f", self.stepper.value];
    if (self.stepper.value >= 5) {
        if(self.stepper.value >= 10) {
            if(self.stepper.value >= 15) {
                if(self.stepper.value == 25) {
                    self.BAC.text = @"You're probably dead";
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
@end
