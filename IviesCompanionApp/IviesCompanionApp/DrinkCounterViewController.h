//
//  DrinkCounterViewController.h
//  IviesCompanionApp
//
//  Created by Tristan on 4/5/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrinkCounterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *drinkCounter;
@property (weak, nonatomic) IBOutlet UIStepper * stepper;
@property (weak, nonatomic) IBOutlet UILabel *BAC;
- (IBAction)incrementedDrinkCounter:(UIStepper *)sender;
@end
