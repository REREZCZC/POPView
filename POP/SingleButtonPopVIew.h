//
//  SingleButtonPopVIew.h
//  POP
//
//  Created by ren zhicheng on 2018/2/22.
//  Copyright © 2018年 renzhicheng. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "PopView.h"

@interface SingleButtonPopVIew : PopView
@property(nonatomic, strong, readonly)UIButton *button;
@property(nonatomic, copy, readwrite)PopButtonCallback buttonCallback;
@end
