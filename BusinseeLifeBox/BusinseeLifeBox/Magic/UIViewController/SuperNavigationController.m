//
//  SuperNavigationController.m
//  BusinseeLifeBox
//
//  Created by admin on 2020/3/26.
//  Copyright © 2020 admin. All rights reserved.
//

#import "SuperNavigationController.h"

@interface SuperNavigationController ()

@end

@implementation SuperNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count==1) {
        viewController.hidesBottomBarWhenPushed = YES; //viewController是将要被push的控制器
    }
    [super pushViewController:viewController animated:animated];
    
}
- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
                  complete:(void(^)(BOOL finished))block{
    if (self.childViewControllers.count==1) {
        viewController.hidesBottomBarWhenPushed = YES; //viewController是将要被push的控制器
    }
    [super pushViewController:viewController animated:animated complete:block];
    
}

@end
