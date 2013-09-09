//
//  FoodInsertDatabase.m
//  PopularFood
//
//  Created by Zoe on 13-9-5.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "FoodInsertDatabase.h"
#import "DBConnection.h"

@implementation FoodInsertDatabase

//增
+ (void)insertDB:(Food *)food{
    static Statement *stmt = nil;
    if (stmt == nil) {
        stmt = [DBConnection statementWithQuery:"INSERT INTO food_list (food_id,restaurant_name,hot_food_name,average_spend,location,busy_hour,image_url,is_like) VALUES(?,?,?,?,?,?,?,?)"];
    }
    
    [stmt bindInt32:food.foodId forIndex:1];
    [stmt bindString:food.restaurantNameStr forIndex:2];
    [stmt bindString:food.hotFoodStr forIndex:3];
    [stmt bindString:food.averageSpendStr forIndex:4];
    [stmt bindString:food.locationStr forIndex:5];
    [stmt bindString:food.busyHourStr forIndex:6];
    [stmt bindString:food.imageUrlStr forIndex:7];
    [stmt bindInt32:food.isLiked forIndex:8];
    
    int step = [stmt step];
    if (step != SQLITE_DONE) {
		NSLog(@"insert error errorcode =%d ",step);
    }
    [stmt reset];
}

//增
+ (void)insertFavDB:(Food *)food{
    static Statement *stmt = nil;
    if (stmt == nil) {
        stmt = [DBConnection statementWithQuery:"INSERT INTO like_food_list (food_id,restaurant_name,hot_food_name,average_spend,location,busy_hour,image_url,is_like) VALUES(?,?,?,?,?,?,?,?)"];
    }
    
    [stmt bindInt32:food.foodId forIndex:1];
    [stmt bindString:food.restaurantNameStr forIndex:2];
    [stmt bindString:food.hotFoodStr forIndex:3];
    [stmt bindString:food.averageSpendStr forIndex:4];
    [stmt bindString:food.locationStr forIndex:5];
    [stmt bindString:food.busyHourStr forIndex:6];
    [stmt bindString:food.imageUrlStr forIndex:7];
    [stmt bindInt32:food.isLiked forIndex:8];
    
    int step = [stmt step];
    if (step != SQLITE_DONE) {
		NSLog(@"insert error errorcode =%d ",step);
    }
    [stmt reset];
}

//查
+ (NSArray *)getFoodFromSqliteWithoutNet{
    NSMutableArray *mutableArr = [NSMutableArray array];
    static Statement *statement = nil;
    if (statement==nil) {
        statement = [DBConnection statementWithQuery:"SELECT * FROM food_list"];
    }
    
    while ([statement step] == SQLITE_ROW) {
        Food *food = [[Food alloc] init];
        food.foodId = [statement getInt32:0];
        food.restaurantNameStr=[statement getString:1];
        food.hotFoodStr=[statement getString:2];
        food.averageSpendStr=[statement getString:3];
        food.locationStr=[statement getString:4];
        food.busyHourStr =[statement getString:5];
        food.imageUrlStr=[statement getString:6];
        food.isLiked=[statement getInt32:7];
        
        [mutableArr addObject:food];
    }
    
    [statement reset];
    return mutableArr;
}

+ (Food *)findIsLikeFoodFromLikeTable:(Food *)food{
    
    static Statement *statement = nil;
    if (statement==nil) {
        statement = [DBConnection statementWithQuery:"SELECT * FROM like_food_list where food_id=?"];
    }
    
    [statement bindInt32:food.foodId forIndex:1];
    
    Food *_food;
    while ([statement step] == SQLITE_ROW) {
        _food = [[Food alloc] init];
        _food.foodId = [statement getInt32:1];
        _food.restaurantNameStr=[statement getString:2];
        _food.hotFoodStr=[statement getString:3];
        _food.averageSpendStr=[statement getString:4];
        _food.locationStr=[statement getString:5];
        _food.busyHourStr =[statement getString:6];
        _food.imageUrlStr=[statement getString:7];
        _food.isLiked=[statement getInt32:8];

    }
    [statement reset];
    return _food;
}

//获取所有收藏数据
+ (NSArray *)findAllIsLikeFoodFromLikeTable{
    NSMutableArray *mutableArr = [NSMutableArray array];
    
    static Statement *statement = nil;
    if (statement==nil) {
        statement = [DBConnection statementWithQuery:"SELECT * FROM like_food_list"];
    }
    
    while ([statement step] == SQLITE_ROW) {
        Food *food = [[Food alloc] init];
        food.foodId = [statement getInt32:0];
        food.restaurantNameStr=[statement getString:1];
        food.hotFoodStr=[statement getString:2];
        food.averageSpendStr=[statement getString:3];
        food.locationStr=[statement getString:4];
        food.busyHourStr =[statement getString:5];
        food.imageUrlStr=[statement getString:6];
        food.isLiked=[statement getInt32:7];
        
        [mutableArr addObject:food];
    }
    [statement reset];
    
    return mutableArr;
}

//改
+ (void)updateFoodStatusBeforeTodayFromDatabase:(Food *)food{
        
    static Statement *statement = nil;
    
    if (statement==nil) {
        statement = [DBConnection statementWithQuery:"UPDATE food_list SET is_like = ? where food_id = ?"];
   
    }
    
    [statement bindInt32:food.isLiked forIndex:1];
    [statement bindInt32:food.foodId forIndex:2];
    
    if ([statement step] == SQLITE_DONE) {
        NSLog(@"成功修改状态");
        
    }
    
    [statement reset];
}

//删除 unlike数据
+ (void)deleteFoodFromSqlite:(Food *)food{
    
    static Statement *statement = nil;
    
    if (statement==nil) {
        statement = [DBConnection statementWithQuery:"DELETE FROM like_food_list where food_id=?"];
    }
    
    [statement bindInt32:food.foodId forIndex:1];

    int step = [statement step];
    if (step != SQLITE_DONE) {
		NSLog(@"insert error errorcode =%d ",step);
    }
    [statement reset];
}

@end
