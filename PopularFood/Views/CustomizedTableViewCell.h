//
//  CustomizedTableViewCell.h
//  PopularFood
//
//  Created by Zoe on 13-8-30.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Food.h"

@protocol CustomizedTableViewCellDelegate <NSObject>

-(void)didSelectedLikedButtonClick:(id)sender withFoodModel:(Food*)food;
@end


@interface CustomizedTableViewCell : UITableViewCell
{
    @private
      UIImageView *attachedFoodImageView;
      UILabel *restaurantNameLabel,*hotFoodNameLabel,*averageSpendLabel,*locationLabel,*busyHourLabel,*foodNameLabel;
      //店名，人气推荐，人均消费，地址，忙时,菜名
    UIButton *favBtn;

}
@property(nonatomic,strong) Food *food;
@property(nonatomic,weak) id<CustomizedTableViewCellDelegate> delegate;
@end
