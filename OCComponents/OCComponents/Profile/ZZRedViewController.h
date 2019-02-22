//
//  RedViewController.h
//  OCComponents
//
//  Created by liuweizhen on 2019/2/19.
//  Copyright © 2019 https://github.com/ACommonChinese/ZZModule All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ZZRedViewController;
@protocol ZZRedViewControllerProtocol <NSObject>

- (void)secondControllerDismiss:(ZZRedViewController *)controller;

@end

@interface ZZRedViewController : UIViewController

@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, weak) id<ZZRedViewControllerProtocol> delegate;

@end

NS_ASSUME_NONNULL_END
