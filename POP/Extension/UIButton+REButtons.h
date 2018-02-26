#import <Foundation/Foundation.h>
#import "REExtendedHitRegionButton.h"
#import <UIKit/UIKit.h>


@interface UIButton (REButtons)

+ (instancetype)popDarkButtonWithTitle:(NSString *)title;
- (void)show;
- (void)show:(BOOL)animated;
- (void)showWithPulse;
- (void)showWithPulseDelayed:(CGFloat)delay;
- (void)hide;
- (void)hide:(BOOL)animated;

+ (CGFloat)standardBorderPadding;
+ (CGFloat)standardBaselinePadding;

- (CGFloat)baselineHeight;

- (void)applyRemoteTheme;
+ (CGFloat)connectWifiCornerButtonMargin;

@end
