//
//  WellnessViewController.m
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/9/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "WellnessViewController.h"

@interface WellnessViewController ()

@end

@implementation WellnessViewController

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
    [self.scrollView setContentSize:self.scrollView.bounds.size];
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
