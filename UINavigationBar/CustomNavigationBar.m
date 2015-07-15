//
//  CustomNavigationBar.m
//  UINavigationBar
//
//  Created by 黄少华 on 15/7/15.
//  Copyright (c) 2015年 黄少华. All rights reserved.
//

#import "CustomNavigationBar.h"

@implementation CustomNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize navigatioBarSize = [super sizeThatFits:size];
    
    CGSize buttomSize = [self.customButton sizeThatFits:CGSizeMake(size.width, 0)];
    
    navigatioBarSize.height += buttomSize.height;
    
    return navigatioBarSize;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize buttomSize = [self.customButton sizeThatFits:CGSizeMake(self.bounds.size.width, 0)];
    self.customButton.frame = CGRectMake(0, 0, self.bounds.size.width, buttomSize.height);
}

- (void)setCustomButton:(UIButton *)customButton
{
    [_customButton removeFromSuperview];
    
    _customButton = customButton;
    
    [self addSubview:customButton];
    
    [self invalidateIntrinsicContentSize];
    [self setNeedsLayout];
}
@end
