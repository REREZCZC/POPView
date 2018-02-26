#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class REPopupView;


@interface REPopupMasterView : UIView

@property (nonatomic, strong, readonly) NSArray * popups;

- (void)showPopup:(REPopupView *)popupView animated:(BOOL)animated;
- (void)hidePopup:(REPopupView *)popupView animated:(BOOL)animated;

@end
