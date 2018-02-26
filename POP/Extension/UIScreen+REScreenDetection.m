#import "UIScreen+REScreenDetection.h"
#import <UIKit/UIKit.h>

@implementation UIScreen (REScreenDetection)

+ (BOOL)isLimitedHeightScreen {
    UIScreen * screen = [UIScreen mainScreen];
    CGSize size = screen.bounds.size;
    if (size.height <= 568) {//5s / SE / touch
        return YES;
    }
    
    return fmaxf(size.width, size.height) / fminf(size.width, size.height) < 1.6f;//
}

@end
