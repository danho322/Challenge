//
//  ImageSearchObject.h
//  UberChallenge
//
//  Created by Daniel on 3/20/15.
//  Copyright (c) 2015 WorthlessApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageSearchObject : NSObject

- (id)initWithDictionary:(NSDictionary*)imageSearchResultDictionary;
- (NSArray*)resultImageObjects;

@end
