//
//  IssueViewController.m
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/20.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "IssueViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "VotingPageViewController.h"

@interface IssueViewController (){
    //int i;//for button
    
    NSMutableArray *mainArrayForBut;


}

@end

@implementation IssueViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    [self getRandomIssue];
}



//選擇按鍵後彈出對應議題的投票
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIButton *btn = sender;
    if ([segue.identifier isEqualToString:@"toVotingPage"]) {
        VotingPageViewController *votingpage = [segue destinationViewController];
        votingpage.issueTitle = btn.currentTitle;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
