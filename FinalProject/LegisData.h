//
//  LegisData.h
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/11/3.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LegisData : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) NSString *party;
@property (strong, nonatomic) NSString *identify;
@property (strong, nonatomic) NSArray *scoreArray;
@property (strong, nonatomic) NSString *maxScore;
@property (strong, nonatomic) NSString *partyLogo;

@end
