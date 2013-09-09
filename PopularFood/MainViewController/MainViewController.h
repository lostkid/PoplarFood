//
//  MainViewController.h
//  PopularFood
//
//  Created by Zoe on 13-8-29.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodViewController.h"
#import "FavouredFoodViewController.h"

#import "FoodListTableViewController.h"

@protocol DidPushSetViewControllerDelegate <NSObject>

-(void)didPushSetViewController;
@end

typedef NS_ENUM(NSUInteger, TableViewType) {
    HomeTableViewType,
    LikeTableViewType
};

@interface MainViewController : UIViewController<UIScrollViewDelegate,FoodListTableViewEgoRefreshTableHeaderDelegate>
{
    @private
    UIPageControl *pageControl;
    UIScrollView *pageScrollView;
    
    
    NSArray *navigationTitles;
    BOOL _reloading;
    TableViewType tableViewType;
}

+(MainViewController *)sharedInstance;

@property(nonatomic,strong) NSArray *totalArrays;
@property(nonatomic,weak) id<DidPushSetViewControllerDelegate> delegate;
@property(nonatomic,strong) FavouredFoodViewController *favouredFoodViewController;
@property(nonatomic,strong) FoodViewController *foodViewController;
@end
