//
//  YZTweetTableViewCell.m
//  Twitter
//
//  Created by Yong Zeng on 11/18/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import "YZTweetTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "YZTweetViewModel.h"
@implementation YZTweetTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setTweetVM:(YZTweetViewModel *)tweetVM {
    _tweetVM = tweetVM;
    [_iconView sd_setImageWithURL:_tweetVM.iconUrl placeholderImage:[UIImage imageNamed:@"placeholder"]];
    _nameLabel.text = _tweetVM.name;
    _timeLabel.text = _tweetVM.time;
    _sourceLabel.text = _tweetVM.source;
    _tweetLabel.text = _tweetVM.text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView: (UITableView *)tableView {
    static NSString *ID = @"tweetCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"YZTweetTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    return cell;
}

@end
