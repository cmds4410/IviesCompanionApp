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

#define LAUNCHER @"LauncherCell"

@interface MainViewController ()
@property (nonatomic) UIImageView* homeScreenImageView;
@end

@implementation MainViewController

@synthesize collectionView = _collectionView;
@synthesize homeScreenImageView = _homeScreenImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Ivies Companion";
    [self.collectionView registerClass:[LauncherCell class] forCellWithReuseIdentifier:LAUNCHER];
    [self.collectionView reloadData];
    self.homeScreenImageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    [self.homeScreenImageView setImage:[UIImage imageNamed:@"launch-short3.png"]];
    self.homeScreenImageView.alpha = 1;
    [self.view addSubview:self.homeScreenImageView];
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.navigationController.navigationBar.isHidden)
    {
        [self.navigationController setNavigationBarHidden:NO animated:NO];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [UIView animateWithDuration:3 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        self.homeScreenImageView.alpha = 0;
        
    } completion:^(BOOL finished){
    
        [self.homeScreenImageView removeFromSuperview];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LauncherCell *cell = [cv dequeueReusableCellWithReuseIdentifier:LAUNCHER forIndexPath:indexPath];
    
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
    
    CGSize size = CGSizeMake(300, 200);
    
    return size;
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 0, 40, 0);
}


@end
