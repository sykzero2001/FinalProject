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

@interface VoteTableViewController ()
{
    NSMutableArray *voteArray;
}
@end

@implementation VoteTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 50;
    voteArray = [@[@{@"name":@"核四公投", @"detail":@"是否停建核四？",@"vote":@"Y"}, @{@"name":@"服貿協議", @"detail":@"是否開放服貿？",@"vote":@"Y"},
                    @{@"name":@"貨貿協議", @"detail":@"貨貿協議是否給台灣帶來好處？",@"vote":@"N"}] mutableCopy];
        UINib *nib = [UINib nibWithNibName:@"VoteTableViewCell"
                                    bundle:nil];
        [self.tableView registerNib:nib
                    forCellReuseIdentifier:@"CellId"];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    VoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    NSDictionary *dic = voteArray[indexPath.row];
    UIImage *imageAgree = [UIImage imageNamed:@"agree"];
    UIImage *imageDisagree = [UIImage imageNamed:@"disagree"];
    cell.nameLabel.text = dic[@"name"];
    cell.detailLabel.text = dic[@"detail"];
    NSString *voteResult = dic[@"vote"];
    if ([voteResult isEqualToString:@"Y"]) {
        cell.cellImage.image = imageAgree;
    }
    else{
        cell.cellImage.image = imageDisagree;
    };
    
    return cell;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath
{
//    VotingPageViewController *controller = [self.storyboard
//                                        instantiateViewControllerWithIdentifier:@"votedisplay"];
//    [self.navigationController pushViewController:controller animated:YES];
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
