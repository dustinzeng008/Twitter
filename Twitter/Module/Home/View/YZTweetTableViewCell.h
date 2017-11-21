//
//  YZTweetTableViewCell.h
//  Twitter
//
//  Created by Yong Zeng on 11/18/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YZTweetViewModel;
@interface YZTweetTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;

@property (nonatomic, strong) YZTweetViewModel *tweetVM;
+ (instancetype)cellWithTableView: (UITableView *)tableView;

@end
