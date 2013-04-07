//
//  bacActionSheet.h
//  IviesCompanionApp
//
//  Created by Tristan on 4/6/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bacActionSheet : UIActionSheet <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic) int weight;
@property (weak, nonatomic) NSString *gender;
@property (nonatomic) int baseWeight;
@property (strong, nonatomic) NSDateComponents *baseDate;


@end

#define WEIGHTINCREMENT 25;
#define NUMBEROFWEIGHTS 20;
#define NUMBEROFCOMPONENTS 3;
