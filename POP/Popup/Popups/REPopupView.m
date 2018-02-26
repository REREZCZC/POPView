#import "Masonry.h"
#import "REPopupView.h"
#import "REPopupViewController.h"
#import "UIColor+REColors.h"



@implementation REPopupView {

}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor TutorialPopupBackground];

        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelTapped)];
        tapGestureRecognizer.numberOfTapsRequired = 1;

        _label = [UILabel new];
        _label.textColor = [UIColor darkGray];
        _label.font = [UIFont systemFontOfSize:16];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.numberOfLines = 0;
        [_label addGestureRecognizer:tapGestureRecognizer];
        _label.userInteractionEnabled = YES;
        [self addSubview:_label];

        _line = [UIView new];
        _line.backgroundColor = [UIColor dark];
        [self addSubview:_line];

        _line.hidden = YES;
    }

    return self;
}

- (void)labelTapped {
    if (_labelTapCallback) {
        _labelTapCallback(self);
    }
}

- (void)updateConstraints {
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

- (void)hideAnimated:(BOOL)animated {
    [self.controller hidePopup:self animated:animated];
}

- (BOOL)isPresented {
    return self.controller != nil;
}

@end
