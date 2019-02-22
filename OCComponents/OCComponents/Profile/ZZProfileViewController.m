//
//  ZZProfileViewController.m
//  ZZModuleKitDemo
//
//  Created by Chris on 2019/2/19.
//  Copyright © 2019 banma-593. All rights reserved.
//

#import "ZZProfileViewController.h"
#import "ZZModule.h"

@interface ZZProfileViewController ()

@end

@implementation ZZProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Profile";
    self.view.backgroundColor = [UIColor colorWithRed:arc4random() % 255 / 255.0
                                                green:arc4random() % 255 / 255.0
                                                 blue:arc4random() % 255 / 255.0
                                                alpha:1.0];
    
    // Right navigation item
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithTitle:@"SetDelegate"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(setDelegate:)];
}

- (void)setDelegate:(UIBarButtonItem *)sender {
    UIViewController *controller = ZZInstance(ZZRedViewController);
    [ZZModule call:controller _:@"view.setBackgroundColor:", [UIColor redColor]];
    [ZZModule call:controller _:@"setDelegate:", self];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)secondControllerDismiss:(UIViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

@end
