//
//  ViewController.m
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/3/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "MainViewController.h"
#import "LauncherCell.h"
#import "PictureViewController.h"
#import "FoodViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "ModalViewController.h"
#import "Constants.h"
#import "WellnessViewController.h"

#define LAUNCHER @"LauncherCell"

@interface MainViewController ()

@property (nonatomic) UIImageView* homeScreenImageView;
@property (nonatomic) NSArray* homeScreenButtons;
@property (nonatomic) int collectionViewPosition;

- (void)modal;
- (void)scroll;

@end

@implementation MainViewController

@synthesize collectionView = _collectionView;
@synthesize homeScreenImageView = _homeScreenImageView;
@synthesize homeScreenButtons = _homeScreenButtons;
@synthesize collectionViewPosition = _collectionViewPosition;

@synthesize initialDrinkingVC = _initialDrinkingVC;
@synthesize drinkCounterVC = _drinkCounterVC;
@synthesize storedDrinkCount = _storedDrinkCount;
@synthesize storedBAC = _storedBAC;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navicon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(modal)];
    
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:24.0/255.0 green:156.0/255.0 blue:254.0/255.0 alpha:0.3]];
    
    // TODO: Add support for 4 inch screen
    
    self.collectionView.backgroundColor = nil;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:ASSET_BY_SCREEN_HEIGHT(@"bkgd-blue-short.png", @"bkgd-blue-long.png")]];
    
    [self.collectionView registerClass:[LauncherCell class] forCellWithReuseIdentifier:LAUNCHER];
    //    [self.collectionView reloadData];
    
    /*
     self.homeScreenImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
     [self.homeScreenImageView setImage:[UIImage imageNamed:@"launch-short3.png"]];
     self.homeScreenImageView.alpha = 1;
     [self.view addSubview:self.homeScreenImageView];
     */
    
    //    [self.collectionView setHidden:YES];
    
    // Path to the plist (in the application bundle)
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      @"Home Screen Buttons" ofType:@"plist"];
    
    // Build the array from the plist
    self.homeScreenButtons = [NSArray arrayWithContentsOfFile:path];
    
    // initialize to 0
    self.collectionViewPosition = 0;
    
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.navigationController.navigationBar.isHidden)
    {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    [self.navigationController.navigationBar setTranslucent:NO];
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    /*
     [UIView animateWithDuration:3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
     
     self.homeScreenImageView.alpha = 0;
     
     } completion:^(BOOL finished){
     
     [self.homeScreenImageView removeFromSuperview];
     }];
     */
    
    // only do this on first appear
    if (!animated)
    {
        self.view.userInteractionEnabled = NO;
        
        [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:3 inSection:0] atScrollPosition:UICollectionViewScrollPositionTop animated:NO];
        
        [self performSelector:@selector(scroll) withObject:self afterDelay:.6];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scroll
{
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionBottom animated:YES];
    self.view.userInteractionEnabled = YES;
}

