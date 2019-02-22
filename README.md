# ZZModule
iOS OC 组件开发



```objective-c
// 组件开发，运行时run方法，示例：

#import "ZZModule.h"

UIViewController *controller = ZZInstance(ZZRedViewController);
[ZZModule call:controller _:@"view.setBackgroundColor:", [UIColor redColor]];
[ZZModule call:controller _:@"setDelegate:", self];
[self presentViewController:controller animated:YES completion:nil];
```

