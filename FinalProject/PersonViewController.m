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
    NSLog(@"PersonViewDid");
    
}
-(void)viewWillAppear:(BOOL)animated{
    NSLog(@"PersonViewWill");
   

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
           self.tabBarController.hidesBottomBarWhenPushed = NO;
        break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

@end
