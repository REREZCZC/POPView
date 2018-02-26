//
//  PopViewController.m
//  POP
//
//  Created by ren zhicheng on 2018/2/22.
//  Copyright © 2018年 renzhicheng. All rights reserved.
//

#import "PopViewController.h"
#import "PopMasterView.h"
#import "SingleButtonPopVIew.h"
#import "DualButtonPopView.h"


@interface PopViewController () {
    NSMutableArray *_popupViewsStack;
}

@end

@implementation PopViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _popupViewsStack = [NSMutableArray array];
    }
    return self;
}

- (PopMasterView *)masterPopupView {
    return (PopMasterView *)self.view;
}

- (void)loadView {
    self.view = [PopMasterView new];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (PopView *)showPopupWithText:(NSString *)text animated:(BOOL)animated {
    PopView *popupView = [SingleButtonPopVIew new];
    popupView.label.text = text;

    [self showPopup:popupView animated:animated];
    return popupView;
}

- (SingleButtonPopVIew *) showPopupWithText:(NSString *)text okBlock:(PopButtonCallback)okBlock animated:(BOOL)animated {
    SingleButtonPopVIew *popupView = [SingleButtonPopVIew new];
    popupView.label.text = text;
    popupView.buttonCallback = okBlock;

    [self showPopup:popupView animated:animated];
    return popupView;
}


- (DualButtonPopView *) showPopupWithText:(NSString *)text yesBlock:(PopButtonCallback)yesBlock noBlock:(PopButtonCallback)noBlock animated:(BOOL)animated {
    DualButtonPopView *popupView = [DualButtonPopView new];
    popupView.label.text = text;
    popupView.leftButtonCallback = yesBlock;
    popupView.rightButtonCallback = noBlock;
    [self showPopup:popupView animated:animated];
    
    return popupView;
}

- (void) showPopup:(PopView *)popupView animate:(BOOL)animated {
    NSLog(@"kkjkjkjkjkjkjkjkjkj");
//    if (![self isStackEmpty]) {
//        [self enqueuePopup:[self lastPopupView] animated:YES];
//    }
//    [self pushPopupView:popupView];
//    popupView.controller = self;
//    [self.masterPopupView showPopup:popupView animated:animated];
    
}


- (void) enqueuePopup:(PopView *)popupView animated:(BOOL)animated {
    [self.masterPopupView hidePopup:popupView animated:animated];
    popupView.controller = self;
}



- (void) hidePopup:(PopView *)popupView animated:(BOOL)animated {
    [self removePopupView:popupView];
    [self.masterPopupView hidePopup:popupView animated:animated];
    popupView.controller = nil;
    
    if (![self isStackEmpty]) {
        PopView *previousPopupView = [self popPopupView];
        [self showPopup: previousPopupView animated:YES];
    }
}


//popup views stack

- (BOOL)isStackEmpty {
    return !_popupViewsStack.count;
}


- (void) pushPopupView:(PopView *)popupView {
    if ([_popupViewsStack indexOfObject:popupView] == NSNotFound) {
        [_popupViewsStack addObject:popupView];
    }
}

- (PopView *) lastPopupView {
    return _popupViewsStack.lastObject;
}

- (void) removePopupView:(PopView *)popupView {
    if (_popupViewsStack.count > 0) {
        [_popupViewsStack removeObject:popupView];
    }
}

- (PopView *)popPopupView {
    PopView *popupView = _popupViewsStack.lastObject;
    if (_popupViewsStack.count > 0) {
        [_popupViewsStack removeLastObject];
    }
    return popupView;
}





+ (PopViewController *)popupViewControllerForController:(UIViewController *)controller {
    UIViewController *tmp = controller;
    
    while (tmp != nil) {
        if ([tmp conformsToProtocol:@protocol(PopViewControllerContext)]) {
            return ((id<PopViewControllerContext>)tmp).popViewController;
        } else {
            tmp = tmp.parentViewController;
        }
    }
    return nil;
}














@end
