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

@synthesize callAlertView = _callAlertView;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismiss:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
