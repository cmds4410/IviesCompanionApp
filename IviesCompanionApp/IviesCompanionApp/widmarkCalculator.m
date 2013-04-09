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
        self.gender =@"";
        self.weight = 0.0;
        self.drinks = 0;
        self.startTime = [[NSDate alloc] init];
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
        return self;
    }
    else
        return nil;
}

-(float) calculateBAC {
    
    return  [self newBAC];
    
    NSTimeInterval secondsSpentDrinking = [self.startTime timeIntervalSinceNow];
    secondsSpentDrinking *= -1;
    float hoursSpentDrinking = secondsSpentDrinking / 360;
    if (hoursSpentDrinking <1)
    {
        hoursSpentDrinking = 1;
    }
    float bac;
    
    if([self.gender isEqualToString:@"Male"]) {
        bac = (BODYWATERBLOOD * self.drinks * SWEDISHCONVERSION)/(MALEBODYWATER * self.weight) - (MALEMATABOLISM * hoursSpentDrinking);
        bac = bac / 100;
    }
    else
        bac = (BODYWATERBLOOD * self.drinks * SWEDISHCONVERSION)/(FEMALEBODYWATER * self.weight) - (FEMALEMATABOLISM * hoursSpentDrinking);
    bac = bac / 100;
    
    return bac;
}


- (double) newBAC
{
    // %BAC = (A x 5.14/W x r) - .015 x H
    
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
    NSTimeInterval secondsSpentDrinking = [self.startTime timeIntervalSinceNow];
    secondsSpentDrinking *= -1;
    double H = secondsSpentDrinking /360.0;
    if (H <1)
    {
        H = 1;
    }
    
    double bac = (A * (5.14 * 1.055) /(W * r) - (0.015 * H));
    
    if (bac < 0)
    {
        bac = 0;
    }
    
    return bac;
}

@end