- (void)modal
{
    ModalViewController* modalVC = [[ModalViewController alloc] init];
    modalVC.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //modalVC.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:modalVC animated:YES completion:nil];
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.homeScreenButtons.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LauncherCell *cell = [cv dequeueReusableCellWithReuseIdentifier:LAUNCHER forIndexPath:indexPath];
    
    /*
    cell.backgroundColor = nil;
    UIImage* image = [UIImage imageNamed:[self.homeScreenButtons objectAtIndex:self.collectionViewPosition]];
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    [imageView setImage:image];
    [cell addSubview:imageView];
    */
    
    if (indexPath.row == 0)
    {
        cell.backgroundColor = nil;
        UIImage* image = [UIImage imageNamed:[self.homeScreenButtons objectAtIndex:0]];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [imageView setImage:image];
        [cell addSubview:imageView];
    }
    else if (indexPath.row == 1)
    {
        cell.backgroundColor = nil;
        UIImage* image = [UIImage imageNamed:[self.homeScreenButtons objectAtIndex:1]];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [imageView setImage:image];
        [cell addSubview:imageView];
    }
    else if (indexPath.row == 2)
    {
        cell.backgroundColor = nil;
        UIImage* image = [UIImage imageNamed:[self.homeScreenButtons objectAtIndex:2]];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [imageView setImage:image];
        [cell addSubview:imageView];
    }
    else if (indexPath.row == 3)
    {
        cell.backgroundColor = nil;
        UIImage* image = [UIImage imageNamed:[self.homeScreenButtons objectAtIndex:3]];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [imageView setImage:image];
        [cell addSubview:imageView];
    }
     
    
    //    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    //    cell.layer.shadowOffset = CGSizeMake(0, 3);
    //    cell.layer.shadowRadius = 10.0;
    //    cell.layer.shadowOpacity = 0.8;
    //    cell.layer.cornerRadius = 10.0;
    //    self.activityBackgroundView.layer.borderColor = [UIColor blackColor].CGColor;
    //    self.invitationView.layer.borderWidth = 2.0;
    
    self.collectionViewPosition++;
    
    // reset
    if (self.collectionViewPosition >= self.homeScreenButtons.count)
    {
        self.collectionViewPosition = 0;
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        //MainViewController* m = [[MainViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
//        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
//        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        PictureViewController* pictureViewController = [[PictureViewController alloc] init];
        
        
//        [self presentViewController:picker animated:YES completion:nil];
        [self.navigationController pushViewController:pictureViewController animated:YES];
    }
    else if(indexPath.row == 1)
    {
        self.initialDrinkingVC = [[initialDrinkingViewController alloc] init];
        self.initialDrinkingVC.delegate = self;
        [self.navigationController pushViewController:self.initialDrinkingVC animated:YES];
    }
    else if(indexPath.row == 2)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Bowdoin" message:nil delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Call Shuttle", @"Call Security", nil];
        [alert show];
    }
    else if(indexPath.row == 3)
    {
        WellnessViewController* wellness = [[WellnessViewController alloc] init];
        [self presentViewController:wellness animated:YES completion:nil];
    }
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize size = CGSizeMake(200, 138);
    
    return size;
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(50, 0, 50, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat spacing = 50;
    return spacing;
}

#pragma mark - initialDrinkingDelegate

-(void)userDidPressStartDrinking {
    
    self.drinkCounterVC.beganDrinking = [[NSDate alloc] init];
    if(!self.drinkCounterVC) {
        self.drinkCounterVC = [[DrinkCounterViewController alloc] init];
        self.drinkCounterVC.delegate = self;
    }
    [self.navigationController pushViewController:self.drinkCounterVC animated:YES];
    if(self.drinkCounterVC.weight == 0) {
        [self.drinkCounterVC presentActionSheet];
    }
}

-(void)userDidPressKeepDrinking {
    if(self.drinkCounterVC) {
        self.drinkCounterVC.drinkCounter.text = [NSString stringWithFormat:@"%i",self.storedDrinkCount];
        //self.drinkCounterVC.BAC.text = [NSString stringWithFormat:@"%.f", self.storedBAC];
        self.drinkCounterVC.BAC.text = [NSString stringWithFormat:@"%f", [self.drinkCounterVC calculateBAC]];
        [self.navigationController pushViewController:self.drinkCounterVC animated:YES];
    }
    
}

#pragma mark - DrinkCounterDelegate

- (void)drinkCounterWillDisappear {
    self.storedDrinkCount = [self.drinkCounterVC.drinkCounter.text intValue];
    self.storedBAC = [self.drinkCounterVC.BAC.text floatValue];
    [self.navigationController popToViewController:self animated:YES];
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%d",kShuttlePhoneNum]]])
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%d",kShuttlePhoneNum]]];
        }
        else
        {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Uh Oh" message:@"This isn't a phone, bro" delegate:nil cancelButtonTitle:@"Aight" otherButtonTitles: nil];
            [alert show];
        }
    }
    
    else if (buttonIndex == 2)
    {
        if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%d",kSecurityPhoneNum]]])
        {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%d",kSecurityPhoneNum]]];
        }
        else
        {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Uh Oh" message:@"This isn't a phone, bro" delegate:nil cancelButtonTitle:@"Aight" otherButtonTitles: nil];
            [alert show];
        }
    }
}


@end
