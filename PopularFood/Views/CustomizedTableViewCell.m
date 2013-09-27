//
//  CustomizedTableViewCell.m
//  PopularFood
//
//  Created by Zoe on 13-8-30.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "CustomizedTableViewCell.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+WebCache.h"
#import "TransitionViewController.h"

#define BETWEEN_DISTANCE 7.5
#define LABEL_WIDTH 185
#define LABEL_HEIGHT 20
#define FONT_SIZE 13
@implementation CustomizedTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        UIImageView *imageBackgroundView = [[UIImageView alloc] initWithFrame:CGRectMake(6, 15/2, 308, 147)];
        [imageBackgroundView setImage:[UIImage imageNamed:@"cell.png"]];
        [self.contentView addSubview:imageBackgroundView];
        
        attachedFoodImageView = [[UIImageView alloc] initWithFrame:CGRectMake(BETWEEN_DISTANCE, BETWEEN_DISTANCE, 98.5, 98.5)];
        attachedFoodImageView.contentMode=UIViewContentModeScaleAspectFill;
        attachedFoodImageView.layer.masksToBounds=5.0f;
        attachedFoodImageView.layer.cornerRadius=5.0f;
        [imageBackgroundView addSubview:attachedFoodImageView];
        
        restaurantNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(attachedFoodImageView.frame.origin.x+attachedFoodImageView.frame.size.width+4, 4,LABEL_WIDTH,LABEL_HEIGHT)];
        restaurantNameLabel.backgroundColor=[UIColor clearColor];
        restaurantNameLabel.font=[UIFont fontWithName:HeitiFont size:FONT_SIZE];
        restaurantNameLabel.textColor = [UIColor blackColor];
        restaurantNameLabel.text=@"店名：";
        [imageBackgroundView addSubview:restaurantNameLabel];
        
        hotFoodNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(restaurantNameLabel.frame.origin.x, restaurantNameLabel.frame.origin.y+LABEL_HEIGHT, LABEL_WIDTH, LABEL_HEIGHT)];
        hotFoodNameLabel.font = [UIFont fontWithName:HeitiFont size:FONT_SIZE];
        hotFoodNameLabel.backgroundColor=[UIColor clearColor];
        hotFoodNameLabel.text = @"人气推荐  ：";
        [imageBackgroundView addSubview:hotFoodNameLabel];
        
        averageSpendLabel =[[UILabel alloc] initWithFrame:CGRectMake(restaurantNameLabel.frame.origin.x, hotFoodNameLabel.frame.origin.y+LABEL_HEIGHT, LABEL_WIDTH,LABEL_HEIGHT)];
        averageSpendLabel.backgroundColor=[UIColor clearColor];
        averageSpendLabel.font = [UIFont fontWithName:HeitiFont size:FONT_SIZE];
        averageSpendLabel.text =@"人均：";
        [imageBackgroundView addSubview:averageSpendLabel];
        
        locationLabel =[[UILabel alloc] initWithFrame:CGRectMake(restaurantNameLabel.frame.origin.x, averageSpendLabel.frame.origin.y+LABEL_HEIGHT,LABEL_WIDTH, LABEL_HEIGHT)];
        locationLabel.backgroundColor=[UIColor clearColor];
        locationLabel.font=[UIFont fontWithName:HeitiFont size:FONT_SIZE];
        locationLabel.text=@"地址：";
        locationLabel.numberOfLines=0;
        [imageBackgroundView addSubview:locationLabel];
        
        busyHourLabel =[[UILabel alloc] initWithFrame:CGRectMake(restaurantNameLabel.frame.origin.x, locationLabel.frame.origin.y+LABEL_HEIGHT, LABEL_WIDTH, LABEL_HEIGHT)];
        busyHourLabel.backgroundColor=[UIColor clearColor];
        busyHourLabel.font=[UIFont fontWithName:HeitiFont size:FONT_SIZE];
        busyHourLabel.text=@"人潮时间：";
        [imageBackgroundView addSubview:busyHourLabel];
        
        foodNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(13,118,205,28)];
        foodNameLabel.backgroundColor=[UIColor clearColor];
        foodNameLabel.textColor=[UIColor whiteColor];
        foodNameLabel.font=[UIFont fontWithName:HeitiFont size:18];
        [imageBackgroundView addSubview:foodNameLabel];
        
        favBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        favBtn.frame=CGRectMake(236, 121, 60, 30);
        [favBtn setImage:[UIImage imageNamed:@"collect.png"] forState:UIControlStateNormal];
        [favBtn setTitle:@"收藏" forState:UIControlStateNormal];
        [favBtn.titleLabel setFont:[UIFont fontWithName:HeitiFont size:12]];
        [favBtn.titleLabel setTextColor:[UIColor whiteColor]];
        [favBtn addTarget:self action:@selector(likeClick:) forControlEvents:UIControlEventTouchUpInside];
        [favBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0,35)];
        [self addSubview:favBtn];
        
    }
    return self;
}

- (void)likeClick:(id)sender{
    
    if ([self.delegate respondsToSelector:@selector(didSelectedLikedButtonClick:withFoodModel:)]) {
        [self.delegate didSelectedLikedButtonClick:sender withFoodModel:_food];
    }

}

- (void)setFood:(Food *)food{
    _food =food;

    [attachedFoodImageView setImageWithURL:[NSURL URLWithString:food.imageUrlStr] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
        
    }];
    
    restaurantNameLabel.text = [NSString stringWithFormat:@"店名：%@",food.restaurantNameStr];
    hotFoodNameLabel.text = [NSString stringWithFormat:@"人气推荐    ：%@",food.hotFoodStr];
    averageSpendLabel.text = [NSString stringWithFormat:@"人均：%@",food.averageSpendStr];
    locationLabel.text=[NSString stringWithFormat:@"地址：%@",food.locationStr];
    busyHourLabel.text=[NSString stringWithFormat:@"人潮时间：%@",food.busyHourStr];
    foodNameLabel.text=[NSString stringWithFormat:@"%@",food.hotFoodStr];
    
    if (food.isLiked) {
        [favBtn setImage:[UIImage imageNamed:@"collectSelected.png"] forState:UIControlStateNormal];
        [favBtn setTitleColor:[UIColor colorWithRed:253/255.0f green:217/255.0f blue:72/255.0f alpha:1.0f] forState:UIControlStateNormal];
        [favBtn setTitle:@"已收藏" forState:UIControlStateNormal];
    }else{
        [favBtn setImage:[UIImage imageNamed:@"collect.png"] forState:UIControlStateNormal];
        [favBtn setTitle:@"收藏" forState:UIControlStateNormal];
        [favBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }

    
}




@end
