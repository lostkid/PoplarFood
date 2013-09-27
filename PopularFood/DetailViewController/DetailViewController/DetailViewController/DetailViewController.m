//
//  DetailViewController.m
//  PopularFood
//
//  Created by Zoe on 13-8-29.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "DetailViewController.h"
#import "SetDetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize firstView;

static DetailViewController *_sharedInstance = nil;

+(DetailViewController *)sharedInstance{

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

    self.view.backgroundColor=[UIColor yellowColor];

    firstView = [[UINavigationView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    firstView.delegate = self;
    [self.rootView setNextUIView:firstView];
    [firstView setPreUIView:self.rootView];
    firstView.backgroundColor=[UIColor clearColor];
    [self addSubView:firstView];
    
    firstView.backgroundColor=[UIColor redColor];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}

- (void)setFood:(Food *)food{
    label.text=food.hotFoodStr;
    

}

#pragma mark--切换SetViewController
- (void)changeViewToSetView{
    setVC = [SetViewController sharedInstance];

    if (setVC){
        
    }else{
        setVC = [[SetViewController alloc] init];
        
    }
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:setVC];
    nav.view.frame=CGRectMake(0, StatusBarHeight, self.view.frame.size.width, self.view.frame.size.height);
    setVC.view.frame=CGRectMake(0,44, self.view.bounds.size.width, self.view.bounds.size.height);
    [firstView addSubview:nav.view];
    [self addChildViewController:nav];
}

#pragma mark--移除SetViewController
-(void)removeSetView{
    
    if (setVC) {
        [setVC.view removeFromSuperview];
        [setVC removeFromParentViewController];
    }
    isSetListView=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
