//
//  YZHomeViewController.m
//  Twitter
//
//  Created by Yong Zeng on 11/11/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import "YZHomeViewController.h"
#import "YZTweetTableViewCell.h"
#import "YZTweet.h"
#import "YZTweetViewModel.h"

#import "YZTweetAPIService.h"
@interface YZHomeViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *tweetsViewModel;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation YZHomeViewController

-(NSMutableArray *)tweetsViewModel {
    if (_tweetsViewModel == nil) {
        _tweetsViewModel = [[NSMutableArray alloc] init];
    }
    return _tweetsViewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Tweets";
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 80;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:refreshControl];
    self.refreshControl = refreshControl;
    [refreshControl addTarget:self action:@selector(loadNewTweets) forControlEvents:UIControlEventValueChanged];
    [self loadNewTweets];
}

-(void)showNewTweetsCount:(NSInteger) count {
    if (count == 0) {
        return;
    }
    CGFloat h = 35;
    CGFloat y = CGRectGetMaxY(self.navigationController.navigationBar.frame) - h;
    CGFloat w = self.view.bounds.size.width;
    CGFloat x = 0;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x, y, w, h)];
    label.backgroundColor = [UIColor mainColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%li new tweets", (long)count];
    [self.navigationController.view insertSubview:label belowSubview:self.navigationController.navigationBar];
    [UIView animateWithDuration:0.25 animations:^{
        label.transform = CGAffineTransformMakeTranslation(0, h);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 delay:2 options:UIViewAnimationOptionCurveLinear animations:^{
            label.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}

- (void)loadNewTweets {
    YZTweetParam *param = [[YZTweetParam alloc] init];
    param.count = 20;
    param.q = @"%CNN";      //@"realDonaldTrump";
    if (self.tweetsViewModel.count) {
        YZTweet *tweet = [[self.tweetsViewModel objectAtIndex:0] tweet];
        param.since_id = [tweet id_str];
    }
    [YZTweetAPIService newTweetsWithParam:param success:^(NSArray *tweets) {
        [self showNewTweetsCount:tweets.count];
        [self.refreshControl endRefreshing];
        
        NSMutableArray *tweetsViewModel = [NSMutableArray new];
        for (YZTweet *tweet in tweets) {
            YZTweetViewModel *tweetVM = [[YZTweetViewModel alloc] init];
            tweetVM.tweet = tweet;
            [tweetsViewModel addObject:tweetVM];
        }
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, tweets.count)];
        [self.tweetsViewModel insertObjects:tweetsViewModel atIndexes:indexSet];
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"error --- %@", error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweetsViewModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YZTweetTableViewCell *cell = [YZTweetTableViewCell cellWithTableView:tableView];
    cell.tweetVM = [self.tweetsViewModel objectAtIndex:indexPath.row];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
