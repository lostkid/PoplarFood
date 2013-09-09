//
//  DetailImageView.m
//  PopularFood
//
//  Created by Zoe on 13-9-9.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "DetailImageView.h"
#import "UIImageView+WebCache.h"
#import <QuartzCore/QuartzCore.h>

@implementation DetailImageView

- (id)initWithFrame:(CGRect)frame withImageUrl:(NSString *)imageUrl
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *bigImageView=[[UIImageView alloc] initWithFrame:frame];
        [bigImageView setImageWithURL:[NSURL URLWithString:imageUrl]];
        bigImageView.contentMode=UIViewContentModeScaleAspectFit;
        [bigImageView setBackgroundColor:[UIColor blackColor]];
        [self addSubview:bigImageView];
                
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(touchDetailViewHidden)]) {
        
        [self.delegate touchDetailViewHidden];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
