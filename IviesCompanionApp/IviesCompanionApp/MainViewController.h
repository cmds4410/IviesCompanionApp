//
//  ViewController.h
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/3/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "initialDrinkingViewController.h"
#import "DrinkCounterViewController.h"
#import "FoodViewController.h"
#import "PictureViewController.h"
#import "LauncherCell.h"

@interface MainViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, initialDrinkingDelegate, DrinkCounterDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) initialDrinkingViewController *initialDrinkingVC;
@property (strong, nonatomic) DrinkCounterViewController *drinkCounterVC;
@property (nonatomic) int storedDrinkCount;
@property (nonatomic) float storedBAC;


@end