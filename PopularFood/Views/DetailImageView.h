//
//  DetailImageView.h
//  PopularFood
//
//  Created by Zoe on 13-9-9.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailImageViewDelegate <NSObject>
- (void)touchDetailViewHidden;
@end


@interface DetailImageView : UIView



@property(nonatomic,weak) id<DetailImageViewDelegate> delegate;
- (id)initWithFrame:(CGRect)frame withImageUrl:(NSString *)imageUrl;

@end
