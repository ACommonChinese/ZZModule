//
//  RedViewController.m
//  OCComponents
//
//  Created by liuweizhen on 2019/2/19.
//  Copyright © 2019 https://github.com/ACommonChinese/ZZModule All rights reserved.
//

#import "ZZRedViewController.h"

@interface ZZRedViewController ()

@end

@implementation ZZRedViewController

- (void)printString {
    NSLog(@"Hello world!");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = self.backgroundColor;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.delegate && [self.delegate respondsToSelector:@selector(secondControllerDismiss:)]) {
        [self.delegate secondControllerDismiss:self];
    }
}

@end
