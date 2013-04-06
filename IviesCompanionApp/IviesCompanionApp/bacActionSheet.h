//
//  bacActionSheet.h
//  IviesCompanionApp
//
//  Created by Tristan on 4/6/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bacActionSheet : UIActionSheet <UIPickerViewDelegate>

@property (nonatomic) int weight;
@property (weak, nonatomic) NSString *gender;
@property (nonatomic) int baseWeight;


@end

#define WEIGHTINCREMENT 25;