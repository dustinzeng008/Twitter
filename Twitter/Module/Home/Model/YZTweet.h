//
//  YZTweet.h
//  Twitter
//
//  Created by Yong Zeng on 11/12/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "YZUser.h"

@interface YZTweet : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) YZTweet *retweeted_status;

@property (nonatomic, strong) YZUser *user;

@property (nonatomic, copy) NSDate *created_at;

@property (nonatomic, copy) NSString *id_str;

@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, assign) int retweet_count;

@property (nonatomic, assign) int comments_count;

@property (nonatomic, assign) int favorite_count;

//@property (nonatomic, strong) NSArray *entities;

@end
