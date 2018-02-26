#import "RESingleButtonPopupView.h"
#import "UIButton+REButtons.h"
#import "Masonry.h"


@implementation RESingleButtonPopupView {
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.line.hidden = NO;

        _button = [UIButton popDarkButtonWithTitle:@"SingleButtonPop"];
        [self addSubview:_button];

        [_button addTarget:self action:@selector(didPressButton) forControlEvents:UIControlEventTouchUpInside];
    }

    return self;
}

- (void)didPressButton {
    if (_buttonCallback) {
        REPopupButtonCallback buttonCallback = _buttonCallback;
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
