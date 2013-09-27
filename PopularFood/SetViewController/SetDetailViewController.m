//
//  SetDetailViewController.m
//  PopularFood
//
//  Created by Zoe on 13-9-3.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "SetDetailViewController.h"
#import "DetailViewController.h"
#import "NavigationBarItem.h"

@interface SetDetailViewController ()

@end

@implementation SetDetailViewController

static SetDetailViewController *_sharedInstance = nil;

+(SetDetailViewController *)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[SetDetailViewController alloc]init];
    });
    
    return _sharedInstance;
}


- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title=@"免责声明";
    
    //自定义导航栏按钮
    self.navigationItem.leftBarButtonItem=[NavigationBarItem createLeftNavigationBarItemWithNormalImage:@"nav_back" andSelectedImage:@"nav_backSelected.png" controller:[DetailViewController sharedInstance]];
    
    UIImageView *backGroundView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
    backGroundView.frame=CGRectMake(0,0, self.view.frame.size.width, self.view.bounds.size.height-44-StatusBarHeight);

    if (!iPhone5) {
        backGroundView.frame=CGRectMake(0,44, self.view.frame.size.width, self.view.bounds.size.height-44-20);
    }
    
    backGroundView.contentMode=UIViewContentModeScaleAspectFill;
    
    [self.view addSubview:backGroundView];
    
    UIImageView *frameBg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroundcell"]];
    [frameBg setFrame:CGRectMake(19, 44, 282, 93)];

    if (!iPhone5) {
        [frameBg setFrame:CGRectMake(19, 0, 282, 93)];
    }
    [backGroundView addSubview:frameBg];
    
    UILabel *claimLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 13, frameBg.frame.size.width-17, 93-13*2)];
    claimLabel.font=[UIFont fontWithName:HeitiFont size:13];
    claimLabel.backgroundColor=[UIColor clearColor];
    claimLabel.text=@"亲，如果在寻找美食的过程中，如遇到餐馆关门，环境变更等情况，可能是由于商家个人原因造成的数据不匹配，敬请见谅。";
    claimLabel.numberOfLines=0;
    [frameBg addSubview:claimLabel];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
