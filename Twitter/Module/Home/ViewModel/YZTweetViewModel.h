//
//  YZTweetViewModel.h
//  Twitter
//
//  Created by Yong Zeng on 11/18/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YZTweet;
@interface YZTweetViewModel : NSObject
@property (nonatomic, copy) NSURL *iconUrl;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, copy) NSString *text;

@property (nonatomic, strong) YZTweet *tweet;
@end
