//
//  navigationPromptViewController.m
//  UINavigationBar
//
//  Created by 黄少华 on 15/7/15.
//  Copyright (c) 2015年 黄少华. All rights reserved.
//

#import "navigationPromptViewController.h"

@interface navigationPromptViewController ()

@end

@implementation navigationPromptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.prompt = @"in the top";
    
    self.view.backgroundColor = [UIColor grayColor];
}

//- (NSUInteger)supportedInterfaceOrientations{
//    return  UIInterfaceOrientationMaskAllButUpsideDown;
//}
@end
