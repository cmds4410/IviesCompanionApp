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
#import "DrinkCounterViewController.h"

#define LAUNCHER @"LauncherCell"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize collectionView = _collectionView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Ivies Companion";
    [self.collectionView registerClass:[LauncherCell class] forCellWithReuseIdentifier:LAUNCHER];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)isItIvies:(UIButton *)sender {
    UIViewController *iviesImageVC = [[UIViewController alloc] init];
    [self.navigationController pushViewController:iviesImageVC animated:YES];
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
    if (indexPath.row == 0)
    {
        PictureViewController* pictureViewController = [[PictureViewController alloc] init];
        [self.navigationController pushViewController:pictureViewController animated:YES];
    }
    else if(indexPath.row == 1)
    {
        FoodViewController* foodVC = [[FoodViewController alloc] init];
        
        [self.navigationController pushViewController:foodVC animated:YES];
    }
    else if(indexPath.row == 5) {
        DrinkCounterViewController* drinkCounterVC = [[DrinkCounterViewController alloc] init];
        [self.navigationController pushViewController:drinkCounterVC animated:YES];
    }
    
}
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize size = CGSizeMake(125, 125);
    
    return size;
}

- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 20, 20);
}

@end
