#import "REDualButtonPopupView.h"
#import "UIButton+REButtons.h"
#import "Masonry.h"


@implementation REDualButtonPopupView {
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.line.hidden = NO;

        _leftButton = [UIButton popDarkButtonWithTitle:@"YES"];
        [self addSubview:_leftButton];

        [_leftButton addTarget:self action:@selector(didPressLeftButton) forControlEvents:UIControlEventTouchUpInside];

        _rightButton = [UIButton popDarkButtonWithTitle:@"NO"];
        [self addSubview:_rightButton];

        [_rightButton addTarget:self action:@selector(didPressRightButton) forControlEvents:UIControlEventTouchUpInside];
    }

    return self;
}

- (void)didPressLeftButton {
    if (_leftButtonCallback) {
        REPopupButtonCallback buttonCallback = _leftButtonCallback;
        buttonCallback(self);
    }
}

- (void)didPressRightButton {
    if (_rightButtonCallback) {
        REPopupButtonCallback buttonCallback = _rightButtonCallback;
        buttonCallback(self);
    }
}

- (void)updateConstraints {
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
