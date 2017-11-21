//
//  YZUser.h
//  Twitter
//
//  Created by Yong Zeng on 11/12/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface YZUser : MTLModel<MTLJSONSerializing>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *profile_image_url;
@end
