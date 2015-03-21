//
//  ImageResultObject.h
//  UberChallenge
//
//  Created by Daniel on 3/20/15.
//  Copyright (c) 2015 WorthlessApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageResultObject : NSObject

- (id)initWithResultDictionary:(NSDictionary*)resultDictionary;
- (NSString*)imageResultUrl;

@end
