//
//  initialDrinkingViewController.h
//  IviesCompanionApp
//
//  Created by Tristan on 4/7/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol initialDrinkingDelegate <NSObject>

-(void)userDidPressStartDrinking;
-(void)userDidPressKeepDrinking;

@end

@interface initialDrinkingViewController : UIViewController

@property (weak, nonatomic) id <initialDrinkingDelegate> delegate;

- (IBAction)startDrinkingPressed:(UIButton *)sender;
- (IBAction)keepDrinkingPressed:(UIButton *)sender;

@end
