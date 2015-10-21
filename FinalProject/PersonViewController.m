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
    _legislativeLike.hidden = YES;
//    _similarImage.layer.masksToBounds = YES;
    _similarImage.layer.cornerRadius = _similarImage.bounds.size.width / 2.0;
    [self displayRadarChart];
        // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
//    if (logstatus  == nil) {
////        logstatus =  [LoginInfo logstatus];
//        logstatus =  @"1";
    if([FBSDKAccessToken currentAccessToken])
    {
        NSString *urlStr = @"http://www.ly.gov.tw/upload/01_introduce/0102_chief/president/image/ly2000_8_00002f.jpg";
        NSURL *url = [NSURL URLWithString:urlStr];
        [_similarImage sd_setImageWithURL:url placeholderImage:nil];
    }
    else{
        LoginViewController *controller = [self.storyboard                                           instantiateViewControllerWithIdentifier:@"LoginViewController"];
        controller.presentType = @"person";
        [self presentViewController:controller animated:NO
                         completion:nil];
    }
   

}
- (IBAction)chooseSegment:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            _similarView.hidden = NO;
            _voteResultView.hidden = YES;
            _legislativeLike.hidden = YES;
        break;
        case 1:
            _similarView.hidden = YES;
            _voteResultView.hidden = NO;
            _legislativeLike.hidden = YES;
        break;
        case 2:
            _similarView.hidden = YES;
            _voteResultView.hidden = YES;
            _legislativeLike.hidden = NO;
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)displayRadarChart{
//    JYRadarChart *p = [[JYRadarChart alloc] initWithFrame:CGRectMake(0, 100, 340, 340)];
    
    NSArray *a1 = @[@(81), @(97), @(87), @(87), @(57), @(87), @(87), @(57)];
    NSArray *a2 = @[@(91), @(87), @(33), @(87), @(57), @(87), @(87), @(57)];
    
    //set the data series
    p.dataSeries = @[a1, a2];
    
    //how many "circles" in the chart
    p.steps = 4;
    
    //for the the entire background
    p.backgroundColor = [UIColor whiteColor];
    
    //you can specify the background fill color
    //(just for the chart, not the entire background of the view)
    p.backgroundFillColor = [UIColor whiteColor];
    
    //you can set radius, min and max value by yourself, but if you
    //leave r (will fill the rect), minValue (will be 0), maxValue (default is 100) alone,
    //that is okay. the points with too big value will be out of the chart and thus invisible
    p.r = 100;
    p.minValue = 20;
    p.maxValue = 100;
    
    //you can choose whether fill area or not (just draw lines)
    p.fillArea = YES;
    
    //you can specify the opacity, default is 1.0 (opaque)
    p.colorOpacity = 0.7;
    p.attributes = @[@"司法/法制",@"內政", @"經濟", @"財政", @"外交/國防", @"交通", @"社福/衛環",@"教育/文化"];
    
    //if you do not need a legend, you can safely get rid of setTitles:
    p.showLegend = YES;
    [p setTitles:@[@"自身意見取向", @"立委意見取向"]];
    
    //there is a color generator in the code, it will generate colors for you
    //so if you do not want to specify the colors yourself, just delete the line below
    [p setColors:@[[UIColor redColor],[UIColor yellowColor]]];
    
    p.contentMode = UIViewContentModeScaleToFill;
    [self.similarView addSubview:p];
    
    
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
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
