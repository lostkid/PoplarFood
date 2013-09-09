//
//  NavigationBarItem.h
//  PopularFood
//
//  Created by Zoe on 13-9-3.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NavigationBarItem : NSObject


+ (UIBarButtonItem *)createRightNavigationBarItemWithNormalImage:(NSString *)image andSelectedImage:(NSString *)selectedImage controller:(UIViewController *)controller;

+ (UIBarButtonItem *)createLeftNavigationBarItemWithNormalImage:(NSString *)image andSelectedImage:(NSString *)selectedImage controller:(UIViewController *)controller;


@end
