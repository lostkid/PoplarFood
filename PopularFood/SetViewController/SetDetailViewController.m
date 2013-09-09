//
//  SetDetailViewController.m
//  PopularFood
//
//  Created by Zoe on 13-9-3.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "SetDetailViewController.h"
#import "DetailViewController.h"

@interface SetDetailViewController ()

@end

@implementation SetDetailViewController
@synthesize secondView;

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
    
    secondView = [[UINavigationView alloc] initWithFrame:self.view.frame];
    secondView.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:secondView];
        
    UIButton *popButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [popButton setFrame:CGRectMake(20, 200, 61, 44)];
    [popButton setTitle:@"Pop3" forState:UIControlStateNormal];
    [popButton setBackgroundColor:[UIColor clearColor]];
    [popButton addTarget:[DetailViewController sharedInstance] action:@selector(popView:) forControlEvents:UIControlEventTouchUpInside];
    [secondView addSubview:popButton];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
