//
//  UIResponder+Router.m
//  EventBaseOnResponderChain
//
//  Created by zhaozq on 2017/7/26.
//  Copyright © 2017年 zhao. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    NSLog(@"%@ --> %@", NSStringFromClass([self class]), eventName);
    [[self nextResponder] routerEventWithName:eventName userInfo:userInfo];
}

@end
