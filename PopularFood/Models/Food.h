//
//  Food.h
//  PopularFood
//
//  Created by Zoe on 13-8-29.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Food : NSObject
@property(nonatomic) NSInteger foodId;//id

@property(nonatomic,strong) NSString *restaurantNameStr;//饭馆名称
@property(nonatomic,strong) NSString *hotFoodStr;//人气推荐
@property(nonatomic,strong) NSString *averageSpendStr;//人均
@property(nonatomic,strong) NSString *locationStr;//地址
@property(nonatomic,strong) NSString *busyHourStr;//人潮时间

@property(nonatomic,strong) NSString *imageUrlStr;//网络图片
@property(nonatomic) NSInteger isLiked;//是否收藏

//获取美食信息接口
+ (void)getFoodInfo:(NSDictionary *)parameters WithBlock:(void (^)(NSArray *foodArray))block;
+ (NSArray *)getFood;

@end
