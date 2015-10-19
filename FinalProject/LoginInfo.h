//
//  LoginInfo.h
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/16.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginInfo : NSObject
+ (LoginInfo *)logstatus;
@property (strong, nonatomic) NSString *token;
@property (strong, nonatomic) NSString *userIdentify;
@property (strong, nonatomic) NSString *userEmail;
@end
