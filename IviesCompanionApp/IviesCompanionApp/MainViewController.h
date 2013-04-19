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

@interface MainViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, initialDrinkingDelegate, DrinkCounterDelegate, UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) initialDrinkingViewController *initialDrinkingVC;
@property (strong, nonatomic) DrinkCounterViewController *drinkCounterVC;

@end
