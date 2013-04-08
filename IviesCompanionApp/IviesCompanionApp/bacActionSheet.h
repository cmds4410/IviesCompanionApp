//
//  bacActionSheet.h
//  IviesCompanionApp
//
//  Created by Tristan on 4/6/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bacActionSheet : UIActionSheet <UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic) int baseWeight;
@property (weak, nonatomic) NSData *dateStartedDrinking;
@property (strong, nonatomic) UIPickerView *bacDetailsPicker;


@end

#define BASEWEIGHT 75;
#define WEIGHTINCREMENT 25;
#define NUMBEROFWEIGHTS 10;
#define NUMBEROFCOMPONENTS 2;
