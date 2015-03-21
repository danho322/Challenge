//
//  ImageDisplayView.m
//  UberChallenge
//
//  Created by Daniel on 3/20/15.
//  Copyright (c) 2015 WorthlessApps. All rights reserved.
//

#import "ImageDisplayView.h"
#import "ImageDisplayDataSource.h"
#import "ImageResultCollectionViewCell.h"

@interface ImageDisplayView() <UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong) ImageDisplayDataSource* dataSource;
@end

@implementation ImageDisplayView

- (id)initWithFrame:(CGRect)frame imageResultObjects:(NSArray*)imageResultObjects
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.dataSource = [[ImageDisplayDataSource alloc] initWithImageResultObjects:imageResultObjects];
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, frame.size.width, frame.size.height - 100) collectionViewLayout:layout];
        [_collectionView setDataSource:_dataSource];
        [_collectionView setDelegate:self];
        [_collectionView registerClass:[ImageResultCollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        [self addSubview:_collectionView];
        
        UIButton* backButton = [[UIButton alloc] initWithFrame:CGRectMake(15, 15, 70, 30)];
        [backButton setTitle:@"<Back" forState:UIControlStateNormal];
        [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(onBackTap) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backButton];
    }
    return self;
}

#pragma mark - Button Handler

- (void)onBackTap
{
    [self removeFromSuperview];
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSInteger row = indexPath.row;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 185);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return  UIEdgeInsetsMake(5, 5, 5, 5);
}

@end
