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

@interface ImageSearchObject()
@property (nonatomic, strong) NSArray* resultImageObjectArray;
@property (nonatomic, strong) NSString* moreResultsUrl;
@end

@implementation ImageSearchObject

- (id)initWithDictionary:(NSDictionary*)imageSearchResultDictionary
{
    self = [self init];
    if (self)
    {
        NSMutableArray* resultObjects = nil;
        NSDictionary* responseDictionary = CHECKFORNSNULL(imageSearchResultDictionary[@"responseData"]);
        if (responseDictionary)
        {
            NSDictionary* cursorDictionary = CHECKFORNSNULL(responseDictionary[@"cursor"]);
            if (cursorDictionary)
            {
                self.moreResultsUrl = CHECKFORNSNULL(cursorDictionary[@"moreResultsUrl"]);
            }
            
            NSArray* resultsArray = CHECKFORNSNULL(responseDictionary[@"results"]);
            resultObjects = [NSMutableArray arrayWithCapacity:[resultsArray count]];
            for (NSDictionary* resultDictionary in resultsArray)
            {
                ImageResultObject* resultObject = [[ImageResultObject alloc] initWithResultDictionary:resultDictionary];
                [resultObjects addObject:resultObject];
            }
        }
        self.resultImageObjectArray = resultObjects;
    }
    return self;
}

- (NSArray*)resultImageObjects
{
    return _resultImageObjectArray;
}

//- (void)fetchNextResults
//{
//    NSURL *googleRequestURL=[NSURL URLWithString:_moreResultsUrl];
//    NSURLRequest* request = [NSURLRequest requestWithURL:googleRequestURL];
//    [NSURLConnection sendAsynchronousRequest:request
//                                       queue:_queue
//                           completionHandler:^(NSURLResponse* response, NSData* data, NSError* connectionError){
//                               [self performSelectorOnMainThread:@selector(fetchedImageData:) withObject:data waitUntilDone:NO];
//                           }];
//}

@end
