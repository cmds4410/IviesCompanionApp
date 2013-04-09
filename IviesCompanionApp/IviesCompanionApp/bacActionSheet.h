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

#define BASEWEIGHT 80;
#define WEIGHTINCREMENT 10;
#define NUMBEROFWEIGHTS 49;
#define NUMBEROFCOMPONENTS 2;
