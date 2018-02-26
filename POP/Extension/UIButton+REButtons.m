#import "UIButton+REButtons.h"

#import "UIColor+REColors.h"
#import "UIScreen+REScreenDetection.h"

const CGFloat kButtonPulseTime = 2.0f;
const CGFloat kButtonFadeTime = 0.5f;

@implementation UIButton (REButtons)

+ (instancetype)popDarkButtonWithTitle:(NSString *)title {
    REExtendedHitRegionButton *button = [REExtendedHitRegionButton buttonWithType:UIButtonTypeCustom];
    button.minimalHitRegionSize = CGSizeMake(120, 80);
    button.translatesAutoresizingMaskIntoConstraints = NO;
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitleColor:[UIColor dark] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor darkGray] forState:UIControlStateHighlighted];
    [button setTitleColor:[UIColor darkGray] forState:UIControlStateDisabled];
    [button setTitle:title forState:UIControlStateNormal];
    return button;
}



- (void)applyRemoteTheme {
    [self setTitleColor:[UIColor darkTeal] forState:UIControlStateNormal];
}

- (void)showWithPulse {
    [self showWithPulseDelayed:1];
}

- (void)showWithPulseDelayed:(CGFloat)delay {
    CABasicAnimation *showAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    CGFloat currentOpacity = ((CALayer *) self.layer.presentationLayer).opacity;
    showAnimation.duration = kButtonFadeTime * (1 - currentOpacity);
    showAnimation.fromValue = @(currentOpacity);
    showAnimation.toValue = @1;

    CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    keyframeAnimation.values = @[@1, @0.3, @1];
    keyframeAnimation.keyTimes = @[@0, @0.5, @1];
    keyframeAnimation.repeatCount = CGFLOAT_MAX;
    keyframeAnimation.duration = kButtonPulseTime;
    keyframeAnimation.beginTime = showAnimation.duration + delay;

    CAAnimationGroup *pulseGroup = [CAAnimationGroup animation];
    pulseGroup.animations = @[showAnimation, keyframeAnimation];
    pulseGroup.duration = CGFLOAT_MAX;

    self.layer.opacity = 1;
    self.hidden = NO;
    [self.layer addAnimation:pulseGroup forKey:@"button"];
}

- (void)show {
    [self show:YES];
}

- (void)show:(BOOL)animated {
    self.layer.opacity = 1;
    self.hidden = NO;

    if (animated) {
        CABasicAnimation *showAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        CGFloat currentOpacity = ((CALayer *) self.layer.presentationLayer).opacity;
        showAnimation.duration = kButtonFadeTime * (1 - currentOpacity);
        showAnimation.fromValue = @(currentOpacity);
        showAnimation.toValue = @1;
        [self.layer addAnimation:showAnimation forKey:@"button"];
    }
}

- (void)hide {
    [self hide:YES];
}

- (void)hide:(BOOL)animated {
    self.layer.opacity = 0;

    if (animated) {
        CABasicAnimation *hideAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        CGFloat currentOpacity = ((CALayer *)self.layer.presentationLayer).opacity;
        hideAnimation.duration = kButtonFadeTime * currentOpacity;
        hideAnimation.fromValue = @(currentOpacity);
        hideAnimation.toValue = @0;
        [self.layer addAnimation:hideAnimation forKey:@"button"];
    } else {
        self.hidden = YES;
    }
}

- (void)animationDidStop:(CAAnimation *)animation finished:(BOOL)finished {
//    [super animationDidStop:animation finished:finished];
    if ([[animation valueForKey:@"name"] isEqualToString:@"hide"] && finished) {
        self.hidden = YES;
    }
}

+ (CGFloat)standardBorderPadding {
    return ![UIScreen isLimitedHeightScreen] ? 18 : 14;
}

+ (CGFloat)standardBaselinePadding {

    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if (812 == screenHeight) {
        return 100;
    }else if (736 == screenHeight) {
        return 45;
    }else if (667 == screenHeight){
        return 40;
    }else {
        return 30;
    }

}
+ (CGFloat)connectWifiCornerButtonMargin {
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    return screenHeight == 812 ? 65 : 30;
}


- (CGFloat)baselineHeight {
    return self.bounds.size.height - CGRectGetMaxY(self.titleLabel.frame) - self.titleLabel.font.descender;
}


@end
