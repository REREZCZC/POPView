#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class REPopupViewController;
@class REPopupView;

typedef void (^REPopupButtonCallback)(REPopupView * popupView);

@interface REPopupView : UIView

@property (nonatomic, weak, readwrite) REPopupViewController * controller;
@property (nonatomic, assign, readonly) BOOL isPresented;

@property (nonatomic, strong, readonly) UILabel * label;
@property (nonatomic, strong, readonly) UIView * line;

@property (nonatomic, copy, readwrite) REPopupButtonCallback labelTapCallback;

- (void)hideAnimated:(BOOL)animated;

@end
