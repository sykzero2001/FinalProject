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

@interface IssueTableViewController (){
    NSMutableArray *issueArray;

}

@end

@implementation IssueTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self downloadIssue];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)downloadIssue {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://139.162.1.35/api/v1/issues" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        issueArray = responseObject[@"data"];
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
   

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
    
    cell.category = issueArray[indexPath.row][@"category"];
    cell.typeOfLawLabel.text = issueArray[indexPath.row][@"category"];
    cell.nameOfIssueLabel.text = issueArray[indexPath.row][@"name"];
    cell.bodyOfIssueLabel.text = issueArray[indexPath.row][@"created_at"];
   
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
        votingpage.issueBody = issueArray[indexPath.row][@"name"];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end