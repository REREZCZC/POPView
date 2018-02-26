//
//  PopViewController.h
//  POP
//
//  Created by ren zhicheng on 2018/2/22.
//  Copyright © 2018年 renzhicheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PopView.h"

@class PopMasterView;
@class SingleButtonPopVIew;
@class DualButtonPopView;

@interface PopViewController : UIViewController

- (PopView *) showPopupWithText:(NSString *)text animated:(BOOL)animated;
- (SingleButtonPopVIew *) showPopupWithText:(NSString *)text okBlock:(PopButtonCallback)okBlock animated:(BOOL)animated;
- (DualButtonPopView *)showPopupWithText:(NSString *)text yesBlock:(PopButtonCallback)yesBlock noBlock:(PopButtonCallback)noBlock animated:(BOOL)animated;

- (void) showPopup:(PopView *)popupView animated:(BOOL)animated;
- (void) hidePopup:(PopView *)popupView animated:(BOOL)animated;

@end


@protocol PopViewControllerContext <NSObject>

@property(nonatomic, strong, readonly)PopViewController *popViewController;

@end


@interface PopViewController (SharedInstance)

+ (PopViewController *)popupViewControllerForController:(UIViewController *)controller;

@end

















