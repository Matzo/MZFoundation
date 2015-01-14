//
//  NSObject+MZFoundation.m
//  MZFoundation
//
//  Created by Matsuo Keisuke on 1/15/15.
//  Copyright (c) 2015 Keisuke Matsuo. All rights reserved.
//

#import "NSObject+MZFoundation.h"

@implementation NSObject (MZFoundation)
+ (NSString*)mz_className {
    NSString *orgClassName = NSStringFromClass([self class]);
    NSRange range = [orgClassName rangeOfString:@"."];
    if (range.length != NSNotFound) {
        return [orgClassName substringFromIndex:range.location + range.length];
    } else {
        return orgClassName;
    }
}
@end
