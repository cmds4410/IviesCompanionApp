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

#define LAUNCHER @"LauncherCell"

@interface MainViewController ()
@property (nonatomic) UIImageView* homeScreenImageView;
- (void)modal;
@end

@implementation MainViewController

@synthesize collectionView = _collectionView;
@synthesize homeScreenImageView = _homeScreenImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navicon.png"] style:UIBarButtonItemStylePlain target:self action:@selector(modal)];
    
    // TODO: Add support for 4 inch screen

    self.collectionView.backgroundColor = nil;
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bkgd-blue-short.png"]];
    
    [self.collectionView registerClass:[LauncherCell class] forCellWithReuseIdentifier:LAUNCHER];
//    [self.collectionView reloadData];
    
    /*
    self.homeScreenImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.homeScreenImageView setImage:[UIImage imageNamed:@"launch-short3.png"]];
    self.homeScreenImageView.alpha = 1;
    [self.view addSubview:self.homeScreenImageView];
     */
    
//    [self.collectionView setHidden:YES];
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LauncherCell *cell = [cv dequeueReusableCellWithReuseIdentifier:LAUNCHER forIndexPath:indexPath];
    
    if (indexPath.row == 0)
    {
        cell.backgroundColor = nil;
        UIImage* image = [UIImage imageNamed:@"camera.png"];
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        [imageView setImage:image];
        [cell addSubview:imageView];
    }
    else if (indexPath.row == 1)
    {
        cell.backgroundColor = nil;
        UIImage* image = [UIImage imageNamed:@"drink"];
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
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selected Item at index: %d", indexPath.row);
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
        FoodViewController* foodVC = [[FoodViewController alloc] init];
        
        [self.navigationController pushViewController:foodVC animated:YES];
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


@end
