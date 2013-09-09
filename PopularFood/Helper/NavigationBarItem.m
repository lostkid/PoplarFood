//
//  NavigationBarItem.m
//  PopularFood
//
//  Created by Zoe on 13-9-3.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "NavigationBarItem.h"

@implementation NavigationBarItem

+ (UIBarButtonItem *)createRightNavigationBarItemWithNormalImage:(NSString *)image andSelectedImage:(NSString *)selectedImage controller:(UIViewController *)controller{
    UIButton *setBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,5, 30, 30)];
    [setBtn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [setBtn setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    [setBtn addTarget:controller action:@selector(pushToSetterVC) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *setBtnItem = [[UIBarButtonItem alloc] initWithCustomView:setBtn];
    return setBtnItem;
}

+ (UIBarButtonItem *)createLeftNavigationBarItemWithNormalImage:(NSString *)image andSelectedImage:(NSString *)selectedImage controller:(UIViewController *)controller{

    UIButton *setBtn = [[UIButton alloc] initWithFrame:CGRectMake(0,5, 30, 30)];
    [setBtn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [setBtn setBackgroundImage:[UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    [setBtn addTarget:controller action:@selector(popView:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *setBtnItem = [[UIBarButtonItem alloc] initWithCustomView:setBtn];
    return setBtnItem;

}



@end
