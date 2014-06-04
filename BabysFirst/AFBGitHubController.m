//
//  AFBGitHubController.m
//  BabysFirst
//
//  Created by Austen McDonald on 6/4/14.
//  Copyright (c) 2014 Afterburner. All rights reserved.
//

#import "AFBGitHubController.h"

#import "AFNetworking.h"

const NSString *kAFBGitHubKeyForRepoName = @"name";
const NSString *kAFBGitHubKeyForRepoDescription = @"description";

@implementation AFBGitHubController

- (void)listReposAt:(NSString *)githubAccount success:(void (^)(NSArray *))successBlock failure:(void (^)(NSError *))failureBlock
{
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

  NSString *endpoint = [NSString stringWithFormat:@"https://api.github.com/%@/repos", githubAccount];

  [manager GET:endpoint parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
    successBlock(responseObject);
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
    failureBlock(error);
  }];
}

@end
