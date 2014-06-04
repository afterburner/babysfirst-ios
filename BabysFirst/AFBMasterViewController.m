//
//  AFBMasterViewController.m
//  BabysFirst
//
//  Created by Austen McDonald on 6/4/14.
//  Copyright (c) 2014 Afterburner. All rights reserved.
//

#import "AFBMasterViewController.h"

#import "AFBDetailViewController.h"

@interface AFBMasterViewController () {
  NSArray *_objects;
}
@end

@implementation AFBMasterViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

  NSDate *object = _objects[indexPath.row];
  cell.textLabel.text = [object description];
  return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([[segue identifier] isEqualToString:@"showDetail"]) {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSDate *object = _objects[indexPath.row];
    [[segue destinationViewController] setDetailItem:object];
  }
}

@end
