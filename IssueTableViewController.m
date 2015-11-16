//
//  IssueTableViewController.m
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/29.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "IssueTableViewController.h"
#import "VotingPageViewController.h"
#import "IssueTableViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import "LoginInfo.h"
@interface IssueTableViewController (){
    NSMutableArray *issueArray;

}

@end

@implementation IssueTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self downloadIssue];
}
-(void)viewWillAppear:(BOOL)animated{
     [super viewWillAppear:NO];
    [self downloadIssue];
    [self.tableView reloadData];
}

- (void)downloadIssue {
    
//    LoginInfo *loginfo = [LoginInfo logstatus] ;
//    [loginfo getLoginfo:self] ;
    NSUserDefaults *userDefault = [NSUserDefaults
                                   standardUserDefaults];
    NSString *loginToken = [userDefault objectForKey:@"loginToken"];
    if (loginToken == nil){
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://139.162.1.35/api/v1/issues" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            issueArray = responseObject[@"data"];
            [self.tableView reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }else{
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://139.162.1.35/api/v1/issues" parameters:@{@"auth_token":loginToken} success:^(AFHTTPRequestOperation *operation, id responseObject) {
            issueArray = responseObject[@"data"];
            [self.tableView reloadData];
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return issueArray.count;
}





- (IssueTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
     IssueTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Issuecell" forIndexPath:indexPath];
    if (!cell)
    {
        cell = [[IssueTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Issuecell"];
    }
    if (issueArray[indexPath.row][@"issue_decision"] == nil) {
        cell.category = issueArray[indexPath.row][@"category"];
        cell.typeOfLawLabel.text = issueArray[indexPath.row][@"category"];
        cell.nameOfIssueLabel.text = issueArray[indexPath.row][@"name"];
        if ([cell.category isEqualToString:@"外交/國防" ])
        {
            cell.categoriesImageView.image = [UIImage imageNamed:@"國防"];
        }
        else if ([cell.category isEqualToString:@"經濟" ])
        {
            cell.categoriesImageView.image = [UIImage imageNamed:@"經濟"];
        }
        else if ([cell.category isEqualToString:@"財政" ])
        {
            cell.categoriesImageView.image = [UIImage imageNamed:@"財政"];
        }
        else if ([cell.category isEqualToString:@"內政" ] )
        {
            cell.categoriesImageView.image = [UIImage imageNamed:@"內政"];
        }
        else if ([cell.category isEqualToString:@"司法/法制" ])
        {
            cell.categoriesImageView.image = [UIImage imageNamed:@"司法"];
        }
        else if ([cell.category isEqualToString:@"社福/衛環" ] )
        {
            cell.categoriesImageView.image = [UIImage imageNamed:@"社福"];
        }
        else if ([cell.category isEqualToString:@"交通" ] )
        {
            cell.categoriesImageView.image = [UIImage imageNamed:@"交通"];
        }else {
            cell.categoriesImageView.image = [UIImage imageNamed:@"教育"];

        }
// cell.categoriesImageView.image = issueArray[indexPath.row][];
    }
        // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"toVotingPage" sender:indexPath];
}
//選擇按鍵後彈出對應議題的投票
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    IssueTableViewCell *cell = sender;
//    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSIndexPath *indexPath = sender;
    if ([segue.identifier isEqualToString:@"toVotingPage"]) {
        VotingPageViewController *votingpage = [segue destinationViewController];
        votingpage.issueTitle =  issueArray[indexPath.row][@"name"];
        votingpage.issueBody = issueArray[indexPath.row][@"content"];
        votingpage.issueID = issueArray[indexPath.row][@"id"];
    }
}

@end
