





#import <UIKit/UIKit.h>

@interface LoadMoreView : UIView
{
    UILabel*                    label;
    UIActivityIndicatorView*    spinner;
    
}

@property(nonatomic, readonly) UIActivityIndicatorView* spinner;

//@property(nonatomic,strong)NSString * countNum;

@end
