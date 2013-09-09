//
//  FoodClient.m
//  PopularFood
//
//  Created by Zoe on 13-9-2.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "FoodClient.h"
#import "AFJSONRequestOperation.h"

//#import "SVProgressHUD.h"

#define BaseUrlString @"http://192.168.0.233:3000/"  //内网

@implementation FoodClient

+(FoodClient *)sharedClient{

    static FoodClient *_shareClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareClient = [[FoodClient alloc]initWithBaseURL:[NSURL URLWithString:BaseUrlString]];
    });
    return _shareClient;
}


-(id)initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    if(!self){
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
    // Accept HTTP Header; see http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html#sec14.1
    [self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}




@end
