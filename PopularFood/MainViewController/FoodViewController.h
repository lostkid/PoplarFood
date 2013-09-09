//
//  FoodViewController.h
//  PopularFood
//
//  Created by Zoe on 13-8-30.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodListTableViewController.h"

@interface FoodViewController : UIViewController
{
}

@property(nonatomic,strong) NSArray *foodListArray;
@property(nonatomic,strong) FoodListTableViewController *commonFoodListVC;

@end
