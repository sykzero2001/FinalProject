//
//  PartyTableViewController.m
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/27.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "PartyTableViewController.h"

@interface PartyTableViewController ()
{
    NSArray *partyArray;
}
@end

@implementation PartyTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    partyArray = @[@{@"party":@"國民黨",@"congressman":@"111",@"percent":@"50%"},@{@"party":@"民進黨",@"congressman":@"111",@"percent":@"50%"},@{@"party":@"親民黨",@"congressman":@"111",@"percent":@"50%"},@{@"party":@"新黨",@"congressman":@"111",@"percent":@"50%"},@{@"party":@"民國黨",@"congressman":@"111",@"percent":@"50%"},@{@"party":@"其他",@"congressman":@"111",@"percent":@"50%"}];
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
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return partyArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"partycell" forIndexPath:indexPath];
    
    
    UILabel *partyNameLabel = (UILabel*)[cell.contentView viewWithTag:1];
    NSDictionary *dic = partyArray[indexPath.row];
    partyNameLabel.text = dic[@"party"];
    
    UILabel *partyMemberLabel = (UILabel*)[cell.contentView viewWithTag:2];
    partyMemberLabel.text = dic[@"congressman"];
    
    UILabel *partyPercentLabel = (UILabel*)[cell.contentView viewWithTag:3];
    partyPercentLabel.text = dic[@"percent"];
    // Configure the cell...
    
    return cell;
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
