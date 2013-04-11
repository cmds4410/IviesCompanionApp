//
//  ModalViewController.m
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/8/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "ModalViewController.h"
#import "Constants.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

//@synthesize callAlertView = _callAlertView;

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
    
    //[self.navigationController.navigationBar setTranslucent:YES];
    [self.navBar setTranslucent:YES];
    
    self.imageView.image = [UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"schedule-short.png", @"schedule-long.png")];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    
    UISwipeGestureRecognizer* swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    
    [self.view addGestureRecognizer:tap];
    [self.view addGestureRecognizer:swipe];

    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
