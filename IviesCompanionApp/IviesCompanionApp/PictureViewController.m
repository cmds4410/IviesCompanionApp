//
//  PictureViewController.m
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/4/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "PictureViewController.h"

const float WATERMARK_ALPHA = .75;

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
    
}

-(void) viewWillAppear:(BOOL)animated {
    if(!self.imageView.image) {
        UIActionSheet* photoActionSheet = [[UIActionSheet alloc] initWithTitle:@"PictureSource" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Photos", nil];
        //    photoActionSheet.actionSheetStyle
        
        // Show the sheet
        [photoActionSheet showInView:self.view];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIActionSheetDelegate

#pragma - mark UIActionSheetDelegate
//Maybe add checks to make sure camera is available?
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    
    if (buttonIndex == 0 && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:^{
            // This block of code is only needed in case you want your watermark to be displayed also during the shooting process
            UIImageView *anImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overlay1"]];
            anImageView.alpha = WATERMARK_ALPHA;
            anImageView.contentMode = UIViewContentModeScaleAspectFit;
            
            anImageView.frame = CGRectMake(0, 20, self.view.bounds.size.width, 100);
            
            UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, 100)];
            scrollView.pagingEnabled = YES;
            int numberOfViews = 3;
            for (int i = 0; i < numberOfViews; i++)
            {
                CGFloat xOrigin = i * self.view.frame.size.width;
                UIView *awesomeView = [[UIView alloc] initWithFrame:CGRectMake(xOrigin, 0, self.view.frame.size.width, self.view.frame.size.height)];
                //awesomeView.backgroundColor = [UIColor colorWithRed:0.5/i green:0.5 blue:0.5 alpha:1];
                UIImageView *anImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overlay1"]];
                anImageView.alpha = WATERMARK_ALPHA;
                anImageView.contentMode = UIViewContentModeScaleAspectFit;
                
                anImageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 100);;
                [awesomeView addSubview:anImageView];
                
                [scrollView addSubview:awesomeView];
            }
            scrollView.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, scrollView.frame.size.height);
            //        scrollView.showsHorizontalScrollIndicator = NO;
            
            picker.cameraOverlayView = scrollView;
            
            [scrollView flashScrollIndicators];
        }];
        
        
    }
    else if (buttonIndex == 1 && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:picker animated:YES completion:nil];
    }
    
    else
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
        
}

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma - mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
//    UIGraphicsBeginImageContext(CGSizeMake(320, 480));
    UIGraphicsBeginImageContext(CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height));

    // This is where we resize captured image
    [(UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage] drawInRect:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    // And add the watermark on top of it
    [[UIImage imageNamed:@"overlay1.png"] drawInRect:CGRectMake(0, 0, self.view.bounds.size.width, 100) blendMode:kCGBlendModeNormal alpha:WATERMARK_ALPHA];
    // Save the results directly to the image view property
    self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // Dismiss the image picker controller and look at the results
    [picker dismissViewControllerAnimated:YES completion:nil];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

@end
