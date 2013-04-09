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
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bkgd-green-short.png"]];
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
