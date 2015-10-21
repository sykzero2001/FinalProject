//
//  VoteTableViewCell.h
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/20.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VoteTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@property (weak, nonatomic) IBOutlet UIImageView *cellImage;

@end
