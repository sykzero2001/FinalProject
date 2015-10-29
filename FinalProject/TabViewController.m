//
//  TabViewController.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/16.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "TabViewController.h"
#import "LoginViewController.h"
#import "LoginInfo.h"

@interface TabViewController ()

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LoginInfo *loginfo = [LoginInfo logstatus] ;
    [loginfo getLoginfo:self] ;
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:0.15 green:0.84 blue:0.8 alpha:1]];
     [[UITabBar appearance] setTintColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.15 green:0.84 blue:0.8 alpha:1]];
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:1]];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changetab) name:@"ChangetabNoti" object:nil];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)changetab{
    [self setSelectedIndex:0];
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
