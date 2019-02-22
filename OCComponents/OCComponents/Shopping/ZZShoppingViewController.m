//
//  ZZShoppingViewController.m
//  ZZModuleKitDemo
//
//  Created by Chris on 2019/2/19.
//  Copyright © 2019 banma-593. All rights reserved.
//

#import "ZZShoppingViewController.h"
#import "ZZModule.h"

@interface ZZShoppingViewController ()

@end

@implementation ZZShoppingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Shopping";
    self.view.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0
                                                green:arc4random() % 255 / 255.0
                                                 blue:arc4random() % 255 / 255.0
                                                alpha:1.0];
    
    // Right navigation item
    self.navigationItem.rightBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Test"
                                         style:UIBarButtonItemStylePlain
                                        target:self
                                        action:@selector(handleTest:)];
}

- (void)handleTest:(UIBarButtonItem *)sender {
    dispatch_block_t block = (__bridge dispatch_block_t)[ZZModule call:ZZClass(ZZModuleMessage) _:@"clazzMethod:", @"Class method."];
    if (block) {
        block();
    }

    /**
    dispatch_block_t block = (__bridge dispatch_block_t)[ZZModule call:ZZInstance(ZZModuleMessage) _:@"clazzMethod:", @"Instance method."];
    if (block) {
        block();
    }
     */
}

@end
