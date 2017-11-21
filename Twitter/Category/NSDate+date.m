//
//  NSDate+date.m
//  Twitter
//
//  Created by Yong Zeng on 11/18/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import "NSDate+date.h"

@implementation NSDate (date)

- (NSString *)getHHMMTime{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"hh:mm a"];
    return [df stringFromDate:self];
}
@end
