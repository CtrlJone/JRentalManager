//
//  JUIViewController.m
//  JRentalManager
//
//  Created by Jone on 15/3/30.
//  Copyright (c) 2015年 Jone. All rights reserved.
//

#import "JUIViewController.h"
#import "JRootViewController.h"

@interface JUIViewController ()

@property (nonatomic,strong) UIImageView *bgImage;

@end

@implementation JUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;//四周边缘向四周延伸
    _bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, JSCREEN_WIDTH, JSCREEN_HEIGHT)];
}

#pragma mark - initBaritem

- (void) setLeftBaritem:(JUIViewController *) idClass
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"burger"] style:UIBarButtonItemStylePlain target:idClass action:@selector(showMenu)];
}

#pragma mark - Rewrite setTitle for custom tabbar
- (void) setTitle:(NSString *)title
{
    self.navigationItem.title = title;
}

#pragma mark - Rewrite setBackgroundImage
- (void) setbgImageWithName:(NSString *)ImageName
{
    [self.view insertSubview:_bgImage atIndex:0];
    if (ImageName) {
        _bgImage.image = [UIImage imageNamed:ImageName];
    }else
    {
        _bgImage.image = [UIImage imageNamed:@"bgCommon"];
    }
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
