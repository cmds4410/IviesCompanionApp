//
//  initialDrinkingViewController.m
//  IviesCompanionApp
//
//  Created by Tristan on 4/7/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "initialDrinkingViewController.h"

@interface initialDrinkingViewController ()

@end

@implementation initialDrinkingViewController

@synthesize startDrinkingButton = _startDrinkingButton;
@synthesize keepDrinkingButton = _keepDrinkingButton;
@synthesize userIsDrinking = _userIsDrinking;
@synthesize startDrinkingView = _startDrinkingView;
@synthesize keepDrinkingView = _keepDrinkingView;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    
    return self;
}
- (id)init {
    self = [super init];
    if (self) {
        self.userIsDrinking = NO;
        self.startDrinkingView = [[UIView alloc] init];
        self.keepDrinkingView = [[UIView alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if(!self.userIsDrinking) {
        [self setView:self.startDrinkingView];
    }
    else {
        [self setView:self.keepDrinkingView];
    }

        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bkgd-green-short.png"]];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startDrinkingPressed:(UIButton *)sender {
    self.userIsDrinking = YES;
    [self.delegate userDidPressStartDrinking];
}

- (IBAction)keepDrinkingPressed:(UIButton *)sender {
    [self.delegate userDidPressKeepDrinking];
}
@end
