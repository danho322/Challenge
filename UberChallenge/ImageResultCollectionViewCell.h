//
//  ImageResultCollectionViewCell.h
//  UberChallenge
//
//  Created by Daniel on 3/20/15.
//  Copyright (c) 2015 WorthlessApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageResultCollectionViewCell : UICollectionViewCell

- (void)updateWithImageUrl:(NSString*)imageUrl;
- (void)setImage:(UIImage*)image;

@end
