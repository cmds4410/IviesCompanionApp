//
//  DrinkCounterViewController.h
//  IviesCompanionApp
//
//  Created by Tristan on 4/5/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "bacActionSheet.h"
#import "widmarkCalculator.h"

@protocol DrinkCounterDelegate <NSObject>

-(void) drinkCounterWillDisappear;

@end

@interface DrinkCounterViewController : UIViewController <UIActionSheetDelegate>


@property (weak, nonatomic) IBOutlet UIView *drinkCounterView;
@property (weak, nonatomic) IBOutlet UILabel *drinkCounter;
@property (weak, nonatomic) IBOutlet UIStepper * stepper;
@property (weak, nonatomic) IBOutlet UILabel *BAC;
@property (strong, nonatomic) bacActionSheet *bacActionSheet;
@property (weak, nonatomic) widmarkCalculator* bacCalculator;
@property (strong, nonatomic) NSDate * beganDrinking;
@property (nonatomic) int weight;
@property (weak, nonatomic) NSString *gender;
@property (weak, nonatomic) id <DrinkCounterDelegate> delegate;

-(void)presentActionSheet;
- (IBAction)clearPressed:(UIButton *)sender;
- (IBAction)detailsPressed:(UIButton *)sender;
- (IBAction)incrementedDrinkCounter:(UIStepper *)sender;
@end
