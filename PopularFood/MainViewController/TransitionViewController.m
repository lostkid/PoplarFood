//
//  TransitionViewController.m
//  PopularFood
//
//  Created by Zoe on 13-9-2.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "TransitionViewController.h"
#import "DetailViewController.h"
#import "SetViewController.h"
#import "AppDelegate.h"
#import "Food.h"

#import "FoodInsertDatabase.h"

#define NavigationBarHeight 44

@interface TransitionViewController ()

@end

@implementation TransitionViewController
@synthesize rootView;

static TransitionViewController *_sharedInstance = nil;

+(TransitionViewController *)sharedInstance{
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _sharedInstance=self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
        
    rootView = [[UINavigationView alloc] initWithFrame:self.view.bounds];
    rootView.backgroundColor = [UIColor clearColor];
    rootView.delegate = self;
    [self.view addSubview:rootView];
    [self setCurrentView:rootView];
    
    MainViewController *mainVC =[[MainViewController alloc] init];
    mainVC.delegate=self;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mainVC];
    mainVC.view.frame=CGRectMake(0,44, self.view.frame.size.width, ContentViewHeight);
    [rootView addSubview:nav.view];
    [self addChildViewController:nav];
    
}

#pragma mark--
#pragma mark--收藏与未收藏按钮切换
// 后端更改收藏状态 like or unlike 
- (void)didSelectedLikedButtonClick:(id)sender withFoodModel:(Food *)food{

    UIButton *btn = (UIButton *)sender;
    
    if (!food.isLiked) {
        [btn setImage:[UIImage imageNamed:@"collectSelected.png"] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:253/255.0f green:217/255.0f blue:72/255.0f alpha:1.0f] forState:UIControlStateNormal];
        [btn setTitle:@"已收藏" forState:UIControlStateNormal];
    }else{
        [btn setImage:[UIImage imageNamed:@"collect.png"] forState:UIControlStateNormal];
        [btn setTitle:@"收藏" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.selected=YES;
    }
    
    //更新数据库中状态
    food.isLiked=!food.isLiked;
    [self changeFoodLikeStatusFromLocalDataBase:food];
}

//更改sqlite本地数据 相关字段
- (void)changeFoodLikeStatusFromLocalDataBase:(Food *)food{
    [FoodInsertDatabase updateFoodStatusBeforeTodayFromDatabase:food];

    if (food.isLiked==1) {
        [FoodInsertDatabase insertFavDB:food];
    }else{
        [FoodInsertDatabase deleteFoodFromSqlite:food];
    }

}

//调用接口
//- (void)changeFoodLikeStatusFromServer{
//}

#pragma mark--
#pragma mark--MainViewController_SetViewController_delegate

-(void)didPushSetViewController{

    [self pushView:nil];
    
    DetailViewController *detailVC = [DetailViewController sharedInstance];
    [detailVC changeViewToSetView];
    
}

#pragma mark--
#pragma mark--TableViewDidSelectDelegate
- (void)didSelectedTableViewCellToDetail:(id)food{
//    DetailViewController *detailVC =[DetailViewController sharedInstance];
//    detailVC.food=(Food *)food;
//    
//    [detailVC removeSetView];
//    [self pushView:nil];
    //******显示大图*****//
    Food *_food = food;
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    
        detailImageView =[[DetailImageView alloc] initWithFrame:[keyWindow bounds] withImageUrl:_food.imageUrlStr];
        detailImageView.delegate=self;
        [keyWindow addSubview:detailImageView];
  
}

#pragma mark--
#pragma mark--DetailImageViewDelegate
- (void)touchDetailViewHidden{
    [detailImageView removeFromSuperview];

}

- (void)addSubView:(UIView *)subView
{
    CGRect rcSubView = subView.frame;
    rcSubView.origin.x = [[UIScreen mainScreen] bounds].size.width;
    rcSubView.origin.y = 0;
    [subView setFrame:rcSubView];
    
    [self.view addSubview:subView];
}

- (void)pushView:(id)sender
{
    [m_currentView pushView];
}

- (void)popView:(id)sender
{
    [m_currentView popView];
}

- (void) setCurrentView:(UIView *)currentView
{
    m_currentView = (UINavigationView *)currentView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
