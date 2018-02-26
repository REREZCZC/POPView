#import "REPopupViewController.h"
#import "REPopupMasterView.h"
#import "RESingleButtonPopupView.h"
#import "REDualButtonPopupView.h"

@implementation REPopupViewController {
    NSMutableArray *_popupViewsStack;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _popupViewsStack = [NSMutableArray array];
    }

    return self;
}

- (REPopupMasterView *)masterPopupView {
    return (REPopupMasterView *) self.view;
}

- (void)loadView {
    self.view = [REPopupMasterView new];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (REPopupView *)showPopupWithText:(NSString *)text labelBlock:(REPopupButtonCallback)labelBlock animated:(BOOL)animated{
    REPopupView *popupView = [REPopupView new];
    popupView.label.text = text;
    popupView.labelTapCallback = labelBlock;

    [self showPopup:popupView animated:animated];

    return popupView;
}

- (RESingleButtonPopupView *)showPopupWithText:(NSString *)text okBlock:(REPopupButtonCallback)okBlock animated:(BOOL)animated {
    RESingleButtonPopupView *popupView = [RESingleButtonPopupView new];
    popupView.label.text = text;
    popupView.buttonCallback = okBlock;

    [self showPopup:popupView animated:animated];

    return popupView;
}

- (REDualButtonPopupView *)showPopupWithText:(NSString *)text yesBlock:(REPopupButtonCallback)yesBlock noBlock:(REPopupButtonCallback)noBlock animated:(BOOL)animated {
    REDualButtonPopupView *popupView = [REDualButtonPopupView new];
    popupView.label.text = text;
    popupView.leftButtonCallback = yesBlock;
    popupView.rightButtonCallback = noBlock;

    [self showPopup:popupView animated:animated];

    return popupView;
}

- (void)showPopup:(REPopupView *)popupView animated:(BOOL)animated {
    if (![self isStackEmpty]) {
        [self enqueuePopup:[self lastPopupView] animated:YES];
    }

    [self pushPopupView:popupView];
    popupView.controller = self;
    [self.masterPopupView showPopup:popupView animated:animated];
}

- (void)enqueuePopup:(REPopupView *)popupView animated:(BOOL)animated {
    [self.masterPopupView hidePopup:popupView animated:animated];
    popupView.controller = self;
}

- (void)hidePopup:(REPopupView *)popupView animated:(BOOL)animated {
    [self removePopoupView:popupView];
    [self.masterPopupView hidePopup:popupView animated:animated];
    popupView.controller = nil;

    if (![self isStackEmpty]) {
        REPopupView *previousPopupView = [self popPopupView];
        [self showPopup:previousPopupView animated:YES];
    }
}

#pragma mark - popup views stack

- (void)pushPopupView:(REPopupView *)popupView {
    if ([_popupViewsStack indexOfObject:popupView] == NSNotFound) {
        [_popupViewsStack addObject:popupView];
    }
}

- (REPopupView *)lastPopupView {
    return _popupViewsStack.lastObject;
}

- (void)removePopoupView:(REPopupView *)popupView {
    if (_popupViewsStack.count > 0) {
        [_popupViewsStack removeObject:popupView];
    }
}

- (REPopupView *)popPopupView {
    REPopupView *popupView = _popupViewsStack.lastObject;
    if (_popupViewsStack.count > 0) {
        [_popupViewsStack removeLastObject];
    }
    return popupView;
}

- (BOOL)isStackEmpty {
    return !_popupViewsStack.count;
}

@end

@implementation REPopupViewController (SharedInstance)

+ (REPopupViewController *)popupViewControllerForController:(UIViewController *)controller {
    UIViewController *tmp = controller;

    while (tmp != nil) {
        if ([tmp conformsToProtocol:@protocol(REPopupViewControllerContext)]) {
            return ((id<REPopupViewControllerContext>)tmp).popupViewController;
        } else {
            tmp = tmp.parentViewController;
        }
    }
    return nil;
}

@end
