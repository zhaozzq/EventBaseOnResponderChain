//
//  TableViewCell.m
//  EventBaseOnResponderChain
//
//  Created by zhaozq on 2017/7/26.
//  Copyright © 2017年 zhao. All rights reserved.
//

#import "TableViewCell.h"
#import "UIResponder+Router.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)action:(UIButton *)sender {
    
    [self routerEventWithName:@"cellAction" userInfo:nil];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
