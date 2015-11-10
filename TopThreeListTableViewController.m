//
//  TopThreeListTableViewController.m
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/30.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "TopThreeListTableViewController.h"
#import "JYRadarChart.h"
#import "LegisFollowTableViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import "LegisData.h"
#import "UIImageView+AFNetworking.h"

@interface TopThreeListTableViewController (){
    NSMutableArray *congressmanRankArray;
    NSDictionary *paraAll;
    NSString *categoryType;
}

@end

@implementation TopThreeListTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UINib *nib = [UINib nibWithNibName:@"LegisFollowTableViewCell"
                                bundle:nil];
    [self.tableView registerNib:nib
         forCellReuseIdentifier:@"legisCellId"];
    //    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.rowHeight = 360;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateUi:) name:@"UpdateUiNoti" object:nil];
    
   
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    
}

-(void)updateUi:(NSNotification*)noti {
    NSDictionary *dic = noti.userInfo;
//    NSString *paraAll = dic[@"category"];
    congressmanRankArray = [@[] mutableCopy];
    [self getLegisApi:dic  array:congressmanRankArray];
}

-(void)getLegisApi:(NSDictionary*)parameter array:(NSMutableArray*)arrayAdd{
    
   
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:@"http://www.jksong.tw/api/v1/legislators" parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
            //            NSLog(@"JSON: %@", responseObject);
            NSArray *array = responseObject[@"legislator"];
            categoryType = parameter[@"category"];
            for(NSDictionary *appDic in array ) {
                NSString *maxScore = appDic[@"score_max"];
                NSString *legistor = appDic[@"id"];
                NSString *imageUrl = appDic[@"image"] ;
                NSString *name = appDic[@"name"];
                NSArray *scoreArray = appDic[@"score_table"];
                //            NSString *party = appDic[@"party"];
                LegisData *legisData = [[LegisData alloc] init];
                legisData.name = name ;
                legisData.imageUrl = imageUrl;
                legisData.identify = legistor;
                legisData.scoreArray = scoreArray;
                 legisData.maxScore = maxScore;

                legisData.partyUrl = appDic[@"party_logo"];
                [arrayAdd addObject:legisData];
        
                
            };
            NSLog(@"Result:%@",responseObject);
            [self.tableView reloadData];
        }
             failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Error: %@", error);
             }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

        return congressmanRankArray.count;
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LegisFollowTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"legisCellId" forIndexPath:indexPath];
    NSArray *legisArray ;
        legisArray = congressmanRankArray;
   
    
    if (legisArray != nil && legisArray.count != 0) {
        LegisData *legisData = legisArray[indexPath.row];
        //照片載入
        NSURL *imagUrl = [NSURL URLWithString:legisData.imageUrl];
        NSURL *partyUrl = [NSURL URLWithString:legisData.partyUrl];
        UIImage *loadLegis = [UIImage imageNamed:@"下載中"];
        UIImage *loadParty = [UIImage imageNamed:@"黨徽下載中"];
        NSMutableURLRequest *imageRequest = [NSMutableURLRequest requestWithURL:imagUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
        NSMutableURLRequest *partyRequest = [NSMutableURLRequest requestWithURL:partyUrl cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
        [cell.legisImage setImageWithURLRequest:imageRequest placeholderImage:loadLegis
                                        success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
                                            cell.legisImage.layer.cornerRadius = cell.legisImage.bounds.size.width / 8.0;
                                            cell.legisImage.image = image;
                                        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
                                            NSLog(@"error:%@",error);
                                        }];
        [cell.partImage setImageWithURLRequest:partyRequest placeholderImage:loadParty
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
    
    return title;
}
-(void)displayRadarChart:(LegisFollowTableViewCell *)cell legisData:(LegisData *)legisdata{
    JYRadarChart *radarView = [[JYRadarChart alloc] initWithFrame:CGRectMake(10,80, 295, 250)];
    //    cell.radarHeight.constant = 500;
    //        [UIView animateWithDuration:0.3f animations:^{
    //            [self.view layoutIfNeeded];
    //        }];
    
    //    [cell.radarView removeFromSuperview];
    
    NSArray *array =  legisdata.scoreArray;
    NSMutableArray *categoryArray = [@[] mutableCopy] ;
    NSMutableArray *legisScoreArray = [@[] mutableCopy];
    for (NSDictionary *scoreDic in array) {
        if ([scoreDic[@"category"] isEqualToString:@"total"]) {
            
        }else{[categoryArray addObject:scoreDic[@"category"]];
        [legisScoreArray addObject:scoreDic[@"le_get_score"]];
        }
    };
    NSArray *a2 = legisScoreArray;
    
    //set the data series
    radarView.dataSeries = @[a2];
    
    //how many "circles" in the chart
  
    
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
    
    if ([categoryType isEqualToString:@"total"]) {
        NSString *maxScore ;
        NSSortDescriptor *sortCondition = [[NSSortDescriptor alloc] initWithKey:nil ascending:NO];
        NSArray *sortArray = [legisScoreArray sortedArrayUsingDescriptors:@[sortCondition]];
        maxScore = sortArray[0];
        radarView.maxValue = maxScore.intValue;
        radarView.steps = maxScore.intValue;
    }
    else
    {
    radarView.maxValue = legisdata.maxScore.intValue;
    radarView.steps = legisdata.maxScore.intValue;
    };
    
    //you can choose whether fill area or not (just draw lines)
    radarView.fillArea = YES;
    
    //you can specify the opacity, default is 1.0 (opaque)
    radarView.colorOpacity = 0.7;
    radarView.attributes = categoryArray;
    
    //if you do not need a legend, you can safely get rid of setTitles:
    radarView.showLegend = YES;
    [radarView setTitles:@[@"立委排名"]];
    
    //there is a color generator in the code, it will generate colors for you
    //so if you do not want to specify the colors yourself, just delete the line below
    [radarView setColors:@[[UIColor blueColor]]];
    
    radarView.contentMode = UIViewContentModeScaleToFill;
    
    [cell.contentView addSubview:radarView];
  
}

@end
