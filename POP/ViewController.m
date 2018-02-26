//
//  ViewController.m
//  POP
//
//  Created by ren zhicheng on 2018/2/22.
//  Copyright © 2018年 renzhicheng. All rights reserved.
//

#import "ViewController.h"

#import "REDualButtonPopupView.h"
#import "RESingleButtonPopupView.h"
#import "REPopupView.h"

@interface ViewController ()

@end

@implementation ViewController {

}
@synthesize popupViewController = _popupViewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _popupViewController = [REPopupViewController new];
//    [self addChildViewController:_popupViewController];
//    [_popupViewController didMoveToParentViewController:self];
    [self.view addSubview:_popupViewController.view];
    _popupViewController.view.frame = self.view.bounds;
    
    
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(200, 600 - 50, 160, 60);
    
    [button setTitle:@"No Button" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor grayColor]];
    [button addTarget:self action:@selector(didTapButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button_1  = [UIButton buttonWithType:UIButtonTypeCustom];
    button_1.frame = CGRectMake(200, 680 - 50, 160, 60);
    [button_1 setTitle:@"One Button" forState:UIControlStateNormal];
    [button_1 setBackgroundColor:[UIColor grayColor]];
    
    [button_1 addTarget:self action:@selector(didTapButton_1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_1];
    
    UIButton *button_2  = [UIButton buttonWithType:UIButtonTypeCustom];
    button_2.frame = CGRectMake(200, 760 - 50, 160, 60);
    [button_2 setTitle:@"Two Button" forState:UIControlStateNormal];
    [button_2 setBackgroundColor:[UIColor grayColor]];
    
    [button_2 addTarget:self action:@selector(didTapButton_2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_2];
 
}


- (void) didTapButton {
    REPopupViewController *popViewController = [REPopupViewController popupViewControllerForController:self];
    [popViewController showPopupWithText:@"No Button Pop" labelBlock:^(REPopupView *popupView) {
        [popupView hideAnimated:YES];
    } animated:YES];
    
}

- (void) didTapButton_1 {
    REPopupViewController *popViewController = [REPopupViewController popupViewControllerForController:self];
    [popViewController showPopupWithText:@"Single Button Pop" okBlock:^(REPopupView *popupView) {
        NSLog(@"OK");
        [popupView hideAnimated:YES];
    } animated:YES];
}

- (void) didTapButton_2 {
    REPopupViewController *popViewController = [REPopupViewController popupViewControllerForController:self];
    [popViewController showPopupWithText:@"Dual Button Pop" yesBlock:^(REPopupView *popupView) {
        NSLog(@"YES");
        [popupView hideAnimated:YES];
    } noBlock:^(REPopupView *popupView) {
        NSLog(@"NO");
        [popupView hideAnimated:YES];
    } animated:YES];
}



@end
