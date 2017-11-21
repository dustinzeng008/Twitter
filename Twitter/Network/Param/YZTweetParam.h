//
//  YZTweetParam.h
//  Twitter
//
//  Created by Yong Zeng on 11/15/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface YZTweetParam : MTLModel<MTLJSONSerializing>
@property (nonatomic, strong) NSString *since_id;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSString *q;
@end
