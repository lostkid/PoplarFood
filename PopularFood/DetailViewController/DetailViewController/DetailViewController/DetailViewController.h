//
//  DetailViewController.h
//  PopularFood
//
//  Created by Zoe on 13-8-29.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransitionViewController.h"
#import "Food.h"
#import "SetViewController.h"


@interface DetailViewController : TransitionViewController
{
    @private UILabel *label;
        BOOL isSetListView;
    NSArray *navigationTitles;
    SetViewController *setVC;

}
@property(nonatomic,strong) Food *food;
@property(nonatomic,strong) UINavigationView *firstView;

+(DetailViewController *)sharedInstance;

- (void)changeViewToSetView;
-(void)removeSetView;
@end
