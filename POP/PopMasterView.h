//
//  PopMasterView.h
//  POP
//
//  Created by ren zhicheng on 2018/2/22.
//  Copyright © 2018年 renzhicheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class PopView;
@interface PopMasterView : UIView
@property(nonatomic, strong, readonly)NSArray *popups;
- (void) showPopup:(PopView *)popupView animated:(BOOL)animated;
- (void) hidePopup:(PopView *)popupView animated:(BOOL)animated;
@end
