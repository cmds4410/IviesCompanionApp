//
//  FoodViewController.m
//  IviesCompanionApp
//
//  Created by Tristan on 4/4/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "FoodViewController.h"
#import "FoodCell.h"

@interface FoodViewController ()
@property (nonatomic) int numberOfRestaurants;
@property (nonatomic, strong) NSArray* restaurantsArray;
@end

@implementation FoodViewController

@synthesize numberOfRestaurants = _numberOfRestaurants;
@synthesize restaurantsArray = _restaurantsArray;

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
	// Do any additional setup after loading the view.
    self.title = @"Food";
    [self loadRestaurants];
    self.tableView.backgroundColor = [UIColor purpleColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadRestaurants
{
    self.restaurantsArray = [NSArray arrayWithObjects:@"Joshua's", @"Dominos", @"Papa John's", @"Campus Food Truck", nil];
    self.numberOfRestaurants = [self.restaurantsArray count];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.numberOfRestaurants;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* cellID = @"FoodCell";
    
    FoodCell* cell = (FoodCell*)[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if(nil == cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"FoodCellView" owner:self options:nil] objectAtIndex:0];
    }
    
    NSString* string = [self.restaurantsArray objectAtIndex:indexPath.row];
    NSLog(@"string: %@", string);
    
    [cell.titleLabel setText:[self.restaurantsArray objectAtIndex:indexPath.row]];
    cell.frame = CGRectOffset(cell.frame, 20, 20);
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Restaurants";
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor greenColor];
}


@end
