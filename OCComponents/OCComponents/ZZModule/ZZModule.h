//
//  ZZ.h
//  OCComponents
//
//  Created by liuweizhen on 2019/2/19.
//  Copyright © 2019 https://github.com/ACommonChinese/ZZModule All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define TO_OC_STRING(STRING) @#STRING
#define ZZClass(TARGET) NSClassFromString(TO_OC_STRING(TARGET))
#define ZZInstance(TARGET) [[ZZClass(TARGET) alloc] init]

@interface ZZModule : NSObject

+ (void *)call:(id)target _:(NSString *)action, ...;

@end

NS_ASSUME_NONNULL_END
