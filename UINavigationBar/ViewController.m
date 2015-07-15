//
//  ViewController.m
//  UINavigationBar
//
//  Created by 黄少华 on 15/7/15.
//  Copyright (c) 2015年 黄少华. All rights reserved.
//

#import "ViewController.h"
#import "CustomAppearanceTableViewController.h"
#import "CustomNavigationBarTableViewController.h"
#import "navigationPromptViewController.h"
@interface ViewController ()


@property (nonatomic, strong) NSArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Navigation";
    
    UILabel *headlinelabel      = [[UILabel alloc] init];
    headlinelabel.font          = [UIFont fontWithName:@"Avenir-Light" size:28];
    headlinelabel.textAlignment = NSTextAlignmentCenter;
    headlinelabel.textColor     = [UIColor colorWithRed:0/255.f green:73/255.0f blue:131/255.0f alpha:1.f];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.title];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:170/255.f green:70/255.0f blue:48/255.0f alpha:1.f] range:NSMakeRange(3, 3)];
    headlinelabel.attributedText = attributedString;
    [headlinelabel sizeToFit];
    [self.navigationItem setTitleView:headlinelabel];
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text       = [self.items[indexPath.row] firstObject];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UIViewController *vc              = [self viewControllerForRowAtIndexPath:indexPath];
    vc.title                          = [self titleForRowAtIndexPath:indexPath];

    [self.navigationController pushViewController:vc animated:YES];
    
    
}


- (NSString *)titleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.items[indexPath.row] firstObject];
}

- (UIViewController *)viewControllerForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[self.items[indexPath.row] lastObject] new];
}

- (NSArray *)items
{
    if (!_items) {
        _items = @[@[@"custom Appearance",[CustomAppearanceTableViewController class]],
                   @[@"customNavigatiomBar",[CustomNavigationBarTableViewController class]],
                   @[@"navigationPrompt",[navigationPromptViewController class]]
                   ];
    }
    return _items;
}
@end
