//
//  CustomNavigationBarTableViewController.m
//  UINavigationBar
//
//  Created by 黄少华 on 15/7/15.
//  Copyright (c) 2015年 黄少华. All rights reserved.
//

#import "CustomNavigationBarTableViewController.h"
#import "CustomNavigationBar.h"
@interface CustomNavigationBarTableViewController ()

@property (nonatomic, strong) NSArray *cities;

@end

@implementation CustomNavigationBarTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSURL *citiesJSONURL = [[NSBundle mainBundle] URLForResource:@"Cities" withExtension:@"json"];
    NSData *citiesJSONData = [NSData dataWithContentsOfURL:citiesJSONURL];
    self.cities = [NSJSONSerialization JSONObjectWithData:citiesJSONData options:0 error:NULL];
    
    UIButton *returnToMenuButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [returnToMenuButton setTitle:NSLocalizedString(@"Return to Menu", @"") forState:UIControlStateNormal];
    [[returnToMenuButton titleLabel] setFont:[UIFont systemFontOfSize:12]];
    [returnToMenuButton addTarget:self action:@selector(returnToMenu:) forControlEvents:UIControlEventTouchUpInside];
//    [(CustomNavigationBar*)self.navigationController.navigationBar setCustomButton:returnToMenuButton];

}

- (void)returnToMenu:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:NULL];
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    // Configure the cell...
    cell.textLabel.text = self.cities[indexPath.row];
    
    return cell;
}


@end
