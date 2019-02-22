//
//  ZZ.m
//  OCComponents
//
//  Created by liuweizhen on 2019/2/19.
//  Copyright © 2019 https://github.com/ACommonChinese/ZZModule All rights reserved.
//

#import "ZZModule.h"
#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@implementation ZZModule

+ (void *)call:(id)target _:(NSString *)action, ... {
    NSCParameterAssert(action != nil);
    
    va_list args;
    va_start(args, action);
    
    if (!action || action.length <= 0) return nil;
    NSArray *array = [action componentsSeparatedByString:@"."];
    void *returnValue = (__bridge void *)(target);
    for (int i = 0; i < array.count; i++) { // 遍历方法名
        NSString *selectorStr = array[i];
        SEL selector = NSSelectorFromString(selectorStr);
        Class cls = NULL;
        Method method = NULL;
        NSMethodSignature *sigature = NULL;
        if (object_isClass((__bridge id _Nullable)(returnValue))) {
            cls = (__bridge Class)(returnValue);
            sigature = [cls methodSignatureForSelector:selector];
            method = class_getInstanceMethod(cls, selector);
        }
        else {
            cls = [(__bridge id)returnValue class];
            // sigature = [cls instanceMethodSignatureForSelector:selector];
            sigature = [(__bridge id)returnValue methodSignatureForSelector:selector];
            method = class_getInstanceMethod(cls, selector);
        }
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sigature];
        invocation.target = (__bridge id _Nullable)(returnValue);
        invocation.selector = selector;
        
        // 计算出此方法所需要的参数个数，并从参数列表中拿出
        NSUInteger count = [selectorStr componentsSeparatedByString:@":"].count - 1;
        for (int i = 0; i < count; i++) {
            char type[128];
            method_getArgumentType(method, i+2, type, sizeof(type));
            void *arg = NULL;
            if (strcmp(type, @encode(char)) == 0) {
                char c = va_arg(args, int);
                arg = &c;
            }
            else if (strcmp(type, @encode(short)) == 0) {
                short st = va_arg(args, int);
                arg = &st;
            }
            else if (strcmp(type, @encode(int)) == 0) {
                int i = va_arg(args, int);
                arg = &i;
            }
            else if (strcmp(type, @encode(bool)) == 0) {
                bool b = va_arg(args, int);
                arg = &b;
            }
            else if (strcmp(type, @encode(BOOL)) == 0) {
                BOOL b = va_arg(args, int);
                arg = &b;
            }
            // unsigned int type
            else if (strcmp(type, @encode(unsigned char)) == 0) {
                unsigned char usc = va_arg(args, unsigned int);
                arg = &usc;
            }
            else if (strcmp(type, @encode(unsigned short)) == 0) {
                unsigned short ust = va_arg(args, unsigned int);
                arg = &ust;
            }
            else if (strcmp(type, @encode(unsigned int)) == 0) {
                unsigned int ui = va_arg(args, unsigned int);
                arg = &ui;
            }
            // NSInteger type
            else if (strcmp(type, @encode(NSInteger)) == 0) {
                NSInteger nsi = va_arg(args, NSInteger);
                arg = &nsi;
            }
            // NSUInteger type
            else if (strcmp(type, @encode(NSUInteger)) == 0) {
                NSUInteger unsi = va_arg(args, NSUInteger);
                arg = &unsi;
            }
            // long type
            else if (strcmp(type, @encode(long)) == 0) {
                long l = va_arg(args, long);
                arg = &l;
            }
            // unsigined long type
            else if (strcmp(type, @encode(unsigned long)) == 0) {
                unsigned long ul = va_arg(args, unsigned long);
                arg = &ul;
            }
            else if (strcmp(type, @encode(long long)) == 0) {
                long long ll = va_arg(args, long long);
                arg = &ll;
            }
            // unsigned long long type
            else if (strcmp(type, @encode(unsigned long long)) == 0) {
                unsigned long long ull = va_arg(args, unsigned long long);
                arg = &ull;
            }
            // double type
            else if (strcmp(type, @encode(float)) == 0) {
                float f = va_arg(args, double);
                arg = &f;
            }
            else if (strcmp(type, @encode(double)) == 0) {
                double d = va_arg(args, double);
                arg = &d;
            }
            // char * type
            else if (strcmp(type, @encode(char *)) == 0) {
                char *cp = va_arg(args, char *);
                arg = &cp;
            }
            // Class type
            else if (strcmp(type, @encode(Class)) == 0) {
                Class clazz = va_arg(args, Class);
                arg = &clazz;
            }
            // SEL type
            else if (strcmp(type, @encode(SEL)) == 0) {
                SEL sel = va_arg(args, SEL);
                arg = &sel;
            }
            // if no matched, use void * type
            else {
                void *vp = va_arg(args, void *);
                arg = &vp;
            }
            // free(type);
            [invocation setArgument:arg atIndex:i+2];
        }
        
        [invocation invoke];
        
        char ret[128];
        method_getReturnType(method, ret, sizeof(ret));
        returnValue = [self getReturnValueOfInvocation:invocation type:ret];
    }
    
    va_end(args);
    
    return returnValue;
}

