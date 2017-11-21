//
//  YZTweetViewModel.m
//  Twitter
//
//  Created by Yong Zeng on 11/18/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import "YZTweetViewModel.h"
#import "YZTweet.h"
#import "NSDate+date.h"

@implementation YZTweetViewModel

- (void)setTweet:(YZTweet *)tweet {
    _tweet = tweet;
    _iconUrl = [NSURL URLWithString:tweet.user.profile_image_url];
    _name = tweet.user.name;
    //_time = tweet.created_at;
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    dateFormatter.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
//    NSDate *created_at = [dateFormatter dateFromString:tweet.created_at];
    _time = [tweet.created_at getHHMMTime];
    
    NSString *source = tweet.source;
    NSRange range = [source rangeOfString:@">"];
    source = [source substringFromIndex:range.location + range.length];
    range = [source rangeOfString:@"<"];
    source = [source substringToIndex:range.location];
    source = [NSString stringWithFormat:@"From %@", source];
    _source = source;
    
    _text = tweet.text;
}

@end
