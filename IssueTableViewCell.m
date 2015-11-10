//
//  IssueTableViewCell.m
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/29.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "IssueTableViewCell.h"

@implementation IssueTableViewCell

-(UILabel *)typeOfLawLabel
{
    if ([self.category isEqualToString:@"外交/國防" ])
    {
        _typeOfLawLabel.textColor = [UIColor redColor];
    }
    else if ([self.category isEqualToString:@"經濟" ])
    {
        _typeOfLawLabel.textColor = [UIColor grayColor];
    }
    else if ([self.category isEqualToString:@"財政" ])
    {
        _typeOfLawLabel.textColor = [UIColor blueColor];
    }
    else if ([self.category isEqualToString:@"內政" ] )
    {
        _typeOfLawLabel.textColor = [UIColor blackColor];
    }
    else if ([self.category isEqualToString:@"司法/法制" ])
    {
        _typeOfLawLabel.textColor = [UIColor brownColor];
    }
    else if ([self.category isEqualToString:@"社福/衛環" ] )
    {
        _typeOfLawLabel.textColor = [UIColor purpleColor];
    }
   
    
    return _typeOfLawLabel;
}


@end
