//
//  initialDrinkingViewController.h
//  IviesCompanionApp
//
//  Created by Tristan on 4/7/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"

@protocol initialDrinkingDelegate <NSObject>

//the startDrinkingQualifier is either 0 or 1. 0 will signal the delgate to 
-(void)userDidPressStartDrinking;
-(void)userDidPressKeepDrinking;


@end

@interface initialDrinkingViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *startDrinkingView;
@property (strong, nonatomic) IBOutlet UIView *keepDrinkingView;
@property (nonatomic) BOOL userIsDrinking;

@property (weak, nonatomic) IBOutlet UIButton *startDrinkingButton;
@property (weak, nonatomic) IBOutlet UIButton *keepDrinkingButton;
@property (weak, nonatomic) id <initialDrinkingDelegate> delegate;

- (IBAction)startDrinkingPressed:(UIButton *)sender;
- (IBAction)keepDrinkingPressed:(UIButton *)sender;

@end
