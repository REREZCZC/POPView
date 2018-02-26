#import <Foundation/Foundation.h>
#import "REPopupView.h"
#import <UIKit/UIKit.h>

@interface RESingleButtonPopupView : REPopupView

@property (nonatomic, strong, readonly) UIButton * button;
@property (nonatomic, copy, readwrite) REPopupButtonCallback buttonCallback;

@end
