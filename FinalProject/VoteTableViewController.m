//
//  VoteTableViewController.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/15.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "VoteTableViewController.h"
#import "VoteTableViewCell.h"
#import "VotingPageViewController.h"
#import <AFNetworking/AFNetworking.h>

@interface VoteTableViewController ()
{
    NSMutableArray *voteArray;
}
@end

@implementation VoteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    voteArray = [@[] mutableCopy];
//    NSUserDefaults *userDefault = [NSUserDefaults
//                                   standardUserDefaults];
//    NSString *loginToken = [userDefault objectForKey:@"loginToken"];
//
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    [manager GET:@"http://jksong.tw/api/v1/profiles/13/profile_issues_result" parameters:@{@"auth_token":loginToken} success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//        NSArray *array = responseObject[@"data"];
//       
//           for(NSDictionary *appDic in array ) {
//             NSNumber *issueDecision = appDic[@"issue_decision"];
//               NSString *dicIssue ;
//        switch (issueDecision.intValue) {
//        case 1:
//            dicIssue = @"Y";
//            break;
//        case -1:
//                dicIssue = @"N";
//                break;
//        case 0:
//                dicIssue = @"";
//                break;
//        default:
//                dicIssue = @"";
//                break;
//        };
//               
//               NSDictionary *dic = @{@"name":appDic[@"issue_name"],@"issueType":appDic[@"issue_category"],@"vote":dicIssue};
//               [voteArray addObject:dic];
//                NSLog(@"issue_category %@", appDic[@"issue_category"]);
//                NSLog(@"issue_content %@", appDic[@"issue_content"]);
//               NSLog(@"issue_name %@", appDic[@"issue_name"]);
//           };
//        [self.tableView reloadData];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
    
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
//    voteArray = [@[@{@"name":@"核四公投", @"detail":@"是否停建核四？",@"vote":@"Y"}, @{@"name":@"服貿協議", @"detail":@"是否開放服貿？",@"vote":@"Y"},
//                    @{@"name":@"貨貿協議", @"detail":@"貨貿協議是否給台灣帶來好處？",@"vote":@"N"}] mutableCopy];
        UINib *nib = [UINib nibWithNibName:@"VoteTableViewCell"
                                    bundle:nil];
        [self.tableView registerNib:nib
                    forCellReuseIdentifier:@"voteCellId"];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(void)viewWillAppear:(BOOL)animated{
//    [self.tableView reloadData];
    voteArray = [@[] mutableCopy];
    NSUserDefaults *userDefault = [NSUserDefaults
                                   standardUserDefaults];
    NSString *loginToken = [userDefault objectForKey:@"loginToken"];
    if (loginToken != nil) {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://jksong.tw/api/v1/profiles/13/profile_issues_result" parameters:@{@"auth_token":loginToken} success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"JSON: %@", responseObject);
            NSArray *array = responseObject[@"data"];
            
            for(NSDictionary *appDic in array ) {
                NSNumber *issueDecision = appDic[@"issue_decision"];
                NSString *dicIssue ;
                switch (issueDecision.intValue) {
                    case 1:
                        dicIssue = @"Y";
                        break;
                    case -1:
                        dicIssue = @"N";
                        break;
                    case 0:
                        dicIssue = @"";
                        break;
                    default:
                        dicIssue = @"";
                        break;
                };
                
                NSDictionary *dic = @{@"name":appDic[@"issue_name"],@"issueType":appDic[@"issue_category"],@"vote":dicIssue,@"issueId":appDic[@"issue_id"],@"issueContent":appDic[@"issue_content"],@"issueTotalYes":appDic[@"issue_total_yes"],@"issueTotalNo":appDic[@"issue_total_no"],@"issueTotalPass":appDic[@"issue_total_pass"]};
                [voteArray addObject:dic];
//                NSLog(@"issue_category %@", appDic[@"issue_category"]);
//                NSLog(@"issue_content %@", appDic[@"issue_content"]);
//                NSLog(@"issue_name %@", appDic[@"issue_name"]);
            };
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return voteArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    VoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"voteCellId" forIndexPath:indexPath];
    if (voteArray != nil) {
        NSDictionary *dic = voteArray[indexPath.row];
        UIImage *imageAgree = [UIImage imageNamed:@"agree"];
        UIImage *imageDisagree = [UIImage imageNamed:@"disagree"];
        cell.nameLabel.text = dic[@"issueType"];
        cell.detailLabel.text = dic[@"name"];
        NSString *voteResult = dic[@"vote"];
        if ([voteResult isEqualToString:@"Y"]) {
            cell.cellImage.image = imageAgree;
        }
        else if([voteResult isEqualToString:@"N"])
        {
            cell.cellImage.image = imageDisagree;
        }
        else
        {
            cell.cellImage.image = nil;
        };
        if ([cell.nameLabel.text isEqualToString:@"外交/國防" ])
        {
            cell.categoryImage.image = [UIImage imageNamed:@"國防"];
        }
        else if ([cell.nameLabel.text isEqualToString:@"經濟" ])
        {
            cell.categoryImage.image = [UIImage imageNamed:@"經濟"];
        }
        else if ([cell.nameLabel.text isEqualToString:@"財政" ])
        {
            cell.categoryImage.image = [UIImage imageNamed:@"財政"];
        }
        else if ([cell.nameLabel.text isEqualToString:@"內政" ] )
        {
            cell.categoryImage.image = [UIImage imageNamed:@"內政"];
        }
        else if ([cell.nameLabel.text isEqualToString:@"司法/法制" ])
        {
            cell.categoryImage.image = [UIImage imageNamed:@"司法"];
        }
        else if ([cell.nameLabel.text isEqualToString:@"社福/衛環" ] )
        {
            cell.categoryImage.image = [UIImage imageNamed:@"社福"];
        }
        else if ([cell.nameLabel.text isEqualToString:@"交通" ] )
        {
            cell.categoryImage.image = [UIImage imageNamed:@"交通"];
        }else {
            cell.categoryImage.image = [UIImage imageNamed:@"教育"];
            
        }
    }
    
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath
{
    if (voteArray.count > 0) {
        NSDictionary *dic = voteArray[indexPath.row];
        VotingPageViewController *controller = [self.storyboard
                                                instantiateViewControllerWithIdentifier:@"VotingPageViewController"];
        NSDictionary *issueResult = @{@"total_pass":dic[@"issueTotalPass"],@"total_yes":dic[@"issueTotalYes"],@"total_no":dic[@"issueTotalNo"]};
        controller.issueID = dic[@"issueId"];
        controller.issueTitle = dic[@"name"];
        controller.issueBody = dic[@"issueContent"];
        controller.showTheResultOfVoteFromRight = YES;
        controller.resultOfVoteDic = issueResult;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"closeConst" object:nil
                                                          userInfo:nil];

        [self.navigationController pushViewController:controller animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
