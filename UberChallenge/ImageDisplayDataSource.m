//
//  ImageDisplayDataSource.m
//  UberChallenge
//
//  Created by Daniel on 3/20/15.
//  Copyright (c) 2015 WorthlessApps. All rights reserved.
//

#import "ImageDisplayDataSource.h"
#import "ImageResultObject.h"
#import "ImageResultCollectionViewCell.h"

@interface ImageDisplayDataSource()
@property (nonatomic, strong) NSArray* imageResultArray;
@end

@implementation ImageDisplayDataSource

- (id)initWithImageResultObjects:(NSArray*)imageResultObjects
{
    self = [self init];
    if (self)
    {
        self.imageResultArray = imageResultObjects;
    }
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger count = [_imageResultArray count];
    return count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = indexPath.row;
    ImageResultCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    ImageResultObject* imageObject = _imageResultArray[row];
//    [cell updateWithImageUrl:[imageObject imageResultUrl]];

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSString* imageUrl = [imageObject imageResultUrl];
        NSData* imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        UIImage* image = [UIImage imageWithData:imageData];
        
        UICollectionViewCell* cell = [collectionView cellForItemAtIndexPath:indexPath];
        ImageResultCollectionViewCell* collectionCell = (ImageResultCollectionViewCell*)cell;
        dispatch_async(dispatch_get_main_queue(), ^{
            [collectionCell setImage:image];
        });
    });
    
    return cell;
}

@end
