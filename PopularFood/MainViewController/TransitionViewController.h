//
//  TransitionViewController.h
//  PopularFood
//
//  Created by Zoe on 13-9-2.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationView.h"
#import "MainViewController.h"
#import "CustomizedTableViewCell.h"
#import "DetailImageView.h"

@interface TransitionViewController : UIViewController<UINavigationViewDelegate,DidPushSetViewControllerDelegate,CustomizedTableViewCellDelegate,DetailImageViewDelegate>
{
    UINavigationView *m_currentView;
    DetailImageView *detailImageView;
}

@property (nonatomic,strong) UINavigationView *rootView;

+ (TransitionViewController *)sharedInstance;

- (void)addSubView:(UIView *)subView;

- (void)pushView:(id)sender;
- (void)popView:(id)sender;

@end
