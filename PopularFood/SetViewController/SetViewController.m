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

#import "SetDetailView.h"

#import "SetDetailViewController.h"
#import "GradeUsViewController.h"
#define AppID @"77777"

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title=@"设置";
   
    setArray = @[@"版本信息：V1.1",@"免责声明",@"给我们打分"];
    
    //自定义导航栏按钮
    self.navigationItem.leftBarButtonItem=[NavigationBarItem createLeftNavigationBarItemWithNormalImage:@"nav_back" andSelectedImage:@"nav_backSelected.png" controller:[DetailViewController sharedInstance]];

    UITableView *setTableView =[[UITableView alloc] initWithFrame:CGRectMake(19,20, 282, 99) style:UITableViewStylePlain];
    setTableView.delegate=self;
    setTableView.dataSource=self;
    setTableView.backgroundColor=[UIColor colorWithRed:224.0f/255.0f green:224.0f/255.0f blue:224.0f/255.0f alpha:0.5f];
    setTableView.bounces=NO;
    setTableView.layer.borderWidth = 1;
    setTableView.layer.cornerRadius=6.0f;
    setTableView.layer.borderColor = [[UIColor grayColor] CGColor];
    setTableView.separatorColor=[UIColor grayColor];
    [self.view addSubview:setTableView];
}

//push 设置详情页
- (void)pushOneSetDetailView{

    SetDetailView *detailView =[[SetDetailView alloc] initWithFrame:CGRectMake(0,44, self.view.frame.size.width, self.view.frame.size.height)];
    detailView.delegate=[DetailViewController sharedInstance];
    [[[DetailViewController sharedInstance]firstView] setNextUIView:detailView];
    [detailView setPreUIView:[[DetailViewController sharedInstance]firstView]];
    [[DetailViewController sharedInstance] addSubView:detailView];
    
    UIViewController *rootVC;
    if (_setType==DisclaimerType) {
        SetDetailViewController *disclaimerVC=[SetDetailViewController sharedInstance];
        disclaimerVC.view.frame=CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height+44);

        rootVC=disclaimerVC;
        UINavigationController *navDetailVC =[[UINavigationController alloc] initWithRootViewController:rootVC];
        navDetailVC.view.frame=CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [detailView addSubview:navDetailVC.view];

    }else if(_setType==GradeType){
//        GradeUsViewController *gradeVC =[GradeUsViewController sharedInstance];
//        rootVC=gradeVC;
        //给我打分
        [self goToAppStore];
    }
}

-(void)goToAppStore
{
    NSString *str = [NSString stringWithFormat:
                     @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",AppID];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

#pragma mark - Table view data source
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 33;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return setArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"SetCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        UIView *selectedView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,cell.contentView.frame.size.width, cell.contentView.frame.size.height)];
        selectedView.backgroundColor=[UIColor colorWithRed:178.0f/255.0f green:164.0f/255.0f blue:159.0f/255.0f alpha:0.8f];
        cell.selectedBackgroundView=selectedView;
        
        UILabel *textLabel =[[UILabel alloc] initWithFrame:CGRectMake(10,-4,cell.contentView.frame.size.width-100,cell.contentView.frame.size.height)];
        textLabel.font=[UIFont fontWithName:HeitiFont size:17.0f];
        textLabel.backgroundColor=[UIColor clearColor];
        textLabel.text=[setArray objectAtIndex:indexPath.row];
        textLabel.highlightedTextColor=[UIColor colorWithRed:83.0/255.0f green:83.0/255.0f blue:83.0/255.0f alpha:1.0f];
        [cell.contentView addSubview:textLabel];
        
        UIImageView *accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow"] highlightedImage:[UIImage imageNamed:@"arrowSelected.png"]];
        accessoryView.frame=CGRectMake(259, 11, 7,10);
        if (indexPath.row) {
            cell.accessoryView=accessoryView;
        }else{
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
        }

    }
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self pushOneSetDetailView];

    if (indexPath.row==1) {
        _setType = DisclaimerType;
        [[DetailViewController sharedInstance] pushView:nil];

    }else if(indexPath.row==2){
        _setType = GradeType;
    }
}


@end
