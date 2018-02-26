#import <Foundation/Foundation.h>
#import "REPopupView.h"
#import <UIKit/UIKit.h>

@interface REDualButtonPopupView : REPopupView

@property (nonatomic, strong, readonly) UIButton * leftButton;
@property (nonatomic, strong, readonly) UIButton * rightButton;

@property (nonatomic, copy, readwrite) REPopupButtonCallback leftButtonCallback;
@property (nonatomic, copy, readwrite) REPopupButtonCallback rightButtonCallback;

@end
