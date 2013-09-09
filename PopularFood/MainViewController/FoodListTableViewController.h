//
//  FoodListTableViewController.h
//  PopularFood
//
//  Created by Zoe on 13-8-30.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadMoreView.h"

#import "EGORefreshTableHeaderView.h"

@protocol foodListTableViewControllerDelegate <NSObject>

-(void)didSelectedTableViewCellToDetail:(id)food;

@end

@protocol FoodListTableViewEgoRefreshTableHeaderDelegate <NSObject>
-(void)egoRefreshTableHeaderReloadData;
@end

@interface FoodListTableViewController : UITableViewController<UITableViewDataSource,UITableViewDelegate>
{
    @private 
        BOOL _reloading;
        LoadMoreView *loadMoreView;
        EGORefreshTableHeaderView *_refreshTableView;
}

@property(nonatomic,strong) NSArray *foodListArray;
@property(nonatomic,weak) id<foodListTableViewControllerDelegate> mainDelegate;
@property(nonatomic,weak) id<FoodListTableViewEgoRefreshTableHeaderDelegate> refreshDelegate;


@end
