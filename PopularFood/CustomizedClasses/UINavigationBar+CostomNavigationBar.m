//
//  UINavigationBar+CostomNavigationBar.m
//  BQ
//
//  Created by Zoe on 13-4-1.
//  Copyright (c) 2013年 zzlmilk. All rights reserved.
//backArrows


#import "UINavigationBar+CostomNavigationBar.h"

@implementation UINavigationBar (CostomNavigationBar)

- (UIImage *)barBackground
{
    return [UIImage imageNamed:@"navigationBar"];
}


- (void)didMoveToSuperview
{
    
    if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)])
    {
        [self setBackgroundImage:[self barBackground] forBarMetrics:UIBarMetricsDefault];
    }
    
    UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:17];
    
    NSDictionary *attr = [[NSDictionary alloc] initWithObjectsAndKeys:font, UITextAttributeFont,[UIColor whiteColor],UITextAttributeTextColor, nil];
    [self setTitleTextAttributes:attr];
    
}





@end
