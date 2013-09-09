//
//  FoodInsertDatabase.h
//  PopularFood
//
//  Created by Zoe on 13-9-5.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Food.h"

@interface FoodInsertDatabase : NSObject

+ (void)insertDB:(Food *)food;//增
+ (void)insertFavDB:(Food *)food;

+ (NSArray *)getFoodFromSqliteWithoutNet;//查

+ (void)updateFoodStatusBeforeTodayFromDatabase:(Food *)food;//改
+ (void)deleteFoodFromSqlite:(Food *)food;

+ (Food *)findIsLikeFoodFromLikeTable:(Food *)food;

+ (NSArray *)findAllIsLikeFoodFromLikeTable;

@end
