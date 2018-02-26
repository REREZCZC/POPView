//
//  PopMasterView.m
//  POP
//
//  Created by ren zhicheng on 2018/2/22.
//  Copyright © 2018年 renzhicheng. All rights reserved.
//

#import "PopMasterView.h"
#import "PopView.h"
#import "Masonry/View+MASAdditions.h"

@implementation PopMasterView {
    UIView *_overlayView;
    NSMutableArray *_popups;
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _overlayView = [UIView new];
        _overlayView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.8f];
        [self addSubview:_overlayView];
        _overlayView.alpha = 0;
        _popups = [NSMutableArray array];
        self.hidden = YES;
    }
    return self;
}


- (void)updateConstraints {
    [_overlayView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    for (PopView *popupView in _popups) {
        
        [popupView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(18);
            make.right.equalTo(self.mas_right).offset(-18);
            make.centerY.equalTo(self.mas_centerY);
        }];
    }
    
    [super updateConstraints];
}


- (NSArray *)popups {
    return _popups;
}

- (void) showPopup:(PopView *)popupView animated:(BOOL)animated {
    if (popupView == nil || [_popups containsObject:popupView]) {
        return;
    }
    [_popups addObject:popupView];
    popupView.alpha = 0;
    [self addSubview:popupView];

    [popupView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(18);
        make.right.equalTo(self.mas_right).offset(-18);
        make.centerY.equalTo(self.mas_centerY);
    }];
    self.hidden = NO;
    void (^workBlock)() = ^{
        popupView.alpha = 1;
        _overlayView.alpha = 1;
    };
    
    if (animated) {
        workBlock();
    }else {
        workBlock();
    }
}

- (void) hidePopup:(PopView *)popupView animated:(BOOL)animated {
    if (popupView == nil || ![_popups containsObject:popupView]) {
        return;
    }
    
    [_popups removeObject:popupView];
    void (^workBlock)() = ^{
        popupView.alpha = 0;
        if (_popups.count == 0) {
            _overlayView.alpha = 0;
        }
    };
    
    
    void (^postBlock)(BOOL) = ^(BOOL finished) {
        [popupView removeFromSuperview];
        if (_popups.count == 0) {
            self.hidden = YES;
        }
    };
    
    if (animated) {
        workBlock();
        postBlock(YES);
    }else {
        workBlock();
        postBlock(YES);
    }
}















@end
