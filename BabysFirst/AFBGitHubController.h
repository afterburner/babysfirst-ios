//
//  AFBGitHubController.h
//  BabysFirst
//
//  Created by Austen McDonald on 6/4/14.
//  Copyright (c) 2014 Afterburner. All rights reserved.
//

#import <Foundation/Foundation.h>

extern const NSString *kAFBGitHubKeyForRepoName;
extern const NSString *kAFBGitHubKeyForRepoDescription;

@interface AFBGitHubController : NSObject

- (void)listReposAt:(NSString *)githubAccount success:(void (^)(NSArray *))successBlock failure:(void (^)(NSError *))failureBlock;

@end
