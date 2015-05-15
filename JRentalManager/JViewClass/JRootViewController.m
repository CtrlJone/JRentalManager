//
//  JRootViewController.m
//  JRentalManager
//
//  Created by Jone on 15/4/1.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import "JRootViewController.h"
#import "RNFrostedSidebar.h"
#import <Colours.h>

#import "JShowViewController.h"
#import "JSettingViewController.h"

@interface JRootViewController ()<RNFrostedSidebarDelegate>
{
    RNFrostedSidebar *_sidebar;
    JNavigationController *_navi;
    NSInteger _selectIndex;
}
@property (nonatomic, strong) NSMutableIndexSet *indexSet;


@end

@implementation JRootViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _navi = [[JNavigationController alloc] init];
        _selectIndex = 0;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:_navi.view];
    
    [self initSidebar];
    
    [self loadCenterVC:0];
}

#pragma mark - initSidebar
- (void) initSidebar
{
    NSArray *images = @[[UIImage imageNamed:@"burger"],[UIImage imageNamed:@"set"]];
    NSArray *colors = @[[UIColor pinkColor],[UIColor bananaColor]];
    
    _sidebar = [[RNFrostedSidebar alloc] initWithImages:images selectedIndices:[NSMutableIndexSet indexSetWithIndex:0] borderColors:colors];
    _sidebar.isSingleSelect = YES;
    _sidebar.delegate = self;
}


#pragma mark - loadCenterVC
- (void) loadCenterVC:(NSUInteger) selIndex
{
    JUIViewController *centerVC;
    if (selIndex == 0) {
        centerVC = [[JShowViewController alloc] init];
        [centerVC setbgImageWithName:nil];
    }
    if (selIndex == 1) {
        centerVC = [[JSettingViewController alloc] init];
    }
    [centerVC setLeftBaritem:self];
   
    [_navi setViewControllers:@[centerVC] animated:NO];
}

- (void) showMenu
{
    [_sidebar show];
}

#pragma mark - RNFrostedSidebarDelegate
- (void)sidebar:(RNFrostedSidebar *)sidebar didTapItemAtIndex:(NSUInteger)index {
    
    [sidebar dismissAnimated:YES completion:^(BOOL finished) {
        if (_selectIndex != index) {
            [self loadCenterVC:index];
            _selectIndex = index;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
