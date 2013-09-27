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
    
    NSDictionary *attr;
    
    if (IOS_Verson==5.0f) {
        attr = [[NSDictionary alloc] initWithObjectsAndKeys:font,UITextAttributeFont,[UIColor whiteColor],UITextAttributeTextColor,[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0],UITextAttributeTextShadowColor,[NSValue valueWithUIOffset:UIOffsetMake(0, 0.5)],UITextAttributeTextShadowOffset,nil];

    }else{
        attr = [[NSDictionary alloc] initWithObjectsAndKeys:font, NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName,nil];
    }
    
    [self setTitleTextAttributes:attr];
    
}





@end
