//
//  Constants.h
//  IviesCompanionApp
//
//  Created by Tristan on 4/8/13.
//  Copyright (c) 2013 Connor Smith. All rights reserved.
//

#ifndef IviesCompanionApp_Constants_h
#define IviesCompanionApp_Constants_h

#define BASEWEIGHT 80
#define WEIGHTINCREMENT 10
#define NUMBEROFWEIGHTS 33
#define NUMBEROFCOMPONENTS 2
#define NUMBEROFHOURS 15
#define BODYWATERBLOOD .806
#define SWEDISHCONVERSION 1.2
#define MALEBODYWATER .58
#define FEMALEBODYWATER .49
#define MALEMATABOLISM .015
#define FEMALEMATABOLISM .017

#define kSecurityPhoneNum 2077253314
#define kShuttlePhoneNum 2077253337

#define ASSET_BY_SCREEN_HEIGHT(regular, longScreen) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : longScreen)

#define kDefaultsUserIsDrinking @"userIsDrinking"
#define kDefaultsGender @"gender"
#define kDefaultsWeight @"weight"
#define kDefaultsNumDrinks @"numDrinks"
#define kDefaultsDate @"date"
#define kDefaultEULA @"eula"

#define kHashtag @"#Ivies2013 @IviesApp"



#endif
