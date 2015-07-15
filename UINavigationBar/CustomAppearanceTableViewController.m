//
//  CustomAppearanceTableViewController.m
//  UINavigationBar
//
//  Created by 黄少华 on 15/7/15.
//  Copyright (c) 2015年 黄少华. All rights reserved.
//

#import "CustomAppearanceTableViewController.h"

@interface CustomAppearanceTableViewController ()
@property (nonatomic, strong) NSArray *cities;


@end

@implementation CustomAppearanceTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSURL *citiesJSONURL = [[NSBundle mainBundle] URLForResource:@"Cities" withExtension:@"json"];
    NSData *citiesJSONData = [NSData dataWithContentsOfURL:citiesJSONURL];
    self.cities = [NSJSONSerialization JSONObjectWithData:citiesJSONData options:0 error:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return self.cities.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.navigationItem.prompt isEqualToString:self.cities[indexPath.row]]) {
        self.navigationItem.prompt = nil;
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }else{
        self.navigationItem.prompt = self.cities[indexPath.row];
    }
}

@end
