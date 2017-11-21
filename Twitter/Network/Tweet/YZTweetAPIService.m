//
//  YZTweetAPIService.m
//  Twitter
//
//  Created by Yong Zeng on 11/14/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import "YZTweetAPIService.h"
#import "YZHttpTool.h"
#import "YZTweet.h"
@implementation YZTweetAPIService

+ (void)newTweetsWithParam:(YZTweetParam *)param
                       success:(void(^)(NSArray *))success
                       failure:(void(^)(NSError *))failure{
    NSError* error;
    NSDictionary *paramDict = [MTLJSONAdapter JSONDictionaryFromModel:param error:&error];
    if (error) {
        failure(error);
        return;
    }
    [YZHttpTool GET:@"https://api.twitter.com/1.1/search/tweets.json" param:paramDict success:^(id responseObject) {
        NSArray *dicArr = responseObject[@"statuses"];
        YZLog(@"new tweet count---%lu", (unsigned long)dicArr.count);
        NSError * error;
        NSArray *tweets = [MTLJSONAdapter modelsOfClass:[YZTweet class] fromJSONArray:dicArr error:&error];
        if (error) {
            failure(error);
        } else {
            success(tweets);
        }
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
