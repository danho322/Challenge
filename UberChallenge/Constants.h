//
//  Constants.h
//  UberChallenge
//
//  Created by Daniel on 3/20/15.
//  Copyright (c) 2015 WorthlessApps. All rights reserved.
//

#ifndef UberChallenge_Constants_h
#define UberChallenge_Constants_h

#define APP_FRAME [[UIScreen mainScreen] bounds] 
#define CHECKFORNSNULL(x)      (x == (id)[NSNull null]) ? nil : x

typedef void (^ArrayParameterBlock)(NSArray* array);

#endif
