//
//  YZTweetParam.m
//  Twitter
//
//  Created by Yong Zeng on 11/15/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import "YZTweetParam.h"

@implementation YZTweetParam
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"since_id": @"since_id",
             @"count": @"count",
             @"q": @"q"
             };
}
@end
