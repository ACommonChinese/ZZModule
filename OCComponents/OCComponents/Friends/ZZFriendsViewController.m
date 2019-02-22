//
//  ZZFriendsViewController.m
//  ZZModuleKitDemo
//
//  Created by Chris on 2019/2/19.
//  Copyright © 2019 banma-593. All rights reserved.
//

#import "ZZFriendsViewController.h"
#import "ZZModule.h"

@interface ZZFriendsViewController ()

@end

@implementation ZZFriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Friends";
    self.view.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0
                                                green:arc4random() % 255 / 255.0
                                                 blue:arc4random() % 255 / 255.0
                                                alpha:1.0];
    
    // Right navigation item
    self.navigationItem.rightBarButtonItem =
        [[UIBarButtonItem alloc] initWithTitle:@"Send"
                                         style:UIBarButtonItemStylePlain
                                        target:self
                                        action:@selector(handleSendMessage:)];
}

- (void)handleSendMessage:(UIBarButtonItem *)sender {
    [ZZModule call:ZZInstance(ZZModuleMessage) _:@"sendMessage:", ^(NSString *message) {
        NSLog(@"############# test send message: %@", message);
    }];
}

@end
