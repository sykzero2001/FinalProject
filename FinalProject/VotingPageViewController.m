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
#import "LoginInfo.h"
#import <AFNetworking/AFNetworking.h>
@interface VotingPageViewController () <XYPieChartDataSource, XYPieChartDelegate>
{
    bool showTheResultOfVote;
}
@property (weak, nonatomic) IBOutlet UIButton *yesBut;
@property (weak, nonatomic) IBOutlet UIButton *passBut;
@property (weak, nonatomic) IBOutlet UIButton *noBut;
@property (weak, nonatomic) IBOutlet UIButton *editBut;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *votingButHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *resultEditButHeight;
@property(nonatomic, strong) NSMutableArray *slices;
@property(nonatomic, strong) NSArray *sliceColors;
@property (weak, nonatomic) IBOutlet XYPieChart *pieChart;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *resultLabelHeight;

@end

@implementation VotingPageViewController
- (IBAction)nextQuestion:(id)sender {
    
    
}

- (IBAction)yesSelected:(id)sender {
    [self showResultOfVote];
    LoginInfo *loginfo = [LoginInfo logstatus] ;
    [loginfo getLoginfo:self] ;
    NSUserDefaults *userDefault = [NSUserDefaults
                                   standardUserDefaults];
    NSString *loginToken = [userDefault objectForKey:@"loginToken"];
    if(loginToken != nil){
         NSDictionary *responseObject =  [self catchApi:@{@"auth_token":loginToken,@"id":self.issueID,@"votting":@"yes"}];
        NSLog(@"%@",responseObject);
    }
    [self pieChartPerform];
}
- (IBAction)noSelected:(id)sender {
    [self showResultOfVote];
    LoginInfo *loginfo = [LoginInfo logstatus] ;
    [loginfo getLoginfo:self] ;
    NSUserDefaults *userDefault = [NSUserDefaults
                                   standardUserDefaults];
    NSString *loginToken = [userDefault objectForKey:@"loginToken"];
    if(loginToken != nil){
        NSDictionary *responseObject =  [self catchApi:@{@"auth_token":loginToken,@"id":self.issueID,@"votting":@"no"}];
        NSLog(@"%@",responseObject);

    }
    [self pieChartPerform];

}

- (IBAction)passSelected:(id)sender {
    [self showResultOfVote];
    LoginInfo *loginfo = [LoginInfo logstatus] ;
    [loginfo getLoginfo:self] ;
    NSUserDefaults *userDefault = [NSUserDefaults
                                   standardUserDefaults];
    NSString *loginToken = [userDefault objectForKey:@"loginToken"];
    if(loginToken != nil){
        
    NSDictionary *responseObject =  [self catchApi:@{@"auth_token":loginToken,@"id":self.issueID,@"votting":@"pass"}];
        NSLog(@"%@",responseObject);
    }
    [self pieChartPerform];

}
- (IBAction)editSelected:(id)sender {
    [self showResultOfVote];
}

-(NSDictionary*)catchApi:(NSDictionary*) parameters
{
    __block NSDictionary *result = [[NSDictionary alloc] init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://jksong.tw/api/v1/issue_vote" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"===========%@=============",responseObject);
        result = responseObject;
    }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              NSLog(@"Error: %@", error);
              result = @{};
          }];
return result;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"issueID %@",self.issueID);
//    [[self navigationController] setNavigationBarHidden:YES animated:YES];
//    [self.pieChart setDelegate:self];
  
    
 //    [self.percentageLabel.layer setCornerRadius:90];
//
    
//                       //
//    //rotate up arrow
//    self.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
    
    self.issueTitleLabel.text = self.issueTitle;
    self.issueBodyLabel.text = self.issueBody;
   
    showTheResultOfVote = NO;
    // Do any additional setup after loading the view.
}

- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index{
    UIColor *color;
    if(index%3 == 0){
        color = [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1];
    }else if(index%2 == 0){
        color = [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1];
    }else{
        color = [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1];;
    }
    return color;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return 3;
}
- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return 100/3;
}

-(void)pieChartPerform{
    //pieChart
    [self.pieChart setDataSource:self];
    [self.pieChart setStartPieAngle:M_PI_2];	//optional
    [self.pieChart setAnimationSpeed:1.0];	//optional
    //   [self.pieChart setLabelRadius:160];
    [self.pieChart setShowPercentage:YES];	//optional
    [self.pieChart setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];	//optional
    [self.pieChart setLabelShadowColor:[UIColor blackColor]];
    [self.pieChart setLabelColor:[UIColor blackColor]];
     [self.pieChart reloadData];
}
//- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index;	//optional
//- (NSString *)pieChart:(XYPieChart *)pieChart textForSliceAtIndex:(NSUInteger)index;	//optional
//生成相似的立委
//- (IBAction)voteWithAgreeOrDisagree:(UIButton*)sender {
-(void)showResultOfVote{
    if (showTheResultOfVote == NO) {
        self.votingButHeight.constant = 0;
        showTheResultOfVote = YES;
        self.resultEditButHeight.constant = 30;
        [self.yesBut setTitleColor:[UIColor clearColor] forState:normal];
        [self.noBut setTitleColor:[UIColor clearColor] forState:normal];
        [self.passBut setTitleColor:[UIColor clearColor] forState:normal];
        [self.editBut setTitleColor:[UIColor blackColor] forState:normal];
        self.resultLabelHeight.constant = 20;
     
//        self.sliceColors = [NSArray arrayWithObjects:
//                            [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
//                            [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
//                            [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],nil];
       

//            [UIView animateWithDuration:0.01f animations:^{
//            [self.view layoutIfNeeded]; }];
        }else{
            [self.yesBut setTitleColor:[UIColor blackColor] forState:normal];
            [self.noBut setTitleColor:[UIColor blackColor] forState:normal];
            [self.passBut setTitleColor:[UIColor blackColor] forState:normal];
            [self.editBut setTitleColor:[UIColor clearColor] forState:normal];
            self.votingButHeight.constant = 30;
            showTheResultOfVote = NO;
            self.resultEditButHeight.constant = 0;
//            [UIView animateWithDuration:0.01f animations:^{
//                [self.view layoutIfNeeded]; }];
        }
}
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
