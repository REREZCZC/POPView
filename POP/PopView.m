//
//  PopView.m
//  POP
//
//  Created by ren zhicheng on 2018/2/22.
//  Copyright © 2018年 renzhicheng. All rights reserved.
//

#import "PopView.h"
#import "Masonry.h"
#import "PopViewController.h"

@implementation PopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        
        UITapGestureRecognizer *tapGestureRecognizer  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        
        _label = [UILabel new];
        _label.textColor = [UIColor grayColor];
        _label.font = [UIFont systemFontOfSize:16];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 0;
        [_label addGestureRecognizer:tapGestureRecognizer];
        _label.userInteractionEnabled = YES;
        [self addSubview:_label];
        
        _line = [UIView new];
        _line.backgroundColor = [UIColor grayColor];
        [self addSubview:_line];
        
        
    }
    return self;
}

- (void) labelTapped {
    if (_labelTapCallback) {
        _labelTapCallback(self);
    }
}

- (void) updateConstraints {
    [_label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(18);
        make.left.equalTo(self.mas_left).offset(18);
        make.right.equalTo(self.mas_right).offset(-18);
        if(_line.hidden){
            make.bottom.equalTo(self.mas_bottom).offset(-18);
        }
    }];
    
    
    [_line mas_remakeConstraints:^(MASConstraintMaker *make) {
        if(_line.hidden){
            return;
        }
        make.height.equalTo(@1);
        make.top.equalTo(_label.mas_bottom).offset(18);
        make.left.equalTo(self.mas_left).offset(18);
        make.right.equalTo(self.mas_right).offset(-18);
        make.bottom.lessThanOrEqualTo(self.mas_bottom).offset(-18);
    }];
    
    [super updateConstraints];
}

- (void) hideAnimated:(BOOL)animated {
    [self.controller hidePopup:self animated:YES];
}

- (BOOL)isPresented {
    return self.controller != nil;
}







@end
