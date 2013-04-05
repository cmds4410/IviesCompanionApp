//
//  FoodViewController.h
//  IviesCompanionApp
//
//  Created by Tristan on 4/4/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
