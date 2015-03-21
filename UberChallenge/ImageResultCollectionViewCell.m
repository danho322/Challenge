//
//  ImageResultCollectionViewCell.m
//  UberChallenge
//
//  Created by Daniel on 3/20/15.
//  Copyright (c) 2015 WorthlessApps. All rights reserved.
//

#import "ImageResultCollectionViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface ImageResultCollectionViewCell()
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UIActivityIndicatorView* activityIndicator;
@end
@implementation ImageResultCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_imageView setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:_imageView];
        
        self.activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _activityIndicator.hidesWhenStopped = YES;
        [_activityIndicator setCenter:CGPointMake(frame.size.width / 2, frame.size.height / 2)];
        [self addSubview:_activityIndicator];
        [_activityIndicator startAnimating];
        
        [self.layer setCornerRadius:5];
        [self.layer setMasksToBounds:YES];
    }
    return self;
}

- (void)setImage:(UIImage*)image
{
    [_imageView setImage:image];
}

- (void)updateWithImageUrl:(NSString*)imageUrl
{
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]];
    __weak ImageResultCollectionViewCell* welf = self;
    [_imageView setImageWithURLRequest:request
                      placeholderImage:nil
                               success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image){
                                   [welf.activityIndicator stopAnimating];
                                   [welf.imageView setImage:image];
                               }
                               failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error){
                                   [welf.activityIndicator stopAnimating];
                               }];
}

@end
