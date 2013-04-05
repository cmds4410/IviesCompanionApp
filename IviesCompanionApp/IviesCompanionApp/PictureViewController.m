//
//  PictureViewController.m
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/4/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "PictureViewController.h"

@interface PictureViewController ()

@end

@implementation PictureViewController

@synthesize imageView = _imageView;
@synthesize scrollView = _scrollView;
@synthesize shareButton = _shareButton;

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
    
    UIActionSheet* photoActionSheet = [[UIActionSheet alloc] initWithTitle:@"Source" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Cancel" otherButtonTitles:@"Camera", @"Photos", nil];
//    photoActionSheet.actionSheetStyle
    
    // Show the sheet
    [photoActionSheet showInView:self.view];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if (buttonIndex == 1)
    {
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
