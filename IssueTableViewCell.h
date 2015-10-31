//
//  IssueTableViewCell.h
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/29.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IssueTableViewCell : UITableViewCell

@property (nonatomic) NSString *category;
@property (weak, nonatomic) IBOutlet UILabel *typeOfLawLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameOfIssueLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyOfIssueLabel;
@end
