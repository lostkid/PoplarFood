//
//  SetViewController.h
//  PopularFood
//
//  Created by Zoe on 13-8-29.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationView.h"

typedef NS_ENUM(NSUInteger, SetDetailViewType) {
    DisclaimerType,
    GradeType
};

@interface SetViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    @private
    NSArray *setArray;
}
@property(nonatomic) SetDetailViewType setType;

+(SetViewController *)sharedInstance;

@end
