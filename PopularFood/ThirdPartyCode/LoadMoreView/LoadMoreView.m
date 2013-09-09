



#import "LoadMoreView.h"

@implementation LoadMoreView
@synthesize spinner;

//-(void)setCountNum:(NSString *)countNum{
//    if (countNum && ![countNum isEqualToString:_countNum]) {
//        label.hidden = NO;
//        label.text = [NSString stringWithFormat:@"加载更多...（已显示%@个）",countNum];
//        [label sizeToFit];
//    }
//}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:231.0/255.0 blue:237.0/255.0 alpha:1.0];
        
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.font = [UIFont systemFontOfSize:12];
        label.textColor = [UIColor colorWithRed:133/255.0f green:133/255.0f blue:134/255.0f alpha:1.0f];
        label.numberOfLines = 1;
		label.textAlignment = NSTextAlignmentCenter;
		label.frame = CGRectMake(0, 0, 320, 47);
		label.text = @"加载更多...";
        label.textColor=[UIColor blackColor];
        [label sizeToFit];
		[self addSubview:label];
        
        
		spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        spinner.frame = CGRectMake(label.frame.size.width+label.frame.origin.x, 0,47 , 47);
		[self addSubview:spinner];


    }
    return self;
}


 -(void)layoutSubviews{
 [super layoutSubviews];
 CGRect bounds = [label textRectForBounds:CGRectMake(0, 0, self.bounds.size.width, 48) limitedToNumberOfLines:1];
 spinner.frame = CGRectMake(bounds.origin.x + bounds.size.width + 4, (self.frame.size.height / 2) - 8, 16, 16);
 label.frame = CGRectMake(0, 0, self.bounds.size.width, self.frame.size.height - 1);
 }


@end
