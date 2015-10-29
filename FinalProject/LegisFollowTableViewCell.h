//
//  LegisFollowTableViewCell.h
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/22.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JYRadarChart.h"

@interface LegisFollowTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *legisName;
@property (weak, nonatomic) IBOutlet UIImageView *partImage;
@property (weak, nonatomic) IBOutlet UIImageView *LegisImage;
@property (weak, nonatomic) IBOutlet JYRadarChart *radarView;

@end
