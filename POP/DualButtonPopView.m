//
//  DualButtonPopView.m
//  POP
//
//  Created by ren zhicheng on 2018/2/22.
//  Copyright © 2018年 renzhicheng. All rights reserved.
//

#import "DualButtonPopView.h"
#import "Masonry.h"
#import "UIButton+BARButtons.h"

@implementation DualButtonPopView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _leftButton = [UIButton yinmanDarkButtonWithTitle:NSLocalizedString(@"YES", nil)];
        [self addSubview:_leftButton];
        
        [_leftButton addTarget:self action:@selector(didPressLeftButton) forControlEvents:UIControlEventTouchUpInside];
        
        _rightButton = [UIButton yinmanDarkButtonWithTitle:NSLocalizedString(@"NO", nil)];
        [self addSubview:_rightButton];
        [_rightButton addTarget:self action:@selector(didPressRightButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void) didPressLeftButton {
    if (_leftButtonCallback) {
        PopButtonCallback buttonCallback = _leftButtonCallback;
        buttonCallback(self);
    }
}

- (void) didPressRightButton {
    if (_rightButtonCallback) {
        PopButtonCallback buttonCallback = _rightButtonCallback;
        buttonCallback(self);
    }
}

- (void) updateConstraints {
    [_leftButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line.mas_top).offset(6);
        make.bottom.equalTo(self.mas_bottom).offset(-6);
        make.width.equalTo(self.mas_width).multipliedBy(0.5f);
        make.left.equalTo(self.mas_left);
    }];
    
    [_rightButton mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line.mas_top).offset(6);
        make.bottom.equalTo(self.mas_bottom).offset(-6);
        make.width.equalTo(self.mas_width).multipliedBy(0.5f);
        make.right.equalTo(self.mas_right);
    }];
    
    [super updateConstraints];
}

@end
