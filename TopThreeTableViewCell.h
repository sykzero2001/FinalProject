//
//  TopThreeTableViewCell.h
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/31.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYRadarChart.h"

@interface TopThreeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet JYRadarChart *topThreeRadarView;
@property (weak, nonatomic) IBOutlet UILabel *nameOfCongressmanLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOfCongressman;

@end
