//
//  FoodListTableViewController.m
//  PopularFood
//
//  Created by Zoe on 13-8-30.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "FoodListTableViewController.h"
#import "TransitionViewController.h"
#import "CustomizedTableViewCell.h"
#import "FoodInsertDatabase.h"
@interface FoodListTableViewController ()

@end

@implementation FoodListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
      
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tableView.backgroundColor=[UIColor clearColor];
    self.tableView.backgroundView=nil;

    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    _mainDelegate=(id)[TransitionViewController sharedInstance];
    _refreshDelegate=(id)[MainViewController sharedInstance];
 
    //下拉刷新
    if (_refreshTableView == nil) {
        //初始化下拉刷新控件
        EGORefreshTableHeaderView *refreshView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height, self.view.frame.size.width, self.tableView.bounds.size.height)];
        refreshView.delegate = (id)self;
        [self.tableView addSubview:refreshView];
        _refreshTableView = refreshView;
    }
    
    //加载更多
//    loadMoreView = [[LoadMoreView alloc] initWithFrame:CGRectMake(0,0, self.view.bounds.size.width,50)];
//    self.tableView.tableFooterView =loadMoreView;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 159;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _foodListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FoodListCell";
    CustomizedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    Food *food = [_foodListArray objectAtIndex:indexPath.row];
    Food *_food =[FoodInsertDatabase findIsLikeFoodFromLikeTable:food];
    NSLog(@"food_id %d,food_is_like %@",food.foodId,_food);
    
//    if (!cell) {
        cell = [[CustomizedTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.delegate=[TransitionViewController sharedInstance];

        if (_food) {
           food.isLiked=1;
        }
        
        cell.food=food;
        
//    }
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.mainDelegate respondsToSelector:@selector(didSelectedTableViewCellToDetail:)]) {
       
        [self.mainDelegate didSelectedTableViewCellToDetail:[_foodListArray objectAtIndex:indexPath.row]];
        
    }
    
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods
//滚动控件的委托方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    [_refreshTableView egoRefreshScrollViewDidScroll:scrollView];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(scrollView.contentOffset.y <= -60)	{
        
        [_refreshTableView egoRefreshScrollViewDidEndDragging:scrollView];
    
    }else if(scrollView.contentOffset.y>60){
//        [loadMoreView.spinner startAnimating];
//        NSLog(@"loadmore~");
    }
}

#pragma mark -
#pragma mark Data Source Loading / Reloading Methods
-(void)reloadTableViewDataSource
{
    NSLog(@"==开始加载数据");
    if ([self.refreshDelegate respondsToSelector:@selector(egoRefreshTableHeaderReloadData)]) {
        [self.refreshDelegate performSelector:@selector(egoRefreshTableHeaderReloadData)];
    }
    _reloading = YES;
    
}
- (void)doneLoadingTableViewData{
    
    NSLog(@"===加载完数据");
    _reloading = NO;
    [_refreshTableView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
    
    
}
#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods
//下拉被触发调用的委托方法
-(void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView *)view
{
    [self reloadTableViewDataSource];
    [self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:2.0];
    
}

//返回当前是刷新还是无刷新状态
-(BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView *)view
{
    return _reloading;
}

//返回刷新时间的回调方法
-(NSDate *)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView *)view
{
    return [NSDate date];
}


@end
