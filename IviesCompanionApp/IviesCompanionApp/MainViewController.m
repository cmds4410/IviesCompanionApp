//
//  ViewController.m
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/3/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "MainViewController.h"

#define LAUNCHER @"LauncherCell"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize collectionView = _collectionView;
@synthesize initialDrinkingVC = _initialDrinkingVC;
@synthesize drinkCounterVC = _drinkCounterVC;
@synthesize storedDrinkCount = _storedDrinkCount;
@synthesize storedBAC = _storedBAC;

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

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
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
    else if(indexPath.row == 1) {
        
        self.initialDrinkingVC = [[initialDrinkingViewController alloc] init];
        self.initialDrinkingVC.delegate = self;
        [self.navigationController pushViewController:self.initialDrinkingVC animated:YES];
    }
    else
        NSLog(@"Something's amiss with the collectionview");
    
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

#pragma mark - initialDrinkingDelegate

-(void)userDidPressStartDrinking {
    
    //self.drinkCounterVC.beganDrinking = [[NSDate alloc] init];
    //NSLog(@"%@", self.drinkCounterVC.beganDrinking.description);
    self.drinkCounterVC = [[DrinkCounterViewController alloc] init];
    self.drinkCounterVC.delegate = self;
    [self.navigationController pushViewController:self.drinkCounterVC animated:YES];
    
}

-(void)userDidPressKeepDrinking {
    if(self.drinkCounterVC) {
        self.drinkCounterVC.drinkCounter.text = [NSString stringWithFormat:@"%i",self.storedDrinkCount];
        self.drinkCounterVC.BAC.text = [NSString stringWithFormat:@"%.f", self.storedBAC];
        [self.navigationController pushViewController:self.drinkCounterVC animated:YES];
    }
    
}

#pragma mark - DrinkCounterDelegate 

-(void) drinkCounterWillDisappear {
    self.storedDrinkCount = [self.drinkCounterVC.drinkCounter.text intValue];
    self.storedBAC = [self.drinkCounterVC.BAC.text floatValue];
    [self.navigationController popToViewController:self animated:YES];
}


@end
