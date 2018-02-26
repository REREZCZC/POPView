#import <Foundation/Foundation.h>
#import "REPopupView.h"
#import <UIKit/UIKit.h>

@class REPopupMasterView;
@class RESingleButtonPopupView;
@class REDualButtonPopupView;

@interface REPopupViewController : UIViewController

//- (REPopupView *)showPopupWithText:(NSString *)text animated:(BOOL)animated;
- (REPopupView *)showPopupWithText:(NSString *)text labelBlock:(REPopupButtonCallback)labelBlock animated:(BOOL)animated;
- (RESingleButtonPopupView *)showPopupWithText:(NSString *)text okBlock:(REPopupButtonCallback)okBlock animated:(BOOL)animated;
- (REDualButtonPopupView *)showPopupWithText:(NSString *)text yesBlock:(REPopupButtonCallback)yesBlock noBlock:(REPopupButtonCallback)noBlock animated:(BOOL)animated;

- (void)showPopup:(REPopupView *)popupView animated:(BOOL)animated;
- (void)hidePopup:(REPopupView *)popupView animated:(BOOL)animated;

@end

@protocol REPopupViewControllerContext <NSObject>

@property (nonatomic, strong, readonly) REPopupViewController * popupViewController;

@end

@interface REPopupViewController (SharedInstance)

+(REPopupViewController *) popupViewControllerForController:(UIViewController *)controller;

@end
