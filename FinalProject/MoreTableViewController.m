//
//  MoreTableViewController.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/27.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "MoreTableViewController.h"
#import "LoginInfo.h"
#import "UserNameViewController.h"
#import "PushTableViewController.h"

@interface MoreTableViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableDictionary *userInfo;
}

@end

@implementation MoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setUserName:) name:@"setuser" object:nil];
}
-(void)viewWillAppear:(BOOL)animated   {
    LoginInfo *loginfo = [LoginInfo logstatus] ;
   [loginfo getLoginfo:self] ;

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)setUserName:(NSNotification*)name{

    NSDictionary *dic = name.userInfo;
    self.nameLabel.text = dic[@"name"];
    self.pushLabel.text = dic[@"mobilePush"];
    [self.tableView reloadData];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - Table view data source

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
