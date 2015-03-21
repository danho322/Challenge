//
//  ImageResultObject.m
//  UberChallenge
//
//  Created by Daniel on 3/20/15.
//  Copyright (c) 2015 WorthlessApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageResultObject.h"
#import "Constants.h"

@interface ImageResultObject()
@property CGSize imageSize;
@property (nonatomic, strong) NSString* imageUrl;
@property (nonatomic, strong) NSString* visibleUrl;
@end

@implementation ImageResultObject

- (id)initWithResultDictionary:(NSDictionary*)resultDictionary
{
    self = [self init];
    if (self)
    {
        CGFloat width = 0;
        CGFloat height = 0;
        
        NSNumber* widthNum = CHECKFORNSNULL(resultDictionary[@"width"]);
        NSNumber* heightNum = CHECKFORNSNULL(resultDictionary[@"height"]);
        
        if (widthNum)
        {
            width = [widthNum floatValue];
        }
        
        if (heightNum)
        {
            height = [heightNum floatValue];
        }
        
        self.imageSize = CGSizeMake(width, height);
        self.imageUrl = CHECKFORNSNULL(resultDictionary[@"url"]);
        self.visibleUrl = CHECKFORNSNULL(resultDictionary[@"visibleUrl"]);
    }
    return self;
}

- (NSString*)imageResultUrl
{
    return _imageUrl;
}

@end
