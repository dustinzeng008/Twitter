//
//  API.m
//  Twitter
//
//  Created by Yong Zeng on 11/10/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import "API.h"
#import <AFNetworking/AFNetworking.h>

@implementation API

- (void)getTwitterTimeLine {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableString *authHeader = [[NSMutableString alloc]initWithFormat:@""];
    [authHeader appendFormat:@"OAuth "]; // MIND THE SPACE AFTER 'OAuth'
    [authHeader appendFormat:@"oauth_consumer_key=\"%@\",", @"uW8LEjZm91X9tPstCoYhxuOxM"];
    [authHeader appendFormat:@"oauth_token=\"%@\",", @"4199062485-vK4DI37kLLmQGyEaZjUoy0PWKo3RNv9AJ1GlBYF"];
    [authHeader appendFormat:@"oauth_signature_method=\"%@\",", @"HMAC-SHA1"];
    [authHeader appendFormat:@"oauth_timestamp=\"%@\",", @"1510287830"];
    [authHeader appendFormat:@"oauth_nonce=\"%@\",", @"kKkNxz9n1kz"];
    [authHeader appendFormat:@"oauth_version=\"%@\",", @"1.0"];
    [authHeader appendFormat:@"oauth_signature=\"%@\"", @"4Q0nOEMIAUFpqalISiH5%2F0d5iTI%3D"];
    
    AFHTTPRequestSerializer *request = [AFHTTPRequestSerializer serializer];
    [request setValue:authHeader forHTTPHeaderField:@"Authorization"];
    [manager setRequestSerializer:request];
    [manager GET:@"https://api.twitter.com/1.1/statuses/home_timeline.json" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success---%@", responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error---%@", error);
    }];
}

/*
- (void)loadNewTweets {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableString *authHeader = [[NSMutableString alloc]initWithFormat:@""];
    [authHeader appendFormat:@"OAuth "]; // MIND THE SPACE AFTER 'OAuth'
    [authHeader appendFormat:@"oauth_consumer_key=\"%@\",", @"uW8LEjZm91X9tPstCoYhxuOxM"];
    [authHeader appendFormat:@"oauth_token=\"%@\",", @"4199062485-vK4DI37kLLmQGyEaZjUoy0PWKo3RNv9AJ1GlBYF"];
    [authHeader appendFormat:@"oauth_signature_method=\"%@\",", @"HMAC-SHA1"];
    [authHeader appendFormat:@"oauth_timestamp=\"%@\",", @"1510629175"];
    [authHeader appendFormat:@"oauth_nonce=\"%@\",", @"rNHGk4T9kvo"];
    [authHeader appendFormat:@"oauth_version=\"%@\",", @"1.0"];
    [authHeader appendFormat:@"oauth_signature=\"%@\"", @"SyVedxpergEEwLhu%2BP%2FzGRe6NgM%3D"];
    
    AFHTTPRequestSerializer *request = [AFHTTPRequestSerializer serializer];
    [request setValue:authHeader forHTTPHeaderField:@"Authorization"];
    [manager setRequestSerializer:request];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"count"] = @(20);
    params[@"since_id"] = @(201);
    if (self.twitterArray.count) {
        params[@"since_id"] = [self.twitterArray[0] id_str];
    }
    [manager GET:@"https://api.twitter.com/1.1/statuses/home_timeline.json" parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray *dicArr = responseObject;
        NSError * error;
        NSArray *tweets = [MTLJSONAdapter modelsOfClass:[YZTweet class] fromJSONArray:dicArr error:&error];
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, tweets.count)];
        [self.twitterArray insertObjects:tweets atIndexes:indexSet];
        
        YZLog(@"count---%lu", (unsigned long)self.twitterArray.count);
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error---%@", error);
    }];
}
*/
@end
