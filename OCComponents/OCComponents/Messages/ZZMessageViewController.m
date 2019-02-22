//
//  ZZMessageViewController.m
//  ZZModuleKitDemo
//
//  Created by liuweizhen on 2019/2/22.
//  Copyright © 2019 banma. All rights reserved.
//

#import "ZZMessageViewController.h"
#import "ZZModule.h"

@interface ZZMessageViewController ()

@end

@implementation ZZMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Messages";
    self.view.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0
                                                green:arc4random() % 255 / 255.0
                                                 blue:arc4random() % 255 / 255.0
                                                alpha:1.0];
    
    // Right navigation item
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"Detail"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(handleDetail:)];
}

- (void)handleDetail:(UIBarButtonItem *)sender {
    UIViewController *detailVC = (__bridge UIViewController *)[ZZModule call:ZZInstance(ZZDetailModule) _:@"detailViewController"];
    if (detailVC && [detailVC isKindOfClass:[UIViewController class]]) {
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}

@end
