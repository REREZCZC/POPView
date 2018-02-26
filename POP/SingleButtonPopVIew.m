//
//  SingleButtonPopVIew.m
//  POP
//
//  Created by ren zhicheng on 2018/2/22.
//  Copyright © 2018年 renzhicheng. All rights reserved.
//

#import "SingleButtonPopVIew.h"
#import "Masonry.h"
#import "UIButton+BARButtons.h"

@implementation SingleButtonPopVIew

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.line.hidden = NO;
        _button = [UIButton yinmanDarkButtonWithTitle:NSLocalizedString(@"OKBUTTON", nil)];
        [self addSubview:_button];
        [_button addTarget:self action:@selector(didPressButton) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void) didPressButton{
    if (_buttonCallback) {
        PopButtonCallback buttonCallback = _buttonCallback;
        buttonCallback(self);
    }
}

- (void)updateConstraints {
    [_button mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line.mas_top).offset(6);
        make.bottom.equalTo(self.mas_bottom).offset(-6);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [super updateConstraints];
}


@end
