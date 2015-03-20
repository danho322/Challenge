//
//  ImageSearcher.h
//  UberChallenge
//
//  Created by Daniel on 3/20/15.
//  Copyright (c) 2015 WorthlessApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface ImageSearcher : NSObject

- (void)searchTerm:(NSString*)searchTerm completeBlock:(ArrayParameterBlock)imageUrls;

@end
