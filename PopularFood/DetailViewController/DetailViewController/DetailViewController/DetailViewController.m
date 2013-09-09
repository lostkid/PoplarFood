//
//  DetailViewController.m
//  PopularFood
//
//  Created by Zoe on 13-8-29.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "DetailViewController.h"
#import "SetViewController.h"
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

    self.view.backgroundColor=[UIColor clearColor];

    firstView = [[UINavigationView alloc] initWithFrame:self.view.bounds];
    firstView.delegate = self;
    [self.rootView setNextUIView:firstView];
    [firstView setPreUIView:self.rootView];
    [self addSubView:firstView];
    
    label =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    label.textColor =[UIColor blackColor];
    [firstView addSubview:label];

    UIButton *popButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [popButton setFrame:CGRectMake(20, 120, 61, 44)];
    [popButton setTitle:@"Pop1" forState:UIControlStateNormal];
    [popButton addTarget:self action:@selector(popView:) forControlEvents:UIControlEventTouchUpInside];
    [firstView addSubview:popButton];
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}

- (void)setFood:(Food *)food{
    label.text=food.hotFoodStr;
    

}

#pragma mark--切换SetViewController
- (void)changeViewToSetView{
    
    SetViewController *setVC = [SetViewController sharedInstance];
    
    if (setVC){
        
    }else{
        setVC = [[SetViewController alloc] init];
        setVC.view.frame=CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    }
    [firstView addSubview:setVC.view];
    [self addChildViewController:setVC];
    
    isSetListView=YES;
    if (isSetListView) {
        SetDetailViewController *detailVC = [[SetDetailViewController alloc] init];
        detailVC.view.frame=setVC.view.frame;
        detailVC.secondView.delegate=self;
        [firstView setNextUIView:detailVC.secondView];
        [detailVC.secondView setPreUIView:firstView];
        [self addSubView:detailVC.secondView];
        [self addChildViewController:detailVC];

    }
}

#pragma mark--移除SetViewController
-(void)removeSetView{

    SetViewController *setVC = [SetViewController sharedInstance];
    
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
