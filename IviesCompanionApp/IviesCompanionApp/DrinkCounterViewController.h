//
//  DrinkCounterViewController.h
//  IviesCompanionApp
//
//  Created by Tristan on 4/5/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bacActionSheet.h"

@interface DrinkCounterViewController : UIViewController <UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIView *drinkCounterView;
@property (weak, nonatomic) IBOutlet UILabel *drinkCounter;
@property (weak, nonatomic) IBOutlet UIStepper * stepper;
@property (weak, nonatomic) IBOutlet UILabel *BAC;
@property (strong, nonatomic) bacActionSheet *bacActionSheet;

- (IBAction)clearPressed:(UIButton *)sender;
- (IBAction)bacDetailsPressed:(UIButton *)sender;
- (IBAction)incrementedDrinkCounter:(UIStepper *)sender;
@end
