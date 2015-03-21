//
//  ImageDisplayDataSource.h
//  UberChallenge
//
//  Created by Daniel on 3/20/15.
//  Copyright (c) 2015 WorthlessApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString * CellIdentifier = @"CollectionCellIdentifier";

@interface ImageDisplayDataSource : NSObject <UICollectionViewDataSource>

- (id)initWithImageResultObjects:(NSArray*)imageResultObjects;

@end
