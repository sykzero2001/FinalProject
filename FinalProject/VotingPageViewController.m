//
//  VotingPageViewController.m
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/15.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "VotingPageViewController.h"
#import "XYPieChart.h"
#import <QuartzCore/QuartzCore.h>
@interface VotingPageViewController () <XYPieChartDataSource, XYPieChartDelegate>
{
    bool showTheResultOfVote;
}

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *resultLabelHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameOfResultHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureOfResultHeight;

@property (weak, nonatomic) IBOutlet XYPieChart *pieChart;

@end

@implementation VotingPageViewController
- (IBAction)nextQuestion:(id)sender {
    
    
}

- (IBAction)yesSelected:(id)sender {
    
    
}
- (IBAction)noSelected:(id)sender {
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    [self.pieChart setDelegate:self];
    [self.pieChart setDataSource:self];
    [self.pieChart setStartPieAngle:M_PI_2];	//optional
    [self.pieChart setAnimationSpeed:1.0];	//optional
    [self.pieChart setShowPercentage:YES];	//optional
    [self.pieChart setPieBackgroundColor:[UIColor colorWithWhite:0 alpha:1]];	//optional
    [self.pieChart setPieCenter:CGPointMake(240, 240)];	//optional
    [self.pieChart setLabelColor:[UIColor blackColor]];
//    [self.percentageLabel.layer setCornerRadius:90];
//    
//    self.sliceColors =[NSArray arrayWithObjects:
//                       [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
//                       [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
//                       [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
//                       [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
//                       [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],nil];
//    
//    //rotate up arrow
//    self.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
    
    self.issueTitleLabel.text = self.issueTitle;
    self.issueBodyLabel.text = self.issueBody;
    
    showTheResultOfVote = NO;
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return 5;
}
- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return 20;
}
//- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index;	//optional
//- (NSString *)pieChart:(XYPieChart *)pieChart textForSliceAtIndex:(NSUInteger)index;	//optional
//生成相似的立委
//- (IBAction)voteWithAgreeOrDisagree:(UIButton*)sender {
//    
//    if (showTheResultOfVote == NO) {
//        self.resultLabelHeight.constant = 20.5;
//        self.nameOfResultHeight.constant = 20.5;
//        self.pictureOfResultHeight.constant = 190;
//        showTheResultOfVote = YES;
//    }
//    [UIView animateWithDuration:0.2f animations:^{
//        [self.view layoutIfNeeded];
//    }];
//    
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
