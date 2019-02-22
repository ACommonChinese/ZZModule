//
//  ZZModuleMessage.m
//  ZZModuleKitDemo
//
//  Created by liuweizhen on 2019/2/22.
//  Copyright © 2019 banma. All rights reserved.
//

#import "ZZModuleMessage.h"
#import "ZZMessageViewController.h"
#import "ZZModule.h"

@implementation ZZModuleMessage

- (ZZMessageViewController *)messageViewController {
    return [[ZZMessageViewController alloc] init];
}

+ (ZZMessageViewController *)messageViewController {
    return [[ZZMessageViewController alloc] init];
}

- (void)sendMessage:(void(^)(NSString *message))callback {
    if (callback) {
        callback(@"Send message done.");
    }
}

- (int)sum:(int)a andB:(int)b {
    return a + b;
}

- (dispatch_block_t)clazzMethod:(NSString *)className {
    NSLog(@"########### instance method: %@", className);
    return ^{
        NSLog(@"############ dipatch_block_t");
    };
}

+ (dispatch_block_t)clazzMethod:(NSString *)className {
    NSLog(@"########### class method: %@", className);
    return ^{
        NSLog(@"############ dipatch_block_t");
    };
}

@end
