//
//  PictureViewController.m
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/4/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "PictureViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Constants.h"

const float WATERMARK_ALPHA = 1;

#define kHashtag @"#IVIES2013 #IVIESCOMPANIONAPP"

@interface PictureViewController ()

- (void)actionButton;
- (void)animate;

@property (nonatomic, strong) NSArray* overlays;
@property (nonatomic, strong) UIScrollView* cameraScrollView;

@end

@implementation PictureViewController

@synthesize imageView = _imageView;
@synthesize scrollView = _scrollView;
@synthesize cameraScrollView = _cameraScrollView;

@synthesize overlays = _overlays;

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
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"bkgd-green-short.png", @"bkgd-green-long.png")]];
    
    self.wantsFullScreenLayout = YES;
    [self.navigationController.navigationBar setTranslucent:YES];
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:24.0/255.0 green:156.0/255.0 blue:254.0/255.0 alpha:0.3]];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(actionButton)];
    
    self.scrollView.delegate = self;
    
    // Path to the plist (in the application bundle)
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      @"Overlays" ofType:@"plist"];
    
    // Build the array from the plist
    self.overlays = [NSArray arrayWithContentsOfFile:path];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    [self.view addGestureRecognizer:tap];
    
}

-(void) viewWillAppear:(BOOL)animated {
    if(!self.imageView.image) {
        UIActionSheet* photoActionSheet = [[UIActionSheet alloc] initWithTitle:@"PictureSource" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Camera", @"Photos", nil];
        //    photoActionSheet.actionSheetStyle
        
        // Show the sheet
        [photoActionSheet showInView:self.view];
    }
    
//    [self.navigationController.navigationBar setHidden:YES];
//    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.imageView.alpha = 0;
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animate
{
    self.imageView.alpha = 0;
    
    [UIView animateWithDuration:3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.imageView.alpha = 1;
        
    } completion:^(BOOL finished)
     {
         // add instructions for sharing
         //[self.navigationController setNavigationBarHidden:NO animated:YES];
         [self performSelector:@selector(actionButton) withObject:self afterDelay:0.5];
     }];
}

- (void)actionButton
{
    NSString *textToShare = kHashtag;
    UIImage *imageToShare = self.imageView.image;
    NSArray *activityItems = [[NSArray alloc]  initWithObjects:textToShare, imageToShare,nil];
    
    //UIActivity *activity = [[UIActivity alloc] init];
    
    //NSArray *applicationActivities = [[NSArray alloc] initWithObjects:activity, nil];
    UIActivityViewController *activityVC =
    [[UIActivityViewController alloc] initWithActivityItems:activityItems
                                      applicationActivities:nil];
    activityVC.excludedActivityTypes = [NSArray arrayWithObjects:UIActivityTypeAssignToContact,UIActivityTypeMessage,UIActivityTypePrint,UIActivityTypePostToWeibo, UIActivityTypeMail, nil];
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (void)tap:(UITapGestureRecognizer*)gesture
{
    if (self.navigationController.navigationBarHidden)
    {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    else
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
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
//            UIImageView *anImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overlay1"]];
//            anImageView.alpha = WATERMARK_ALPHA;
//            anImageView.contentMode = UIViewContentModeScaleAspectFit;
//            
//            anImageView.frame = CGRectMake(0, 20, self.view.bounds.size.width, 100);
            
            self.cameraScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-160, self.view.bounds.size.width, 100)];
            self.cameraScrollView.delegate = self;
            self.cameraScrollView.pagingEnabled = YES;
            int numberOfViews = self.overlays.count;
            for (int i = 0; i < numberOfViews; i++)
            {
                CGFloat xOrigin = i * self.view.frame.size.width;
                UIView *awesomeView = [[UIView alloc] initWithFrame:CGRectMake(xOrigin, 0, self.view.frame.size.width, self.view.frame.size.height)];
                awesomeView.backgroundColor = [UIColor whiteColor];
                awesomeView.alpha = 0.5;
                //awesomeView.backgroundColor = [UIColor colorWithRed:0.5/i green:0.5 blue:0.5 alpha:1];
//                UIImageView *anImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"overlay1.png"]];
                UIImageView *anImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[self.overlays objectAtIndex:i]]];
                anImageView.alpha = WATERMARK_ALPHA;
                anImageView.contentMode = UIViewContentModeScaleAspectFit;
                
                anImageView.frame = CGRectMake(xOrigin, 0, self.view.bounds.size.width, 100);
                anImageView.userInteractionEnabled = YES;
                //[awesomeView addSubview:anImageView];
                
//                [self.cameraScrollView addSubview:awesomeView];
                [self.cameraScrollView addSubview:anImageView];
            }
            self.cameraScrollView.contentSize = CGSizeMake(self.view.frame.size.width * numberOfViews, self.cameraScrollView.frame.size.height);
            //        scrollView.showsHorizontalScrollIndicator = NO;
            
            picker.cameraOverlayView = self.cameraScrollView;
            
            [self.cameraScrollView flashScrollIndicators];
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
    
    //calculate the current page of the scrollview
    int page = (int) (self.cameraScrollView.contentOffset.x / self.cameraScrollView.frame.size.width);
    
    // And add the watermark on top of it
    UIImageView *anImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[self.overlays objectAtIndex:page]]];
    
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
    
    [self animate];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
}

@end
