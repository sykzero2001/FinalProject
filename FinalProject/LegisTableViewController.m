//
//  LegisFllowTableViewController.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/22.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "LegisTableViewController.h"
#import "LegisFollowTableViewCell.h"
#import "JYRadarChart.h"

@interface LegisTableViewController ()
{
    NSMutableArray *LegisFllowArray;
}
@end

@implementation LegisTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"LegisFollowTableViewCell"
                                bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:@"legisCellId"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 500;
    LegisFllowArray = [@[@{@"name":@"王金平",@"type":@1}, @{@"name":@"柯建民",@"type":@2},@{@"name":@"洪秀柱",@"type":@1}] mutableCopy];
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return LegisFllowArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LegisFollowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"legisCellId" forIndexPath:indexPath];
        NSDictionary *dic = LegisFllowArray[indexPath.row];
        UIImage *imageone = [UIImage imageNamed:@"國民黨徽"];
        UIImage *imagetwo = [UIImage imageNamed:@"民進黨徽"];
        UIImage *imageFirst = [UIImage imageNamed:@"第一名"];
        UIImage *imageSecond = [UIImage imageNamed:@"第二名"];
        UIImage *imageThird = [UIImage imageNamed:@"第三名"];
        cell.legisName.text = dic[@"name"];
        [self displayRadarChart:cell];
//        cell.radarHeight.constant = 300;
                NSNumber *type = dic[@"type"];
        switch (type.intValue) {
            case 1:
                cell.partImage.image = imageone;
                break;
            case 2:
                cell.partImage.image = imagetwo;
                break;
            default:
                break;
        };
        switch (indexPath.row) {
            case 0:
            cell.orderImage.image = imageFirst;
            break;
        case 1:
            cell.orderImage.image = imageSecond;
            break;
        case 2:
                cell.orderImage.image = imageThird;
                break;
        default:
            break;
        }

    
    return cell;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    NSString  *title ;
    if (section == 0) {
        title = @"選區意向相近立委前三名";
    }
    else
    {
        title = @"全國意向相近立委前三名";

    };
    return title;
}
-(void)displayRadarChart:(LegisFollowTableViewCell *)cell{
    //    JYRadarChart *p = [[JYRadarChart alloc] initWithFrame:CGRectMake(0, 100, 340, 340)];
//    cell.radarHeight.constant = 500;
    //        [UIView animateWithDuration:0.3f animations:^{
    //            [self.view layoutIfNeeded];
    //        }];

    NSArray *a1 = @[@(81), @(97), @(87), @(87), @(57), @(87), @(87), @(57)];
    NSArray *a2 = @[@(91), @(87), @(33), @(87), @(57), @(87), @(87), @(57)];
    
    //set the data series
    cell.radarView.dataSeries = @[a1, a2];
    
    //how many "circles" in the chart
    cell.radarView.steps = 4;
    
    //for the the entire background
    cell.radarView.backgroundColor = [UIColor whiteColor];
    
    //you can specify the background fill color
    //(just for the chart, not the entire background of the view)
    cell.radarView.backgroundFillColor = [UIColor whiteColor];
    
    //you can set radius, min and max value by yourself, but if you
    //leave r (will fill the rect), minValue (will be 0), maxValue (default is 100) alone,
    //that is okay. the points with too big value will be out of the chart and thus invisible
    cell.radarView.r = 100;
    cell.radarView.minValue = 20;
    cell.radarView.maxValue = 100;
    
    //you can choose whether fill area or not (just draw lines)
    cell.radarView.fillArea = YES;
    
    //you can specify the opacity, default is 1.0 (opaque)
    cell.radarView.colorOpacity = 0.7;
    cell.radarView.attributes = @[@"司法/法制",@"內政", @"經濟", @"財政", @"外交/國防", @"交通", @"社福/衛環",@"教育/文化"];
    
    //if you do not need a legend, you can safely get rid of setTitles:
    cell.radarView.showLegend = YES;
    [cell.radarView setTitles:@[@"自身意見取向", @"立委意見取向"]];
    
    //there is a color generator in the code, it will generate colors for you
    //so if you do not want to specify the colors yourself, just delete the line below
    [cell.radarView setColors:@[[UIColor redColor],[UIColor yellowColor]]];
    
    cell.radarView.contentMode = UIViewContentModeScaleToFill;
    
    
    //設定auto Layout
    
    //    p.translatesAutoresizingMaskIntoConstraints = NO;
    //    NSLayoutConstraint *constraint = [NSLayoutConstraint
    //                                            constraintWithItem:p attribute:NSLayoutAttributeCenterX
    //                                            relatedBy:NSLayoutRelationEqual toItem:self.similarView                                            attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];;
    //
    //    [self.view addConstraint:constraint];
    //
    //     constraint = [NSLayoutConstraint
    //                                            constraintWithItem:p attribute:NSLayoutAttributeTop
    //                                            relatedBy:NSLayoutRelationEqual toItem:self.similarView                                            attribute:NSLayoutAttributeTop multiplier:1 constant:110];
    //    [self.view addConstraint:constraint];
    //    constraint = [NSLayoutConstraint
    //                        constraintWithItem:p attribute:NSLayoutAttributeWidth
    //                        relatedBy:NSLayoutRelationEqual toItem:nil                                            attribute:NSLayoutAttributeWidth multiplier:1 constant:360];
    //    [self.view addConstraint:constraint];
    //    constraint = [NSLayoutConstraint
    //                        constraintWithItem:p attribute:NSLayoutAttributeHeight
    //                        relatedBy:NSLayoutRelationEqual toItem:nil                                            attribute:NSLayoutAttributeHeight multiplier:1 constant:360];
    //    [self.view addConstraint:constraint];
    
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
@end
