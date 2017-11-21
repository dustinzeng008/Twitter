//
//  YZUser.m
//  Twitter
//
//  Created by Yong Zeng on 11/12/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import "YZUser.h"

@implementation YZUser
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name": @"name",
             @"profile_image_url": @"profile_image_url"
             };
}
@end
