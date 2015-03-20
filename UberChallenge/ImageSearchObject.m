//
//  ImageSearchObject.m
//  UberChallenge
//
//  Created by Daniel on 3/20/15.
//  Copyright (c) 2015 WorthlessApps. All rights reserved.
//

#import "ImageSearchObject.h"
#import "ImageResultObject.h"
#import "Constants.h"

@implementation ImageSearchObject

- (id)initWithDictionary:(NSDictionary*)imageSearchResultDictionary
{
    self = [self init];
    if (self)
    {
        NSDictionary* responseDictionary = CHECKFORNSNULL(imageSearchResultDictionary[@"responseData"]);
        if (responseDictionary)
        {
            NSArray* resultsArray = CHECKFORNSNULL(responseDictionary[@"results"]);
            for (NSDictionary* resultDictionary in resultsArray)
            {
                ImageResultObject* resultObject = [[ImageResultObject alloc] initWithResultDictionary:resultDictionary];
            }
        }
    }
    return self;
}

@end
