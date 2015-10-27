//
//  LegisFllowTableViewController.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/22.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "LegisFollowTableViewController.h"
#import "LegisFollowTableViewCell.h"

@interface LegisFollowTableViewController ()
{
    NSMutableArray *LegisFllowArray;
}
@end

@implementation LegisFollowTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.tableView.rowHeight = UITableViewAutomaticDimension;
    //self.tableView.estimatedRowHeight = 50;
    LegisFllowArray = [@[@{@"name":@"王金平",@"type":@1}, @{@"name":@"柯建民",@"type":@2}] mutableCopy];
    UINib *nib = [UINib nibWithNibName:@"LegisFollowTableViewCell"
                                bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:@"legisFollowCellId"];

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
    return LegisFllowArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LegisFollowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"legisFollowCellId" forIndexPath:indexPath];
        NSDictionary *dic = LegisFllowArray[indexPath.row];
        UIImage *imageone = [UIImage imageNamed:@"國民黨徽"];
        UIImage *imagetwo = [UIImage imageNamed:@"民進黨徽"];
        cell.legisName.text = dic[@"name"];
        NSNumber *type = dic[@"type"];
        switch (type.intValue) {
            case 1:
                cell.partImage.image = imageone;
                break;
            case 2:
                cell.partImage.image = imagetwo;
                break;
            default:
                break;
        }
        
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
