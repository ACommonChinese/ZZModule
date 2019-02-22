//
//  ViewController.m
//  OCComponents
//
//  Created by liuweizhen on 2019/2/19.
//  Copyright © 2019 https://github.com/ACommonChinese/ZZModule All rights reserved.
//

#import "ViewController.h"
#import "ZZModule.h"

@interface ZZModuleKitDemoItem : NSObject

//  @property title
@property (nonatomic, copy) NSString *title;

//  @property subTitle
@property (nonatomic, copy) NSString *subTitle;

@end

@implementation ZZModuleKitDemoItem

@end

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<ZZModuleKitDemoItem *> *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ZZModuleKit Demo";
    
    // Initialization
    _items = [NSMutableArray<ZZModuleKitDemoItem *> array];
    NSArray<NSString *> *titles = @[@"Message", @"Friends", @"Profile", @"Shopping", @"Detail"];
    for (NSInteger i = 0; i < titles.count; ++i) {
        ZZModuleKitDemoItem *item = [[ZZModuleKitDemoItem alloc] init];
        item.title = [NSString stringWithFormat:@"Module - %@", titles[i]];
        item.subTitle = [NSString stringWithFormat:@"Goto : %@", titles[i]];
        [_items addObject:item];
    }
    
    // Table datasource & delegate
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (IBAction)buttonClick:(id)sender {
    UIViewController *controller = ZZInstance(RedViewController);
    [ZZModule call:controller _:@"view.setBackgroundColor:", [UIColor redColor]];
    [ZZModule call:controller _:@"setDelegate:", self];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)secondControllerDismiss:(UIViewController *)controller {
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView
                 cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell_identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    ZZModuleKitDemoItem *item = [self.items objectAtIndex:indexPath.row];
    cell.textLabel.text = item.title;
    cell.detailTextLabel.text = item.subTitle;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        UIViewController *messageVC = (__bridge UIViewController *)[ZZModule call:ZZInstance(ZZModuleMessage) _:@"messageViewController"];
        if (messageVC && [messageVC isKindOfClass:[UIViewController class]]) {
            [self.navigationController pushViewController:messageVC animated:YES];
        }
    }
    else if (indexPath.row == 1) {
        UIViewController *friendsVC = (__bridge UIViewController *)[ZZModule call:ZZInstance(ZZModuleFriends) _:@"friendsViewController"];
        if (friendsVC && [friendsVC isKindOfClass:[UIViewController class]]) {
            [self.navigationController pushViewController:friendsVC animated:YES];
        }
    }
    else if (indexPath.row == 2) {
        UIViewController *profileVC = (__bridge UIViewController *)[ZZModule call:ZZInstance(ZZModuleProfile) _:@"profileViewController"];
        if (profileVC && [profileVC isKindOfClass:[UIViewController class]]) {
            [self.navigationController pushViewController:profileVC animated:YES];
        }
    }
    else if (indexPath.row == 3) {
        UIViewController *shoppingVC = (__bridge UIViewController *)[ZZModule call:ZZInstance(ZZModuleShopping) _:@"shoppingViewController"];
        if (shoppingVC && [shoppingVC isKindOfClass:[UIViewController class]]) {
            [self.navigationController pushViewController:shoppingVC animated:YES];
        }
    }
    else if (indexPath.row == 4) {
        UIViewController *detailVC = (__bridge UIViewController *)[ZZModule call:ZZInstance(ZZDetailModule) _:@"detailViewController"];
        if (detailVC && [detailVC isKindOfClass:[UIViewController class]]) {
            [self.navigationController pushViewController:detailVC animated:YES];
        }
    }
}

@end
