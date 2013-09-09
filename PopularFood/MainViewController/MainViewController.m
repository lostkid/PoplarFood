//
//  MainViewController.m
//  PopularFood
//
//  Created by Zoe on 13-8-29.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "NavigationBarItem.h"
#import "FoodInsertDatabase.h"

#define PAGE_CONTROLLER_WIDTH 10


@interface MainViewController ()

@end

@implementation MainViewController
@synthesize favouredFoodViewController,foodViewController;


static MainViewController *_sharedInstance = nil;

+(MainViewController *)sharedInstance{
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
    navigationTitles =@[@"人气美食",@"收藏"];

    UIImageView *backgroundView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    backgroundView.contentMode=UIViewContentModeScaleAspectFit;
    backgroundView.frame=CGRectMake(0,0, self.view.frame.size.width, ContentViewHeight);
    [self.view addSubview:backgroundView];
    
    //自定义导航栏按钮
    self.navigationItem.rightBarButtonItem=[NavigationBarItem createRightNavigationBarItemWithNormalImage:@"setting.png" andSelectedImage:@"settingSelected.png" controller:self];
    
    pageScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,ContentViewHeight)];
    pageScrollView.pagingEnabled = YES;
    pageScrollView.delegate=self;
    pageScrollView.bounces=NO;
    pageScrollView.contentSize=CGSizeMake(self.view.frame.size.width*2, ContentViewHeight);
    pageScrollView.showsHorizontalScrollIndicator=NO;
    [self.view addSubview:pageScrollView];

	pageControl =[[UIPageControl alloc] initWithFrame:CGRectMake(0, 32, self.view.frame.size.width, PAGE_CONTROLLER_WIDTH)];
    pageControl.numberOfPages=2;
    pageControl.currentPage=0;
    [pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventTouchUpInside];
    [[self.navigationController view] addSubview:pageControl];
 
   foodViewController =[[FoodViewController alloc] init];
   foodViewController.view.frame=CGRectMake(0, 0, self.view.frame.size.width, pageScrollView.frame.size.height);
   [self addChildViewController:foodViewController];
    [pageScrollView addSubview:foodViewController.view];

   favouredFoodViewController =[[FavouredFoodViewController alloc] init];
   favouredFoodViewController.view.frame=CGRectMake(self.view.frame.size.width, 0, self.view.frame.size.width, pageScrollView.frame.size.height);
    [pageScrollView addSubview:favouredFoodViewController.view];
   [self addChildViewController:favouredFoodViewController];
    
    self.title=[navigationTitles objectAtIndex:pageControl.currentPage];

    //网络获取数据
    [self getFoodArrayDataFromNet];
}

//网络获取数据
- (void)getFoodArrayDataFromNet{
    [Food getFoodInfo:nil WithBlock:^(NSArray *foodArray) {
        
        foodViewController.foodListArray=foodArray;
    }];
}

#pragma mark--
#pragma mark--GetFavArrayFromLikeSql
-(NSArray *)getFavFoodArray{
    NSArray *favArray = [FoodInsertDatabase findAllIsLikeFoodFromLikeTable];
    return favArray;
}

#pragma mark--
#pragma mark--UIBarButtonItemDelegate
-(void)pushToSetterVC{
    if ([self.delegate respondsToSelector:@selector(didPushSetViewController)]) {
        
        [self.delegate performSelector:@selector(didPushSetViewController)];
    }
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)reloadData:(NSInteger)currentPage{
    
    if (currentPage==0) {
        tableViewType=HomeTableViewType;
        [self getFoodArrayDataFromNet];//网络获取数据，如果没有网络数据库中查询

    }else{
        tableViewType=LikeTableViewType;
        favouredFoodViewController.foodListArray=[self getFavFoodArray];//收藏表中查询
    }
}

#pragma mark--
#pragma mark--pageControlSelector
- (void)pageControlClick:(id)sender{
    
    UIPageControl *_pageControl = (UIPageControl *)sender;
    
    pageScrollView.contentOffset= CGPointMake(pageScrollView.frame.size.width*_pageControl.currentPage, 0);
    
    self.title = [navigationTitles objectAtIndex:_pageControl.currentPage];

    [self reloadData:_pageControl.currentPage];
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint offsetofScrollView = scrollView.contentOffset;
    [pageControl setCurrentPage:offsetofScrollView.x / pageScrollView.frame.size.width];
    
    self.title = [navigationTitles objectAtIndex:pageControl.currentPage];

    [self reloadData:pageControl.currentPage];
}

#pragma mark--
#pragma mark--egoRefreshDelegate
- (void)egoRefreshTableHeaderReloadData{
    
    if (tableViewType==HomeTableViewType) {
        [self getFoodArrayDataFromNet];
    }else{
        favouredFoodViewController.foodListArray=[self getFavFoodArray];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end
