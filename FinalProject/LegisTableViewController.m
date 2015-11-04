//
//  LegisFllowTableViewController.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "LegisTableViewController.h"
#import "LegisFollowTableViewCell.h"
#import "JYRadarChart.h"
#import <AFNetworking/AFNetworking.h>
#import "UIImageView+AFNetworking.h"
#import "LegisData.h"
#import "LoginInfo.h"

@interface LegisTableViewController ()
{
    NSMutableArray *legisArrayLocal;
    NSMutableArray *legisArrayAll;
    NSMutableDictionary *radarViewSet;
}
@end

@implementation LegisTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        UINib *nib = [UINib nibWithNibName:@"LegisFollowTableViewCell"
                                bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:@"legisCellId"];
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.RowHeight = 360;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setlegisLocation:) name:@"setuser" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewWillAppear:) name:@"reload" object:nil];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    legisArrayLocal = [@[] mutableCopy];
    legisArrayAll = [@[] mutableCopy];
    NSUserDefaults *userDefault = [NSUserDefaults
                                   standardUserDefaults];
    NSString *loginToken = [userDefault objectForKey:@"loginToken"];
    LoginInfo *login = [LoginInfo logstatus];
    [login getLoginfo:self] ;
    if (loginToken!= nil) {
        NSDictionary *paraAll = @{@"auth_token":loginToken,@"total_number":@"3"};
        [self getLegisApi:paraAll token:loginToken array:legisArrayAll];    };
    
    
    
}
-(void)setlegisLocation:(NSNotification*)info{
   NSDictionary *dic = info.userInfo;
    NSDictionary *paraLocal = @{@"auth_token":dic[@"token"],@"total_number":@"3",@"county":dic[@"county"]};
    NSLog(@"測試用戶區域%@",dic[@"county"]);
    [self getLegisApi:paraLocal token:dic[@"token"] array:legisArrayLocal];
    
}
-(void)getLegisApi:(NSDictionary*)parameter token:(NSString*)loginToken array:(NSMutableArray*)arrayAdd{

    if (loginToken != nil) {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://jksong.tw/api/v1/profiles/13/profile_legislators_ships" parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            NSLog(@"JSON: %@", responseObject);
            NSArray *array = responseObject[@"legislator"];
            NSString *maxScore = responseObject[@"user_max_vote"];
            for(NSDictionary *appDic in array ) {
                
                NSString *legistor = appDic[@"id"];
                NSString *imageUrl = appDic[@"image_url"] ;
                NSString *name = appDic[@"name"];
                NSArray *scoreArray = appDic[@"score_table"];
                //            NSString *party = appDic[@"party"];
                LegisData *legisData = [[LegisData alloc] init];
                legisData.name = name ;
                legisData.imageUrl = imageUrl;
                legisData.identify = legistor;
                legisData.scoreArray = scoreArray;
                legisData.maxScore = maxScore;
                legisData.partyUrl = appDic[@"party_url"];
                //            NSDictionary *legistorMember = @{@"name":name,@"image":imageUrl,@"id":legistor,@"scoreTable":scoreArray,@"maxScore":maxScore,@"party":party};
                [arrayAdd addObject:legisData];
                
                //            for (NSDictionary *scoreDic in scoreArray) {
                //                NSString *category = scoreDic[@"category"];
                //                NSString *legistorScore = scoreDic[@"le_get_score"];
                //                NSString *userScore = scoreDic[@"profile_score_max"];
                //                NSLog(@"立委名稱：%@  議題類型：%@  立委分數：%@  用戶分數： %@",name,category,legistorScore,userScore);
                //            };
                
            };
            NSLog(@"Result:%@",responseObject);
            [self.tableView reloadData];
        }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Error: %@", error);
             }];
    };
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
    if (section == 0) {
    return legisArrayLocal.count;
    }
    else{
    return legisArrayAll.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LegisFollowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"legisCellId" forIndexPath:indexPath];
    NSArray *legisArray ;
    if (indexPath.section == 0) {
        legisArray = legisArrayLocal;
        NSLog(@"Local: %@", legisArrayLocal);
    }
    else
    {
        legisArray = legisArrayAll;
        NSLog(@"All: %@", legisArrayAll);
    };
    
    if (legisArray != nil && legisArray.count != 0) {
        LegisData *legisData = legisArray[indexPath.row];
        //照片載入
        NSURL *imagUrl = [NSURL URLWithString:legisData.imageUrl];
        NSURL *partyUrl = [NSURL URLWithString:legisData.partyUrl];
        NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:imagUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
         NSMutableURLRequest *partyRequest = [NSMutableURLRequest requestWithURL:partyUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
        [cell.legisImage setImageWithURLRequest:imageRequest placeholderImage:nil
                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                            cell.legisImage.layer.cornerRadius = cell.legisImage.bounds.size.width / 8.0;
                                            cell.legisImage.image = image;
                                        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                            NSLog(@"error:%@",error);
                                        }];
        [cell.partImage setImageWithURLRequest:partyRequest placeholderImage:nil
                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                            cell.partImage.image = image;
                                            //                                            [self.tableView reloadData];
                                        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                            NSLog(@"error:%@",error);
                                        }];
        //        UIImage *imageone = [UIImage imageNamed:@"國民黨徽"];
        //        UIImage *imagetwo = [UIImage imageNamed:@"民進黨徽"];
        UIImage *imageFirst = [UIImage imageNamed:@"第一名"];
        UIImage *imageSecond = [UIImage imageNamed:@"第二名"];
        UIImage *imageThird = [UIImage imageNamed:@"第三名"];
        cell.legisName.text = legisData.name;
        [self displayRadarChart:cell legisData:legisData];

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
-(void)displayRadarChart:(LegisFollowTableViewCell *)cell legisData:(LegisData *)legisdata{
        JYRadarChart *radarView = [[JYRadarChart alloc] initWithFrame:CGRectMake(0,63, 300, 300)];
//    cell.radarHeight.constant = 500;
    //        [UIView animateWithDuration:0.3f animations:^{
    //            [self.view layoutIfNeeded];
    //        }];
    
//    [cell.radarView removeFromSuperview];
   
    NSArray *array =  legisdata.scoreArray;
    NSMutableArray *categoryArray = [@[] mutableCopy] ;
    NSMutableArray *legisScoreArray = [@[] mutableCopy];
    NSMutableArray *userScoreArray = [@[] mutableCopy];
    for (NSDictionary *scoreDic in array) {
        [categoryArray addObject:scoreDic[@"category"]];
        [legisScoreArray addObject:scoreDic[@"le_get_score"]];
        [userScoreArray addObject:scoreDic[@"profile_score_max"]];
        
    };
    NSArray *a1 = userScoreArray;
    NSArray *a2 = legisScoreArray;
    
    //set the data series
    radarView.dataSeries = @[a1, a2];
    
    //how many "circles" in the chart
    radarView.steps = legisdata.maxScore.intValue;
    
    //for the the entire background
    radarView.backgroundColor = [UIColor whiteColor];
    
    //you can specify the background fill color
    //(just for the chart, not the entire background of the view)
    radarView.backgroundFillColor = [UIColor whiteColor];

    //you can set radius, min and max value by yourself, but if you
    //leave r (will fill the rect), minValue (will be 0), maxValue (default is 100) alone,
    //that is okay. the points with too big value will be out of the chart and thus invisible
    radarView.r = 100;
    radarView.minValue = -1;
    radarView.maxValue = legisdata.maxScore.intValue;
    
    //you can choose whether fill area or not (just draw lines)
    radarView.fillArea = YES;
    
    //you can specify the opacity, default is 1.0 (opaque)
    radarView.colorOpacity = 0.7;
    radarView.attributes = categoryArray;
    
    //if you do not need a legend, you can safely get rid of setTitles:
    radarView.showLegend = YES;
    [radarView setTitles:@[@"自身意見取向", @"立委意見取向"]];
    
    //there is a color generator in the code, it will generate colors for you
    //so if you do not want to specify the colors yourself, just delete the line below
    [radarView setColors:@[[UIColor redColor],[UIColor colorWithRed:0.83 green:0.99 blue:0.47 alpha:1]]];
    
    radarView.contentMode = UIViewContentModeScaleToFill;
    
    [cell.contentView addSubview:radarView];
    //設定auto Layout
    
//        radarView.translatesAutoresizingMaskIntoConstraints = NO;
//        NSLayoutConstraint *constraint = [NSLayoutConstraint
//                                                constraintWithItem:radarView attribute:NSLayoutAttributeCenterX
//                                                relatedBy:NSLayoutRelationEqual
//                                          toItem:cell.contentView                                             attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];;
//    
//        [cell.contentView addConstraint:constraint];
//    
//         constraint = [NSLayoutConstraint
//                                                constraintWithItem:radarView attribute:NSLayoutAttributeTop
//                                                relatedBy:NSLayoutRelationEqual toItem:cell.legisName                                           attribute:NSLayoutAttributeTop multiplier:1 constant:20];
//        [cell.contentView addConstraint:constraint];
//    
//    constraint = [NSLayoutConstraint
//                  constraintWithItem:radarView attribute:NSLayoutAttributeBottom
//                  relatedBy:NSLayoutRelationEqual toItem:cell.contentView                                           attribute:NSLayoutAttributeTop multiplier:1 constant:20];
//    [cell.contentView addConstraint:constraint];
//        constraint = [NSLayoutConstraint
//                            constraintWithItem:radarView attribute:NSLayoutAttributeWidth
//                            relatedBy:NSLayoutRelationEqual toItem:nil                                            attribute:NSLayoutAttributeWidth multiplier:1 constant:300];
//        [radarView addConstraint:constraint];
//        constraint = [NSLayoutConstraint
//                            constraintWithItem:radarView attribute:NSLayoutAttributeHeight
//                            relatedBy:NSLayoutRelationEqual toItem:nil                                            attribute:NSLayoutAttributeHeight multiplier:1 constant:300];
//        [radarView addConstraint:constraint];
//    
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
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewAutomaticDimension;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewAutomaticDimension;
//}
@end
