//
//  FavouredFoodViewController.m
//  PopularFood
//
//  Created by Zoe on 13-8-30.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "FavouredFoodViewController.h"

@interface FavouredFoodViewController ()

@end

@implementation FavouredFoodViewController

- (id)init
{
    self = [super init];
    if (self) {
        

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor clearColor];

    _favListTableVC =[[FoodListTableViewController alloc] initWithStyle:UITableViewStylePlain];
    _favListTableVC.foodListArray=_foodListArray;
    [_favListTableVC.view setFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_favListTableVC.view];
    [self addChildViewController:_favListTableVC];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}

-(void)setFoodListArray:(NSArray *)foodListArray{
    _favListTableVC.foodListArray=foodListArray;
    [_favListTableVC.tableView reloadData];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
