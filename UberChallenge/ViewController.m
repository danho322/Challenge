//
//  ViewController.m
//  UberChallenge
//
//  Created by Daniel on 3/20/15.
//  Copyright (c) 2015 WorthlessApps. All rights reserved.
//

#import "ViewController.h"
#import "ImageSearcher.h"

@interface ViewController ()
@property (nonatomic, strong) ImageSearcher* imageSearcher;
@property (nonatomic, strong) UITextField* searchField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageSearcher = [[ImageSearcher alloc] init];
    
    CGSize screenSize = APP_FRAME.size;
    
    CGFloat textFieldWidth = 150;
    self.searchField = [[UITextField alloc] initWithFrame:CGRectMake((screenSize.width - textFieldWidth) / 2, 100, textFieldWidth, 40)];
    [_searchField setPlaceholder:@"Enter a search term"];
    [self.view addSubview:_searchField];
    
    UIButton* searchButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    [searchButton setCenter:CGPointMake(_searchField.center.x, _searchField.center.y + 20)];
    [searchButton setTitle:@"Search!" forState:UIControlStateNormal];
    [searchButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(onSearchTap) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Handler

- (void)onSearchTap
{
    [_imageSearcher searchTerm:_searchField.text
                 completeBlock:^(NSArray* imageUrls){
    
                 }];
}

@end
