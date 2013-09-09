//
//  FoodViewController.m
//  PopularFood
//
//  Created by Zoe on 13-8-30.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "FoodViewController.h"
#import "DetailViewController.h"

@interface FoodViewController ()

@end

@implementation FoodViewController

- (id)init{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor clearColor];

    _commonFoodListVC =[[FoodListTableViewController alloc] initWithStyle:UITableViewStylePlain];
//    _commonFoodListVC.foodListArray=_foodListArray;
    [self.view addSubview:_commonFoodListVC.view];
    
    [_commonFoodListVC.view setFrame:self.view.bounds];
    [self addChildViewController:_commonFoodListVC];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)setFoodListArray:(NSArray *)foodListArray{
    
    _commonFoodListVC.foodListArray=foodListArray;
    [_commonFoodListVC.tableView reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
