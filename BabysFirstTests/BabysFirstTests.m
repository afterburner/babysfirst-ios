//
//  BabysFirstTests.m
//  BabysFirstTests
//
//  Created by Austen McDonald on 6/4/14.
//  Copyright (c) 2014 Afterburner. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import <AFNetworking/AFNetworking.h>

#import "AFBGitHubController.h"

@interface BabysFirstTests : XCTestCase

@end

@implementation BabysFirstTests {
  NSString *_repoName;
  NSString *_expectedAPIURL;
  id _operationManager;
  AFBGitHubController *_controller;
}

- (void)setUp
{
  [super setUp];

  _repoName = @"reponame";
  _expectedAPIURL = [NSString stringWithFormat:@"https://api.github.com/%@/repos", _repoName];
  _operationManager = [OCMockObject mockForClass:[AFHTTPRequestOperationManager class]];
  _controller = [[AFBGitHubController alloc] initWithRequestManager:_operationManager];
}

- (void)tearDown
{
  [super tearDown];
}

- (void)testListReposSuccess
{
  NSArray *result = @[ @{ @"foo" : @"bar" } ];

  [[[_operationManager expect] andDo:^(NSInvocation *invocation) {
    void (^success)(AFHTTPRequestOperation*, id);
    [invocation getArgument:&success atIndex:4];
    success(nil, result);
  }] GET:_expectedAPIURL
   parameters:OCMOCK_ANY
   success:OCMOCK_ANY
   failure:OCMOCK_ANY];


  [_controller listReposAt:_repoName
                  success:^(NSArray *r) {
                    XCTAssert([r isEqual:result], @"Success block failed to return a proper NSArray.");
                  }
                  failure:^(NSError *e) {
                    XCTAssert(NO, @"Should not reach here.");
                  }];
}

- (void)testListReposFailure
{
  NSError *e = [NSError errorWithDomain:@"domain" code:4 userInfo:nil];
  [[[_operationManager expect] andDo:^(NSInvocation *invocation) {
    void (^failure)(AFHTTPRequestOperation*, NSError *);
    [invocation getArgument:&failure atIndex:5];
    failure(nil, e);
  }] GET:_expectedAPIURL
   parameters:OCMOCK_ANY
   success:OCMOCK_ANY
   failure:OCMOCK_ANY];


  [_controller listReposAt:_repoName
                   success:^(NSArray *result) {
                     XCTAssert(NO, @"Should not reach here.");
                   }
                   failure:^(NSError *e) {
                     XCTAssert([e isEqual:e], @"Failure block did not include the proper NSError.");
                   }];
}

@end
