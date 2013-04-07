//
//  ViewController.h
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/3/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
- (IBAction)isItIvies:(UIButton *)sender;

@end