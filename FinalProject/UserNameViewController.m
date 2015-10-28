//
//  UserNameViewController.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/27.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "UserNameViewController.h"
#import "LoginInfo.h"

@interface UserNameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userEmailtext;

@property (weak, nonatomic) IBOutlet UITextField *userNametext;
@end

@implementation UserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LoginInfo *loginfo = [LoginInfo logstatus] ;
    //    [loginfo getLoginfo:self] ;
    NSString *email = loginfo.userEmail ;
    NSString *name = loginfo.userName;
    self.userNametext.text = name;
    self.userEmailtext.text = email;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
