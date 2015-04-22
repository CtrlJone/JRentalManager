//
//  JNavigationController.m
//  JRentalManager
//
//  Created by Jone on 15/4/1.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import "JNavigationController.h"
#import <Colours.h>
#import "RNFrostedSidebar.h"

#import "JShowViewController.h"
#import "JSettingViewController.h"


@interface JNavigationController ()<RNFrostedSidebarDelegate>

@end

@implementation JNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavigationBar];
}

#pragma mark - initNavigationBar
- (void) initNavigationBar
{
    self.navigationBar.barTintColor = [UIColor hollyGreenColor];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName: [UIFont systemFontOfSize:16]}];
}

#pragma mark - popViewController
- (void) popViewController
{
    [self popViewControllerAnimated:YES];
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
