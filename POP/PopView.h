//
//  PopView.h
//  POP
//
//  Created by ren zhicheng on 2018/2/22.
//  Copyright © 2018年 renzhicheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class PopViewController;
@class PopView;
typedef void (^PopButtonCallback)(PopView *popView);

@interface PopView : UIView

@property(nonatomic, weak, readwrite)PopViewController *controller;
@property(nonatomic, assign, readwrite)BOOL isPresented;
@property(nonatomic, strong, readonly)UILabel *label;
@property(nonatomic, strong, readonly)UIView *line;
@property(nonatomic, copy, readwrite)PopButtonCallback labelTapCallback;

- (void) hideAnimated:(BOOL)animated;

@end
