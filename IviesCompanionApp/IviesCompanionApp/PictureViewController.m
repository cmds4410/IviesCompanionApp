//
//  PictureViewController.m
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/4/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "PictureViewController.h"
#import <QuartzCore/QuartzCore.h>

const float WATERMARK_ALPHA = .75;

#define kHashtag @"#IVIES2013 #IVIESCOMPANIONAPP"

@interface PictureViewController ()
- (void)actionButton;
@end

@implementation PictureViewController

@synthesize imageView = _imageView;
@synthesize scrollView = _scrollView;

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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionButton)];
    
    self.scrollView.delegate = self;
    
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

- (void) addGestureRecognizers
{
    self.imageView.userInteractionEnabled = YES;
    UIPinchGestureRecognizer *pgr = [[UIPinchGestureRecognizer alloc]
                                     initWithTarget:self action:@selector(scalePiece:)];
    pgr.delegate = self;
    [self.imageView addGestureRecognizer:pgr];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panPiece:)];
    [panGesture setMaximumNumberOfTouches:2];
    [panGesture setDelegate:self];
    [self.imageView addGestureRecognizer:panGesture];
}

- (void)actionButton
{
    NSString *textToShare = kHashtag;
    UIImage *imageToShare = self.imageView.image;
    //    NSURL *url = [NSURL URLWithString:@"http://www.yashesh87.wordpress.com"];
    NSArray *activityItems = [[NSArray alloc]  initWithObjects:textToShare, imageToShare,nil];
    
    UIActivity *activity = [[UIActivity alloc] init];
    
    NSArray *applicationActivities = [[NSArray alloc] initWithObjects:activity, nil];
    UIActivityViewController *activityVC =
    [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                      applicationActivities:applicationActivities];
    [self presentViewController:activityVC animated:YES completion:nil];
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
                
                anImageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 100);
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
    
    // supports retina
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0.0);

    // This is where we resize captured image
    [(UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage] drawInRect:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    // And add the watermark on top of it
    UIImageView *anImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overlay1"]];
    
    // you may notice that the height of this frame is larger than the height of the imageview used over the camera
    // this is because the size of the frame we are "painting" the image into is a bit smaller because of the navigation bar
    anImageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 135);
    anImageView.contentMode = UIViewContentModeScaleAspectFit;
    anImageView.alpha = WATERMARK_ALPHA;
//    [self.imageView addSubview:anImageView];
    //[[UIImage imageNamed:@"overlay1.png"] drawInRect:CGRectMake(0, 0, self.view.bounds.size.width, 100) blendMode:kCGBlendModeNormal alpha:WATERMARK_ALPHA];
//    [anImageView.image drawInRect:anImageView.frame blendMode:kCGBlendModeNormal alpha:WATERMARK_ALPHA];
    [anImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // Save the results directly to the image view property
    self.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
//    [self.scrollView addSubview:self.imageView];
    
    UIGraphicsEndImageContext();
    
    // Dismiss the image picker controller and look at the results
    [picker dismissViewControllerAnimated:YES completion:nil];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
