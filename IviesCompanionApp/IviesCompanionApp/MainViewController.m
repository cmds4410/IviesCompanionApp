//
//  ViewController.m
//  IviesCompanionApp
//
//  Created by Connor Smith on 4/3/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import "MainViewController.h"
#import "LauncherCell.h"

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

#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
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
        NSLog(@"Camera selected, Instantiating imagePicker");
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        
        
        if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            NSLog(@"Camera not available, setting sourceType to photoLibrary");
            [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }
        else {
            NSLog(@"Camera available, setting it to sourceType and modifying properties.");
            picker.showsCameraControls = NO;
            picker.navigationBarHidden = NO;
            picker.toolbarHidden = YES;
            
            [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
        }
        
    [self presentViewController:picker animated:YES completion:nil];
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

#pragma - UIPickerDelegate

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
}

@end
