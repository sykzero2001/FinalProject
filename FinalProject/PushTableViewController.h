//
//  PushTableViewController.h
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/28.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushTableViewController : UITableViewController
@property (weak, nonatomic) IBOutlet UITableViewCell *yesCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *noCell;
@property (strong, nonatomic) NSString *CellCheckmark;
@end
