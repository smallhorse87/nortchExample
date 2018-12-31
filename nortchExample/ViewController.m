//
//  ViewController.m
//  nortchExample
//
//  Created by mac on 2018/12/29.
//  Copyright © 2018 mac. All rights reserved.
//

#import "ViewController.h"

#import <Masonry.h>

#define kStatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define kIS_IPHONE_X (kStatusBarHeight >= 44.0f)

#define INTERFACE_IS_IPHONEX  (@available(iOS 11.0, *) && ([UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom > 0)?YES:NO)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBarHidden = YES;

    [self buildUI];

    NSLog(@"松 viewDidLoad top: %lf",
          [[UIApplication sharedApplication] statusBarFrame].size.height
          );
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"松 viewDidLoad top: %lf, bottom:%lf, left:%lf, right:%lf",
          [UIApplication sharedApplication].keyWindow.safeAreaInsets.top,
          [UIApplication sharedApplication].keyWindow.safeAreaInsets.bottom,
          [UIApplication sharedApplication].keyWindow.safeAreaInsets.left,
          [UIApplication sharedApplication].keyWindow.safeAreaInsets.right
          );
    //top: 44.000000, bottom:34.000000, left:0.000000, right:0.000000
    //top: 0.000000,  bottom:21.000000, left:44.000000, right:44.000000
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{

}

- (void)buildUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
            make.left.equalTo(self.view.mas_safeAreaLayoutGuideLeft);
            make.right.equalTo(self.view.mas_safeAreaLayoutGuideRight);
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.leading.trailing.top.bottom.equalTo(self.view);
        }

    }];
}

@end
