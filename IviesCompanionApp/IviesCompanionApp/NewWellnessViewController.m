//
//  NewWellnessViewController.m
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/22/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "NewWellnessViewController.h"
#import "Constants.h"

@interface NewWellnessViewController ()

@end

@implementation NewWellnessViewController

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
    // set the backgroundView in case the imge doesn't load
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"bkgd-green-short.png", @"bkgd-green-long.png")]];
    
    self.imageView.image = [UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"wellness-info-short.png", @"wellness-info-long.png")];
    
    self.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
