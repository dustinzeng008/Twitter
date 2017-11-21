//
//  YZTweet.m
//  Twitter
//
//  Created by Yong Zeng on 11/12/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import "YZTweet.h"

@implementation YZTweet

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"retweeted_status": @"retweeted_status",
             @"user": @"user",
             @"created_at": @"created_at",
             @"id_str": @"id_str",
             @"text": @"text",
             @"source": @"source",
             @"retweet_count": @"retweet_count",
             @"comments_count": @"retweet_count",
             @"favorite_count": @"favorite_count"
             };
}

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    dateFormatter.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
    return dateFormatter;
}

//+(NSValueTransformer *)JSONTransformerForKey:(NSString *)key
+ (NSValueTransformer *)created_atJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(NSString *dateString, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter dateFromString:dateString];
    } reverseBlock:^id(NSDate *date, BOOL *success, NSError *__autoreleasing *error) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

@end
