//
//  LoginInfo.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/16.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "LoginInfo.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "MoreTableViewController.h"
#import "AppDelegate.h"
#import <AFNetworking/AFNetworking.h>
#import "LoginViewController.h"

@implementation LoginInfo
+ (LoginInfo *)logstatus
{
    static LoginInfo *myInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        myInstance = [[LoginInfo alloc] init];
    });
    // return the instance of this class
    return myInstance;
}
-(void)getLoginfo:(id)controller{
NSUserDefaults *userDefault = [NSUserDefaults
                                   standardUserDefaults];
NSString *loginToken = [userDefault objectForKey:@"loginToken"];
    UIViewController *control = controller;
    if (loginToken == nil) {
        LoginViewController *pushControl = [control.storyboard                                           instantiateViewControllerWithIdentifier:@"LoginViewController"];
        pushControl.presentType = @"person";
        [control presentViewController:pushControl animated:NO
                         completion:nil];
    }
    else
    {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://jksong.tw/api/v1/profiles/13/registed_data" parameters:@{@"auth_token":loginToken} success:^(AFHTTPRequestOperation *operation, id responseObject) {
          NSLog(@"JSON: %@", responseObject);
        NSDictionary *dic = responseObject[@"profile"];
        NSLog(@"bio:%@",dic[@"bio"]);
        self.userIdentify = dic[@"id"];
//        self.userEmail = result[@"email"];
        self.userName = dic[@"username"];
        NSDictionary *dicPara = @{@"name":dic[@"username"]};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"setuser" object:nil
                                                          userInfo:dicPara];

        }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    }

//    if([FBSDKAccessToken currentAccessToken])
//        {
//            UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc]
//                                                              initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//            UITableViewController *loadController = controller;
//            [loadController.view addSubview:activityIndicatorView];
//            activityIndicatorView.center = loadController.view.center;
//            [activityIndicatorView startAnimating];
//            AppDelegate *appdelegate = [[UIApplication sharedApplication] delegate];
//            appdelegate.window.userInteractionEnabled = NO;
//            [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me"
//                                               parameters:@{@"fields": @"name,id,picture,gender,birthday,email"}]
//             startWithCompletionHandler:^(FBSDKGraphRequestConnection
//                                          *connection, id result, NSError *error) {
//                 if (!error) {
//                     self.userIdentify = result[@"id"];
//                     self.userEmail = result[@"email"];
//                     self.userName = result[@"name"];
//                     
//                 }
//                 else
//                 {
//                     self.userIdentify = @"";
//                     self.userEmail = @"";
//                     self.userName = @"";
//                 };
//             [activityIndicatorView removeFromSuperview];
//             appdelegate.window.userInteractionEnabled = YES;
//             }];
//        }
//        else{
//            self.userIdentify = @"";
//            self.userEmail = @"";
//            self.userName = @"";
//        };
    
}
@end
