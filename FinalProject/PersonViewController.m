//
//  PersonViewController.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/15.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "PersonViewController.h"
#import "JYRadarChart.h"
#import "LoginViewController.h"
#import "LoginInfo.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <SDWebImage/UIImageView+WebCache.h>


@interface PersonViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;

@property (weak, nonatomic) IBOutlet UIView *similarView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topconst;
@property (weak, nonatomic) IBOutlet UIView *voteResultView;
@end

@implementation PersonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _similarView.hidden = NO;
    _voteResultView.hidden = YES;
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(openConst) name:@"openConst" object:nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeConst) name:@"closeConst" object:nil];
//    _similarImage.layer.masksToBounds = YES;
//    LoginInfo *loginfo = [LoginInfo logstatus] ;
//    [loginfo getLoginfo:self] ;
        // Do any additional setup after loading the view.
    
}
-(void)viewWillAppear:(BOOL)animated{
//    if (logstatus  == nil) {
////        logstatus =  [LoginInfo logstatus];
//        logstatus =  @"1";
//    LoginInfo *loginfo = [LoginInfo logstatus] ;
//    [loginfo getLoginfo:self] ;
//    if([FBSDKAccessToken currentAccessToken])
//    {
//        
//        NSString *urlStr = @"http://www.ly.gov.tw/upload/01_introduce/0102_chief/president/image/ly2000_8_00002f.jpg";
//        NSURL *url = [NSURL URLWithString:urlStr];
//        [_similarImage sd_setImageWithURL:url placeholderImage:nil];
//    }
//    else{
//        
//    }
   

}
- (IBAction)chooseSegment:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            _similarView.hidden = NO;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"reload" object:nil
                                                              userInfo:nil];
            _voteResultView.hidden = YES;
        break;
        case 1:
            _similarView.hidden = YES;
            _voteResultView.hidden = NO;
        break;
        case 2:
            _similarView.hidden = YES;
            _voteResultView.hidden = YES;
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)openConst{
    [self.segment setTintColor:[UIColor colorWithRed:0.15 green:0.84 blue:0.8 alpha:1]];
    self.segmentConstraint.constant = 28;
    self.topconst.constant = 5;
}
-(void)closeConst{
    [self.segment setTintColor:[UIColor clearColor]];
    self.segmentConstraint.constant = 0;
    self.topconst.constant = 0;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
