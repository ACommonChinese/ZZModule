//
//  ZZModuleShopping.m
//  ZZModuleKitDemo
//
//  Created by Chris on 2019/2/19.
//  Copyright © 2019 banma-593. All rights reserved.
//

#import "ZZModuleShopping.h"
#import "ZZShoppingViewController.h"
#import "ZZModule.h"

@implementation ZZModuleShopping

- (ZZShoppingViewController *)shoppingViewController {
    return [[ZZShoppingViewController alloc] init];
}

- (NSInteger)test:(int)i
                f:(float)f
                d:(double)d
                s:(NSString *)s
                a:(NSArray *)arr
                d:(NSDictionary *)dict {
    NSLog(@"##### i: %d, f: %f, d: %f, s: %@, arr: %@, dict: %@", i, f, d, s, arr ,dict);
    return 2019;
}

@end
