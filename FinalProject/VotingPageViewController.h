//
//  VotingPageViewController.h
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/15.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IssueTableViewController.h"

@interface VotingPageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *issueTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *issueBodyLabel;
@property (strong, nonatomic) NSString *issueTitle;
@property (strong, nonatomic) NSString *issueBody;


@end
