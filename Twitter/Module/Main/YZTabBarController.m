//
//  YZTabBarController.m
//  Twitter
//
//  Created by Yong Zeng on 11/10/17.
//  Copyright © 2017 Yong Zeng. All rights reserved.
//

#import "YZTabBarController.h"
#import "YZNavigationController.h"
#import "YZHomeViewController.h"
#import "YZMessageViewController.h"
#import "YZDiscoverViewController.h"
#import "YZProfileViewController.h"

@interface YZTabBarController ()

@end

@implementation YZTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s", __func__);
    [self setupChildViewController];
}

+ (void)load{
    NSLog(@"%s", __func__);
}

+ (void)initialize {
    NSLog(@"%s", __func__);
    
    // Set TabBarItem title color
//    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedIn:self, nil];
//    NSMutableDictionary *att = [NSMutableDictionary dictionary];
//    [att setObject:[UIColor mainColor] forKey:NSForegroundColorAttributeName];
//    [tabBarItem setTitleTextAttributes:att forState:UIControlStateSelected];
    UITabBar *tabBar = [UITabBar appearanceWhenContainedIn:self, nil];
    [tabBar setTintColor:[UIColor mainColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setupChildViewController {
    // Home
    YZHomeViewController *home = [[YZHomeViewController alloc] init];
    [self setupOneViewController:home title:@"Home"
                           image:[UIImage imageNamed:@"home"]
                   selectedImage:[UIImage imageNamed:@"home-selected"]];
    //home.view.backgroundColor = [UIColor greenColor];
    
    // Message
    YZMessageViewController *message = [[YZMessageViewController alloc] init];
    [self setupOneViewController:message title:@"Message"
                           image:[UIImage imageNamed:@"message"]
                   selectedImage:[UIImage imageNamed:@"message-selected"]];
    //message.view.backgroundColor = [UIColor blueColor];
    
    // Discover
    YZDiscoverViewController *discover = [[YZDiscoverViewController alloc] init];
    [self setupOneViewController:discover title:@"Discover"
                           image:[UIImage imageNamed:@"discover"]
                   selectedImage:[UIImage imageNamed:@"discover-selected"]];
    //discover.view.backgroundColor = [UIColor purpleColor];
    
    // Profile
    YZProfileViewController *profile = [[YZProfileViewController alloc] init];
    [self setupOneViewController:profile title:@"Profile"
                           image:[UIImage imageNamed:@"profile"]
                   selectedImage:[UIImage imageNamed:@"profile-selected"]];
    //profile.view.backgroundColor = [UIColor yellowColor];
}

- (void)setupOneViewController:(UIViewController *)vc title:(NSString *)title
                         image:(UIImage *)image
                 selectedImage:(UIImage *)selectedImage {
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
    //vc.tabBarItem.badgeValue = @"";
    
    YZNavigationController *nav = [[YZNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    // Set TabBarItem title color
//    NSMutableDictionary *att = [NSMutableDictionary dictionary];
//    [att setObject:[UIColor magentaColor] forKey:NSForegroundColorAttributeName];
//    [vc.tabBarItem setTitleTextAttributes:att forState:UIControlStateSelected];
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
