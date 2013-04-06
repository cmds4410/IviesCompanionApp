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
    NSLog(@"drinkCounter text: %@, stepper value: %.f, BAC text: %@", self.drinkCounter.text, self.stepper.value, self.BAC.text);
    if(![self.drinkCounter.text isEqualToString:@"0"]) {
        self.BAC.text = @"Sobered up, huh?";
    }
    self.drinkCounter.text = @"0";
    self.stepper.value = 0;
    NSLog(@"drinkCounter text: %@, stepper value: %.f, BAC text: %@", self.drinkCounter.text, self.stepper.value, self.BAC.text);
}

- (IBAction)bacDetailsPressed:(UIButton *)sender {
    
    self.bacActionSheet = [[bacActionSheet alloc] initWithTitle:@"BAC Details" delegate:self cancelButtonTitle:@"Done" destructiveButtonTitle:nil otherButtonTitles:nil];
    [self.bacActionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    [self.bacActionSheet showInView:self.view];
    CGPoint bacActionSheetOrigin = CGPointMake(0, self.drinkCounterView.frame.size.height / 4);
    CGRect bacActionSheetFrame = CGRectMake(0,bacActionSheetOrigin.y, self.drinkCounterView.frame.size.width, self.drinkCounterView.frame.size.height);
    [self.bacActionSheet setFrame:bacActionSheetFrame];
    
    
}
#pragma - mark UIActionSheetDegate

- (void) willPresentActionSheet:(UIActionSheet *)actionSheet {
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 40, 320, 216)];
    
    //Configure picker...
    pickerView.delegate = self.bacActionSheet;
    pickerView.dataSource = self;
    pickerView.showsSelectionIndicator = YES;
         
    //Add picker to action sheet
    [self.bacActionSheet addSubview:pickerView];
        
    //Gets an array af all of the subviews of our actionSheet
    NSArray *subviews = [actionSheet subviews];
    
    [[subviews objectAtIndex:0] setFrame:CGRectMake(20, 266, 280, 46)];
    [[subviews objectAtIndex:1] setFrame:CGRectMake(20, 317, 280, 46)];
}

- (IBAction)incrementedDrinkCounter:(UIStepper *)sender {
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
