//
//  YZTweetAPIService.h
//  Twitter
//
//  Created by Yong Zeng on 11/14/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZTweetParam.h"

@interface YZTweetAPIService : NSObject
+ (void)newTweetsWithParam:(YZTweetParam *)param
                       success:(void(^)(NSArray *))success
                       failure:(void(^)(NSError *))failure;
@end
