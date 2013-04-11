//
//  widmarkCalculator.m
//  IviesCompanionApp
//
//  Created by Tristan on 4/8/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

//THINK ABOUT WHETHER YOU WANT TO DO THE CALCULATIONS WITH VALUES STORED IN THE OBJECT, OR PASSED AS PARAMETERS

#import "widmarkCalculator.h"

@implementation widmarkCalculator
@synthesize gender = _gender;
@synthesize weight = _weight;
@synthesize drinks = _drinks;
@synthesize startTime = _startTime;

-(id) init {
    
    if(self = [super init]) {
        self.startTime = [[NSDate alloc] init];
        self.gender = @"Female";
        self.weight = 0;
        self.drinks = 0;
        self.startTime = nil;
        return self;
    }
    else
        return nil;
}

-(id)initWithGender:(NSString *)gender Weight:(int)weight Drinks:(int)drinks andTime:(NSDate *) startTime {
    
    if(self = [self init]) {
        self.gender = gender;
        self.weight = weight;
        self.drinks = drinks;
        self.startTime = startTime;
        return self;
    }
    else
        return nil;
}
-(double) calculateBACWithGender:(NSString *)gender Weight:(int)weight Drinks:(int)drinks andTime:(NSDate *) startTime {
    self.gender = gender;
    self.weight = weight;
    self.drinks = drinks;
    self.startTime = startTime;
    return [self calculateBAC];
}


- (double) calculateBAC
{
    // A = liquid ounces of alcohol
    double A = self.drinks * .6;
    double W = self.weight;
    double r;
    if ([self.gender isEqualToString:@"M"])
    {
        r = 0.73;
    }
    else
    {
        r = 0.66;
    }
    //We need to make sure that we're not getting negative numbers out of this
    //
    NSTimeInterval secondsSpentDrinking = [self.startTime timeIntervalSinceNow];
    secondsSpentDrinking *= -1;
    double H = secondsSpentDrinking /3600.0;
    if (H <1)
    {
        H = 1;
    }
    //Gotta figure out which one to use. They're both close on estimates but neither are any good on reduced BAC/hour
    double bac = A * (5.14 * 1.055) /(W * r) - (0.015 * H);
    //double bac = (.9672 * A)/ (.535 * (W / 2.2)) - (.015 * H);
    
    if (bac < 0)
    {
        bac = 0;
    }
    
    return bac;
}

@end

