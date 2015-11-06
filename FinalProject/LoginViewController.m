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
#import <AFNetworking/AFNetworking.h>

@interface LoginViewController ()<FBSDKLoginButtonDelegate>
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *blur;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@end

@implementation LoginViewController


-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.blur.alpha = 0.6;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"登入畫面"];
    CGRect frame = self.view.frame;
    //裁切圖片符合畫面大小
    UIGraphicsBeginImageContext(frame.size );
    [image drawInRect:CGRectMake(0,0,frame.size.width,frame.size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:newImage];
    self.view.alpha = 0.8;
    
//    self.loginButton.alpha = 1;
//    self.cancelButton.alpha = 1;
    _loginButton.readPermissions =
    @[@"public_profile", @"email", @"user_friends"];
//    _loginButton.center = self.view.center;
    _loginButton.delegate = self;
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelButton setTitleColor:nil forState:UIControlStateNormal];
    _cancelButton.backgroundColor = [UIColor whiteColor] ;
    _cancelButton.layer.cornerRadius = 5;
    
//    _cancelButton.layer.borderColor = [UIColor whiteColor].CGColor;
//    _cancelButton.layer.borderWidth = 2 ;
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
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ChangetabNoti" object:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error{
    if ([FBSDKAccessToken currentAccessToken]) {
        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc]
                                      initWithGraphPath:@"me"
                                      parameters:@{@"fields" : @"email, name, first_name, last_name"}
                                      HTTPMethod:@"GET"];
        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection,
                                              NSDictionary *result,
                                              NSError *error) {
            // Handle the result
            FBSDKAccessToken * fbAccessToken = [FBSDKAccessToken currentAccessToken];
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            NSString *token = fbAccessToken.tokenString;
            NSString *uid = fbAccessToken.userID;
            [manager POST:@"http://jksong.tw/api/v1/login" parameters:@{@"access_token":token,@"uid":uid} success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSString *message = responseObject[@"message"];
                if ([message isEqualToString:@"Ok"]) {
                    NSString *loginToken = responseObject[@"auth_token"];
                    NSUserDefaults *userDefault = [NSUserDefaults
                                                   standardUserDefaults];
                    [userDefault setObject:loginToken forKey:@"loginToken"];
                    [userDefault synchronize];
                    [self dismissViewControllerAnimated:YES completion:nil];
                };
                //            NSLog(@"JSON: %@", responseObject);
                
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"Error: %@", error);
            }];
            //        LoginInfo *loginfo = [LoginInfo logstatus] ;
            //        [loginfo getLoginfo:self] ;
            //       NSString *identi = loginfo.userIdentify  ;
            //        if (identi  != nil ) {
            //            [self dismissViewControllerAnimated:YES completion:nil];
            //        }
            
        }];

    }
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
