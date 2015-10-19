//
//  LoginInfo.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/16.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "LoginInfo.h"

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

@end