+ (void *)getReturnValueOfInvocation:(NSInvocation *)invocation type:(const char *)retType {
    if (strcmp(retType, @encode(void)) == 0) {
        return nil;
    }
    if (strcmp(retType, @encode(void)) == 0) {
        return nil;
    } else if (strcmp(retType, @encode(char)) == 0) {
        char c;
        [invocation getReturnValue:&c];
        return (__bridge void *)@(c);
    } else if (strcmp(retType, @encode(unsigned char)) == 0) {
        unsigned char uc;
        [invocation getReturnValue:&uc];
        return (__bridge void *)@(uc);
    } else if (strcmp(retType, @encode(short)) == 0) {
        short st;
        [invocation getReturnValue:&st];
        return (__bridge void *)@(st);
    } else if (strcmp(retType, @encode(unsigned short)) == 0) {
        unsigned short ust;
        [invocation getReturnValue:&ust];
        return (__bridge void *)@(ust);
    } else if (strcmp(retType, @encode(int)) == 0) {
        int i;
        [invocation getReturnValue:&i];
        return (__bridge void *)@(i);
    } else if (strcmp(retType, @encode(unsigned int)) == 0) {
        unsigned int ui;
        [invocation getReturnValue:&ui];
        return (__bridge void *)@(ui);
    } else if (strcmp(retType, @encode(float)) == 0) {
        float f;
        [invocation getReturnValue:&f];
        return (__bridge void *)@(f);
    } else if (strcmp(retType, @encode(double)) == 0) {
        double d;
        [invocation getReturnValue:&d];
        return (__bridge void *)@(d);
    } else if (strcmp(retType, @encode(long)) == 0) {
        long l;
        [invocation getReturnValue:&l];
        return (__bridge void *)@(l);
    } else if (strcmp(retType, @encode(unsigned long)) == 0) {
        unsigned long ul;
        [invocation getReturnValue:&ul];
        return (__bridge void *)@(ul);
    } else if (strcmp(retType, @encode(long long)) == 0) {
        long long ll;
        [invocation getReturnValue:&ll];
        return (__bridge void *)@(ll);
    } else if (strcmp(retType, @encode(unsigned long long)) == 0) {
        unsigned long long ull;
        [invocation getReturnValue:&ull];
        return (__bridge void *)@(ull);
    } else if (strcmp(retType, @encode(bool)) == 0) {
        bool b;
        [invocation getReturnValue:&b];
        return (__bridge void *)@(b);
    } else if (strcmp(retType, @encode(BOOL)) == 0) {
        BOOL B;
        [invocation getReturnValue:&B];
        return (__bridge void *)@(B);
    } else if (strcmp(retType, @encode(NSInteger)) == 0) {
        NSInteger nsi;
        [invocation getReturnValue:&nsi];
        return (__bridge void *)@(nsi);
    } else if (strcmp(retType, @encode(CGFloat)) == 0) {
        CGFloat cgf;
        [invocation getReturnValue:&cgf];
        return (__bridge void *)@(cgf);
    } else if (strcmp(retType, @encode(id)) == 0) {
        id o = nil;
        [invocation getReturnValue:&o];
        return (__bridge_retained void *)(o);
    } else if (strcmp(retType, @encode(Class)) == 0) {
        Class clazz;
        [invocation getReturnValue:&clazz];
        return (__bridge void *)(clazz);
    } else if (strcmp(retType, @encode(char *)) == 0) {
        char *cp;
        [invocation getReturnValue:&cp];
        return cp;
    } else if (strcmp(retType, @encode(SEL)) == 0) {
        SEL sel;
        [invocation getReturnValue:&sel];
        return sel;
    } else if (strcmp(retType, @encode(void *)) == 0) {
        void *r;
        [invocation getReturnValue:&r];
        return r;
    } else {
        void *r;
        [invocation getReturnValue:&r];
        return r;
    }
    return nil;
}

@end
