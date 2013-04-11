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
@synthesize startDrinkingView = _startDrinkingView;
@synthesize keepDrinkingView = _keepDrinkingView;
@synthesize userIsDrinking = _userIsDrinking;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.startDrinkingView = [[UIView alloc] init];
        self.keepDrinkingView = [[UIView alloc] init];
        self.userIsDrinking = NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.    
}

-(void) viewWillAppear:(BOOL)animated {
    
    if(!self.userIsDrinking)
    {
        [self setView:self.startDrinkingView];
    }
    else
        [self setView:self.keepDrinkingView];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"tally-back-short.png", @"tally-back-long.png")]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startDrinkingPressed:(UIButton *)sender {
    [self.delegate userDidPressStartDrinking];
}

- (IBAction)keepDrinkingPressed:(UIButton *)sender {
    [self.delegate userDidPressKeepDrinking];
}

@end
