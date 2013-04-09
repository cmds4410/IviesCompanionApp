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

- (IBAction)callDominoes:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Do you want to call Dominoes?" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    alert.tag = 1;
    [alert show];

    
}

- (IBAction)callSecurity:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Do you want to call Security?" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    alert.tag = 2;
    [alert show];

    
}

- (IBAction)callShuttle:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"do you want to call Shuttle?" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"ok", nil];
    alert.tag = 3;
    [alert show];

    
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1)
    {
        NSURL *url;
        if(self.callAlertView.tag == 1) {
            url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"tel://%@", DOMINOES]];
        }
        else if(self.callAlertView.tag == 2) {
            url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"tel://%@", SECURITY]];
        }
        else {
            url = [[NSURL alloc] initWithString:[NSString stringWithFormat:@"tel://%@", SHUTTLE]];
        }
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
        else {
            UIAlertView *newAlert = [[UIAlertView alloc] initWithTitle:@"Sorry!" message:@"Your device does not appear to have a phone!" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
            [newAlert show];
        }
    }
    else
    {
        NSLog(@"cancel");
    }
}

@end
