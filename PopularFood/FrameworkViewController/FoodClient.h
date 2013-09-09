//
//  FoodClient.h
//  PopularFood
//
//  Created by Zoe on 13-9-2.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPClient.h"

@interface FoodClient : AFHTTPClient

+ (FoodClient *)sharedClient;

@end
