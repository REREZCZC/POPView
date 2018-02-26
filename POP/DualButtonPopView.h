//
//  DualButtonPopView.h
//  POP
//
//  Created by ren zhicheng on 2018/2/22.
//  Copyright © 2018年 renzhicheng. All rights reserved.
//

#import "PopView.h"

@interface DualButtonPopView : PopView

@property(nonatomic, strong, readonly)UIButton *leftButton;
@property(nonatomic, strong, readonly)UIButton *rightButton;

@property(nonatomic, copy, readwrite)PopButtonCallback leftButtonCallback;
@property(nonatomic, copy, readwrite)PopButtonCallback rightButtonCallback;

@end
