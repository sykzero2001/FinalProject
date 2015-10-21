//
//  LoginViewController.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/16.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "LoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "TabViewController.h"
#import "LoginInfo.h"

@interface LoginViewController ()<FBSDKLoginButtonDelegate>
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
    _loginButton.center = self.view.center;
    _loginButton.delegate = self;
//    [self.view addSubview:_loginButton];

    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated   {
//    [self.view addConstraint:constraint];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-(void)viewDidAppear:(BOOL)animated{
//    
//    if ([FBSDKAccessToken currentAccessToken]) {
//        
//        [self dismissViewControllerAnimated:YES completion:nil];
//
//    }
////    else{
////           }
//}
- (IBAction)back:(UIButton *)sender {
    if ([_presentType isEqualToString:@"person" ]) {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangetabNoti" object:nil];
    };
        [self dismissViewControllerAnimated:YES completion:nil];
    
    
}
- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error{
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                  initWithGraphPath:@"me"
                                  parameters:@{@"fields" : @"email, name, first_name, last_name"}
                                  HTTPMethod:@"GET"];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                          NSDictionary *result,
                                          NSError *error) {
        // Handle the result
        NSString *identi = result[@"id"] ;
        LoginInfo *loginfo = [LoginInfo logstatus] ;
        loginfo.userIdentify = identi ;
        if (identi  != nil ) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
       
    }];
}

/*!
 @abstract Sent to the delegate when the button was used to logout.
 @param loginButton The button that was clicked.
 */
- (void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    
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
