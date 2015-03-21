//
//  ImageSearcher.m
//  UberChallenge
//
//  Created by Daniel on 3/20/15.
//  Copyright (c) 2015 WorthlessApps. All rights reserved.
//

#import "ImageSearcher.h"
#import "ImageSearchObject.h"
#import "Constants.h"

@interface ImageSearcher()
@property (nonatomic, strong) NSOperationQueue* queue;
@property (nonatomic, strong) ArrayParameterBlock completeBlock;
@end

@implementation ImageSearcher

- (id)init
{
    self = [super init];
    if (self)
    {
        self.queue = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (void)searchTerm:(NSString*)searchTerm completeBlock:(ArrayParameterBlock)imageUrls
{
    if (!searchTerm)
    {
        return;
    }
    
    self.completeBlock = imageUrls;
    NSString *url = [NSString stringWithFormat:@"https://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=%@", searchTerm];
    url = [url stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    //Formulate the string as a URL object.
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    NSURLRequest* request = [NSURLRequest requestWithURL:googleRequestURL];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:_queue
                           completionHandler:^(NSURLResponse* response, NSData* data, NSError* connectionError){
                               
                               [self performSelectorOnMainThread:@selector(fetchedImageData:) withObject:data waitUntilDone:NO];
                           }];

}

- (void)fetchedImageData:(NSData*)responseData
{
    if (!responseData)
    {
        return;
    }
    
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&error];
    if (!error && json)
    {
        ImageSearchObject* searchResponseObject = [[ImageSearchObject alloc] initWithDictionary:json];
        
        if (_completeBlock)
        {
            _completeBlock([searchResponseObject resultImageObjects]);
        }
    }
}

@end
