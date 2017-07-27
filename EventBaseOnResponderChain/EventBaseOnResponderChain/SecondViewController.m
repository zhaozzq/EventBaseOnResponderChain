//
//  SecondViewController.m
//  EventBaseOnResponderChain
//
//  Created by zhaozq on 2017/7/26.
//  Copyright © 2017年 zhao. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)action:(UIButton *)sender {
     UIViewController *controller = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"FirstController"];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
