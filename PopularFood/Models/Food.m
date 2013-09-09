//
//  Food.m
//  PopularFood
//
//  Created by Zoe on 13-8-29.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "Food.h"
#import "FoodClient.h"
#import "FoodInsertDatabase.h"

@implementation Food

-(id)initWithItem:(NSDictionary *)dic{

    self=[super init];
    
    if (self) {
        
        _foodId=[[dic objectForKey:@"id"] intValue];
        
        _restaurantNameStr = [dic objectForKey:@"name"];
        _hotFoodStr = [dic objectForKey:@"recommend_food"];
        _averageSpendStr = [dic objectForKey:@"avg_price"];
        _locationStr = [dic objectForKey:@"address"];
        _busyHourStr = [dic objectForKey:@""];
        
        _imageUrlStr=[dic objectForKey:@"photo_url"];

    }

    return self;
}

+ (void)getFoodInfo:(NSDictionary *)parameters WithBlock:(void (^)(NSArray *foodArray))block{
  
//    [[FoodClient sharedClient] getPath:@"business/find_businesses" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
    
        NSArray *foodArray = [self getFood];
        
        for (int i=0; i<foodArray.count; i++) {
            Food *food =[foodArray objectAtIndex:i];
            [FoodInsertDatabase insertDB:food];
        }
        

//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"%@",error);
        block(foodArray);
//    }];

}

+ (NSArray *)getFood{
    
    Food *h_Food1 =[[Food alloc] init];
    h_Food1.foodId=1;
    h_Food1.restaurantNameStr = @"老盛兴";
    h_Food1.hotFoodStr =@"虾肉小笼";
    h_Food1.averageSpendStr=@"11元";
    h_Food1.locationStr =@"沪闵路211";
    h_Food1.busyHourStr =@"14:00-16:00";
    h_Food1.imageUrlStr = @"http://i3.meishichina.com/attachment/recipe/201105/201105161022511.jpg";
    h_Food1.isLiked=0;
    
    Food *h_Food2 = [[Food alloc] init];
    h_Food2.foodId=2;
    h_Food2.restaurantNameStr = @"秦国面馆";
    h_Food2.hotFoodStr=@"肉夹馍";
    h_Food2.averageSpendStr=@"12元";
    h_Food2.locationStr=@"莘建路5001路";
    h_Food2.busyHourStr=@"10:00-16:00";
    h_Food2.imageUrlStr=@"http://i3.meishichina.com/attachment/201202/28/474312_1330413527i7hP.jpg";
    h_Food2.isLiked=0;

    Food *h_Food3 = [[Food alloc] init];
    h_Food3.foodId=3;
    h_Food3.restaurantNameStr = @"豪大大鸡排";
    h_Food3.hotFoodStr=@"豪大大鸡排";
    h_Food3.averageSpendStr=@"13元";
    h_Food3.locationStr=@"都市路200路";
    h_Food3.busyHourStr=@"16:00-21:00";
    h_Food3.imageUrlStr=@"http://a2.att.hudong.com/20/60/20300001237583131070607252273_140.jpg";
    h_Food3.isLiked=0;

    NSArray *array=@[h_Food1,h_Food2,h_Food3];
    
    return array;
}


@end
