//
//  FirstViewController.m
//  EventBaseOnResponderChain
//
//  Created by zhaozq on 2017/7/26.
//  Copyright © 2017年 zhao. All rights reserved.
//

#import "FirstViewController.h"
#import "UIResponder+Router.h"

@interface FirstViewController ()

@property (strong, nonatomic, nullable) NSDictionary <NSString *, NSInvocation *> *eventStrategy;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self routerEventWithName:@"cellDidSelect" userInfo:@{@"info": @"test"}];
    
    UIViewController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"FirstController"];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)routerEventWithName:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
    if ([@"cellDidSelect" isEqualToString:eventName]) {
        NSInvocation *invocation = self.eventStrategy[eventName];
        if (userInfo)
        {
            [invocation setArgument:&userInfo atIndex:2];
        }
        [invocation invoke];
    }
    else
    {
        [super routerEventWithName:eventName userInfo:userInfo];
    }
}

- (void)testAction:(NSDictionary *)info
{
    NSLog(@"%@",info);
}

- (NSDictionary <NSString *, NSInvocation *> *)eventStrategy
{
    if (_eventStrategy == nil) {
        _eventStrategy = @{
                           @"cellDidSelect":[self createInvocationWithSelector:@selector(testAction:)],
                           };
    }
    return _eventStrategy;
}

//http://blog.csdn.net/cancer1617/article/details/6855484
- (NSInvocation *)createInvocationWithSelector:(SEL)sel
{
    NSMethodSignature *sig = [[FirstViewController class] instanceMethodSignatureForSelector:sel];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    [invocation setTarget:self];
    [invocation setSelector:sel];
    //[invocation invoke];
    return invocation;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
