//
//  widmarkCalculator.h
//  IviesCompanionApp
//
//  Created by Tristan on 4/8/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface widmarkCalculator : NSObject

@property (weak, nonatomic) NSString *gender;
@property (nonatomic) double weight;
@property (nonatomic) int drinks;
@property (nonatomic) NSDate *startTime;

-(float) calculateBAC;
-(id)initWithGender:(NSString *)gender Weight:(int)weight Drinks:(int)drinks andTime:(NSDate *) startTime;
@end

