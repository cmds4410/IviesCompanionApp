//
//  widmarkCalculator.h
//  IviesCompanionApp
//
//  Created by Tristan on 4/8/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface widmarkCalculator : NSObject

@property (weak, nonatomic) NSString *gender;
@property (nonatomic) double weight;
@property (nonatomic) int drinks;
@property (nonatomic) float hours;


-(float) calculateFemaleBACWithWeight:(double)weight andDrinkCount:(int)drinks;
-(float) calculateMaleBACWithWeight:(double)weight andDrinkCount:(int)drinks;

@end

#define BODYWATERBLOOD .806
#define SWEDISHCONVERSION 1.2
#define MALEBODYWATER .58
#define FEMALEBODYWATER .49
#define MALEMATABOLISM .015
#define FEMALEMATABOLISM .017
