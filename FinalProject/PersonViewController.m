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

@property (weak, nonatomic) IBOutlet UIView *similarView;
@property (weak, nonatomic) IBOutlet UIView *voteResultView;
@property (weak, nonatomic) IBOutlet UIView *legislativeLike;
@property (weak, nonatomic) IBOutlet UIImageView *similarImage;
@property (weak, nonatomic) IBOutlet JYRadarChart *p;
@end

@implementation PersonViewController
@synthesize p ;

- (void)viewDidLoad {
    [super viewDidLoad];
    _similarView.hidden = NO;
    _voteResultView.hidden = YES;
//    _similarImage.layer.masksToBounds = YES;
    _similarImage.layer.cornerRadius = _similarImage.bounds.size.width / 2.0;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
