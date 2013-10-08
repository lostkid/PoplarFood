//
//  GradeUsViewController.m
//  PopularFood
//
//  Created by Zoe on 13-9-12.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "GradeUsViewController.h"

@interface GradeUsViewController ()

@end

@implementation GradeUsViewController

+(GradeUsViewController *)sharedInstance{
    static GradeUsViewController *_sharedInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[GradeUsViewController alloc]init];
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
	// Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor brownColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    if ([self isViewLoaded] && self.view.window == nil) {
        self.view = nil;
    }
}

@end
