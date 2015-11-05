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
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    delegate.window.userInteractionEnabled = NO;
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc]
                                                      initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [control.view addSubview:activityIndicatorView];
    activityIndicatorView.center =  control.view.center;
    [activityIndicatorView startAnimating];
    if (loginToken == nil) {
        //若FB處於登入狀態,則直接跟SEVER要Token
        if ([FBSDKAccessToken currentAccessToken]) {
            [self getSeverToken];
            delegate.window.userInteractionEnabled = YES;
            [activityIndicatorView removeFromSuperview];
        }
        else
        {
       //若不在登入狀態則出示畫面要求登入
        LoginViewController *pushControl = [control.storyboard                                           instantiateViewControllerWithIdentifier:@"LoginViewController"];
//        pushControl.presentType = @"person";
        delegate.window.userInteractionEnabled = YES;
        [activityIndicatorView removeFromSuperview];
        [control presentViewController:pushControl animated:NO
                         completion:nil];
        }
    }
    else
    {
    //利用Token取得基本資料
    

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://jksong.tw/api/v1/profiles/13/registed_data" parameters:@{@"auth_token":loginToken} success:^(AFHTTPRequestOperation *operation, id responseObject) {
     //   NSLog(@"JSON: %@", responseObject);
        NSDictionary *dic = responseObject[@"profile"];
        self.userIdentify = dic[@"id"];
        self.userEmail = responseObject[@"user_email"];
        self.userName = dic[@"username"];
        self.mobilePush = responseObject[@"mobile_push"];
        NSString *county ;
        if (responseObject[@"county"] == [NSNull alloc]) {
            county = @"";
        }
        else
        {
             county= responseObject[@"county"];
        };
        self.county = county;
        NSDictionary *dicPara = @{@"name":dic[@"username"],@"mobilePush":responseObject[@"mobile_push"],@"county":county,@"token":loginToken};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"setuser" object:nil
                                                          userInfo:dicPara];
            delegate.window.userInteractionEnabled = YES;
            [activityIndicatorView removeFromSuperview];

        }
     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
         //token過期則在要一次token
        NSLog(@"Error: %@", error);
         [self getSeverToken];
         delegate.window.userInteractionEnabled = YES;
         [activityIndicatorView removeFromSuperview];
    }];
    }

        
    }


-(void)getSeverToken{
    //取得token
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
        //取得基本資料
            
            [manager GET:@"http://jksong.tw/api/v1/profiles/13/registed_data" parameters:@{@"auth_token":loginToken} success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"JSON: %@", responseObject);
                NSDictionary *dic = responseObject[@"profile"];
                self.userIdentify = dic[@"id"];
                self.userEmail = responseObject[@"user_email"];
                self.userName = dic[@"username"];
                self.mobilePush = responseObject[@"mobile_push"];
                self.county = responseObject[@"county"];
                
                NSDictionary *dicPara = @{@"name":dic[@"username"],@"mobilePush":responseObject[@"mobile_push"]};
                [[NSNotificationCenter defaultCenter] postNotificationName:@"setuser" object:nil
                                                                  userInfo:dicPara];
                
            }
                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     NSLog(@"Error: %@", error);

                 }];
        };
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end

