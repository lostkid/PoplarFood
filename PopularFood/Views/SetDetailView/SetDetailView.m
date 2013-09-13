//
//  SetDetailView.m
//  PopularFood
//
//  Created by Zoe on 13-9-12.
//  Copyright (c) 2013年 Zoe. All rights reserved.
//

#import "SetDetailView.h"

@implementation SetDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *backgroundView =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background"]];
        backgroundView.frame=frame;
        backgroundView.contentMode=UIViewContentModeScaleAspectFit;
        [self addSubview:backgroundView];
    }
    return self;
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
