//
//  SetViewController.m
//  PopularFood
//
//  Created by Zoe on 13-8-29.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "SetViewController.h"
#import "NavigationBarItem.h"
#import "DetailViewController.h"
@interface SetViewController ()

@end

@implementation SetViewController

static SetViewController *_sharedInstance = nil;

+(SetViewController *)sharedInstance{
    
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _sharedInstance=self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor purpleColor];
   
    //自定义导航栏按钮
//    self.navigationItem.leftBarButtonItem=[NavigationBarItem createLeftNavigationBarItemWithNormalImage:@"setting.png" andSelectedImage:@"settingSelected.png" controller:self];
   
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushButton setFrame:CGRectMake(20, 40, 61, 44)];
    [pushButton setTitle:@"Push2" forState:UIControlStateNormal];
    [pushButton setBackgroundColor:[UIColor clearColor]];
    [pushButton addTarget:[DetailViewController sharedInstance] action:@selector(pushView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pushButton];
    
    UIButton *popButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [popButton setFrame:CGRectMake(20, 200, 61, 44)];
    [popButton setTitle:@"Pop2" forState:UIControlStateNormal];
    [popButton setBackgroundColor:[UIColor clearColor]];
    [popButton addTarget:[DetailViewController sharedInstance] action:@selector(popView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:popButton];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
