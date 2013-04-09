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
//Note that weight is in kilograms, hence division by 2.2
-(id)initWithGender:(NSString *)gender Weight:(int)weight Drinks:(int)drinks andTime:(NSDate *) startTime {
    
    if(self = [self init]) {
        self.gender = gender;
        self.weight = weight / 2.2;
        self.drinks = drinks;
        return self;
    }
    else
        return nil;
}

-(float) calculateBAC {
    NSTimeInterval secondsSpentDrinking = [self.startTime timeIntervalSinceNow];
    secondsSpentDrinking *= -1;
    float hoursSpentDrinking = secondsSpentDrinking / 360;
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
@end

