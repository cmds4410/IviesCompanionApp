//
//  ModalViewController.h
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/8/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalViewController : UIViewController <UIAlertViewDelegate>
@property (strong, nonatomic) UIAlertView *callAlertView;

- (IBAction)dismiss:(id)sender;
- (IBAction)callDominoes:(UIButton *)sender;
- (IBAction)callSecurity:(UIButton *)sender;
- (IBAction)callShuttle:(UIButton *)sender;

@end
