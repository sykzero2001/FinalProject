//
//  LegisCategoryTableViewController.h
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/15.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LawType){
    LawEconomy,
    LawInternal,
    LawFinance,
    LawForeign,
    LawTransportation,
    LawWelfare,
    LawEducation,
    LawJustice,
    LawHot,
};

@interface LegisCategoryTableViewController : UITableViewController

@property (assign, nonatomic) LawType lawType;

@end
