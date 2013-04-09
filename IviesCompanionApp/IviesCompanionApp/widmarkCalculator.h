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
@property (nonatomic) NSDate *startTime;


-(float) calculateBAC;

@end

#define BODYWATERBLOOD .806
#define SWEDISHCONVERSION 1.2
#define MALEBODYWATER .58
#define FEMALEBODYWATER .49
#define MALEMETABOLISM .015
#define FEMALEMETABOLISM .017
