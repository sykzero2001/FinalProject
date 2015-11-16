//
//  UserNameViewController.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/27.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "UserNameViewController.h"
#import "LoginInfo.h"
#import <AFNetworking/AFNetworking.h>

@interface UserNameViewController ()<UITextFieldDelegate>
{
    NSArray *localArray;
}

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet UITextField *userEmailtext;
@property (weak, nonatomic) IBOutlet UITextField *userLocation;

@property (weak, nonatomic) IBOutlet UITextField *userNametext;
@end

@implementation UserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LoginInfo *loginfo = [LoginInfo logstatus] ;
    NSString *email = loginfo.userEmail ;
    NSString *name = loginfo.userName;
    NSString *location = loginfo.county;
    self.userNametext.text = name;
    self.userEmailtext.text = email;
    if (location != [NSNull alloc]) {
        self.userLocation.text = location;
    };
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
