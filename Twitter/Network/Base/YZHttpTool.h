//
//  YZHttpTool.h
//  Twitter
//
//  Created by Yong Zeng on 11/14/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZHttpTool : NSObject
+ (void)GET:(NSString *)urlString
             param:(id)param
                success:(void(^)(id responseObject))success
                failure:(void(^)(NSError *error))failure;

+ (void)POST:(NSString *)urlString
             param:(id)param
                success:(void(^)(id responseObject))success
                failure:(void(^)(NSError *error))failure;
@end
