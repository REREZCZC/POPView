#import "REExtendedHitRegionButton.h"


@implementation REExtendedHitRegionButton


//重写了 Button 的遍历构造器方法
+ (id)buttonWithType:(UIButtonType)buttonType {
    REExtendedHitRegionButton *button = (REExtendedHitRegionButton *) [super buttonWithType:buttonType];
    button.minimalHitRegionSize = CGSizeMake(44, 44);
    return button;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect hitRegion = CGRectInset(self.bounds, -fmaxf(0, (_minimalHitRegionSize.width - self.bounds.size.width) / 2), -fmaxf(0, (_minimalHitRegionSize.height - self.bounds.size.height) / 2));
    return CGRectContainsPoint(hitRegion, point);
}

@end
