//
//  AFBMasterViewController.m
//  BabysFirst
//
//  Created by Austen McDonald on 6/4/14.
//  Copyright (c) 2014 Afterburner. All rights reserved.
//

#import "AFBMasterViewController.h"

#import "AFBDetailViewController.h"
#import "AFBGitHubController.h"

@interface AFBMasterViewController () {
  NSArray *_objects;
}

@property (nonatomic, strong) AFBGitHubController *gitHubController;

@end

@implementation AFBMasterViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  [self.gitHubController listReposAt:@"orgs/afterburner" success:^(NSArray *repos) {
    _objects = repos;
    [self.tableView reloadData];
  } failure:^(NSError *error) {

  }];
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

  NSDictionary *repo = _objects[indexPath.row];
  cell.textLabel.text = [repo objectForKey:kAFBGitHubKeyForRepoName];
  return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([[segue identifier] isEqualToString:@"showDetail"]) {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSDictionary *repo = _objects[indexPath.row];
    [[segue destinationViewController] setDetailItem:[repo objectForKey:kAFBGitHubKeyForRepoDescription]];
  }
}

#pragma mark -

- (AFBGitHubController *)gitHubController
{
  if (_gitHubController == nil) {
    _gitHubController = [[AFBGitHubController alloc] init];
  }
  return _gitHubController;
}

@end
