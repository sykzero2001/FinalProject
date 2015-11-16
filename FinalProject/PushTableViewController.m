//
//  PushTableViewController.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/28.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "PushTableViewController.h"
#import "LoginInfo.h"

@interface PushTableViewController ()

@end

@implementation PushTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewWillAppear:(BOOL)animated {
    LoginInfo *loginfo = [LoginInfo logstatus] ;
    _CellCheckmark = loginfo.mobilePush;
    if ([_CellCheckmark isEqualToString:@"是"]) {
        self.yesCell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.noCell.accessoryType = UITableViewCellAccessoryNone;
    }
    else if
        ([_CellCheckmark isEqualToString:@"否"])
    {
        self.yesCell.accessoryType = UITableViewCellAccessoryNone;
        self.noCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else
    {
        self.yesCell.accessoryType = UITableViewCellAccessoryNone;
        self.noCell.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        self.yesCell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.noCell.accessoryType = UITableViewCellAccessoryNone;
    }
    else{
        self.yesCell.accessoryType = UITableViewCellAccessoryNone;
        self.noCell.accessoryType = UITableViewCellAccessoryCheckmark;

    };

[tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
