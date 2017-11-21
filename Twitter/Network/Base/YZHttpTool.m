//
//  YZHttpTool.m
//  Twitter
//
//  Created by Yong Zeng on 11/14/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import "YZHttpTool.h"
#import <AFNetworking.h>

@implementation YZHttpTool
+ (void)GET:(NSString *)urlString
      param:(id)param
    success:(void(^)(id responseObject))success
    failure:(void(^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFHTTPRequestSerializer *request = [AFHTTPRequestSerializer serializer];
    [request setValue:@"Bearer AAAAAAAAAAAAAAAAAAAAACJl3AAAAAAALR%2FgpRpn59XqTgLdHYXfvnc2VZ8%3DcL5UOBxFqODvXEMM9hUSFqT4jxU0jq9RUYGIkeduoLiCIR0PV7" forHTTPHeaderField:@"Authorization"];
    [manager setRequestSerializer:request];
    
    [manager GET:urlString parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)POST:(NSString *)urlString
       param:(id)param
     success:(void(^)(id responseObject))success
     failure:(void(^)(NSError *error))failure{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFHTTPRequestSerializer *request = [AFHTTPRequestSerializer serializer];
    [request setValue:@"Bearer AAAAAAAAAAAAAAAAAAAAACJl3AAAAAAALR%2FgpRpn59XqTgLdHYXfvnc2VZ8%3DcL5UOBxFqODvXEMM9hUSFqT4jxU0jq9RUYGIkeduoLiCIR0PV7" forHTTPHeaderField:@"Authorization"];
    [manager setRequestSerializer:request];
    
    [manager POST:urlString parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
@end
