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
   // __block NSDictionary *resultOfVoteDic;
    __block NSArray *votePercentage;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *yeImageHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *noImageHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *passImageHeight;
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

- (IBAction)clean:(id)sender {
    LoginInfo *loginfo = [LoginInfo logstatus] ;
    [loginfo getLoginfo:self] ;
    NSUserDefaults *userDefault = [NSUserDefaults
                                   standardUserDefaults];
    NSString *loginToken = [userDefault objectForKey:@"loginToken"];
    if(loginToken == nil){
    }else{
        __block NSDictionary *result = [[NSDictionary alloc] init];
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:@"http://jksong.tw/api/v1/clear_all" parameters:@{@"auth_token":loginToken,@"id":self.issueID,@"votting":@"yes"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //    NSLog(@"===========%@=============",responseObject);
            result = responseObject;
        }
              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  NSLog(@"Error: %@", error);
                  result = @{};
              }];

        [self showResultOfVote];
        [self pieChartPerform];
    }

    
}

- (IBAction)yesSelected:(id)sender {
    LoginInfo *loginfo = [LoginInfo logstatus] ;
    [loginfo getLoginfo:self] ;
    NSUserDefaults *userDefault = [NSUserDefaults
                                   standardUserDefaults];
    NSString *loginToken = [userDefault objectForKey:@"loginToken"];
    if(loginToken == nil){
    }else{
        [self showResultOfVote];
        [self catchApi:@{@"auth_token":loginToken,@"id":self.issueID,@"votting":@"yes"}];
//        NSLog(@"%@",responseObject);
        
       
    }
}
- (IBAction)noSelected:(id)sender {
    LoginInfo *loginfo = [LoginInfo logstatus] ;
    [loginfo getLoginfo:self] ;
    NSUserDefaults *userDefault = [NSUserDefaults
                                   standardUserDefaults];
    NSString *loginToken = [userDefault objectForKey:@"loginToken"];
    if(loginToken == nil){
    }else{
        [self showResultOfVote];
        [self catchApi:@{@"auth_token":loginToken,@"id":self.issueID,@"votting":@"no"}];
//        NSLog(@"%@",responseObject);
//        [self pieChartPerform];

    }

}

- (IBAction)passSelected:(id)sender {
    LoginInfo *loginfo = [LoginInfo logstatus] ;
    [loginfo getLoginfo:self] ;
    NSUserDefaults *userDefault = [NSUserDefaults
                                   standardUserDefaults];
    NSString *loginToken = [userDefault objectForKey:@"loginToken"];
    if(loginToken == nil){
        
    }else{
        [self showResultOfVote];
        [self catchApi:@{@"auth_token":loginToken,@"id":self.issueID,@"votting":@"pass"}];
    }

}
- (IBAction)editSelected:(id)sender {
    [self showResultOfVote];
}

-(NSDictionary*)catchApi:(NSDictionary*) parameters
{
    __block NSDictionary *result = [[NSDictionary alloc] init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager POST:@"http://jksong.tw/api/v1/issue_vote" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"===========%@=============",responseObject);
        self.resultOfVoteDic = responseObject;
       
        // NSLog(@"===========%@=============",resultOfVoteDic);
         [self pieChartPerform];
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
    self.issueTitleLabel.text = self.issueTitle;
    self.issueBodyTextView.text = self.issueBody;
    _showTheResultOfVote = NO;
    
    if(_showTheResultOfVoteFromRight == YES){
        [self showResultOfVote];
        [self pieChartPerform];
    };
   // NSLog(@"===========%@=============viewdidload",resultOfVoteDic);
    // Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated{
//    [self viewWillDisappear:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"openConst" object:nil
                                                      userInfo:nil];
}

- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index{
    UIColor *color;
    if(index%3 == 0){
        color = [UIColor colorWithRed:207/255.0 green:37/255.0 blue:53/255.0 alpha:1];
    }else if(index%2 == 0){
        //贊成
        color = [UIColor colorWithRed:103/255.0 green:191/255.0 blue:133/255.0 alpha:1];
    }else{
        //不表態
        color = [UIColor colorWithRed:250/255.0 green:215/255.0 blue:104/255.0 alpha:1];;
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
    NSLog(@"=========piechartarray==%@=============",votePercentage);
    return [[votePercentage objectAtIndex:index] intValue];

}

-(void)pieChartPerform{
    //pieChart
    [self.pieChart setDataSource:self];
    [self.pieChart setStartPieAngle:M_PI_2];	//optional
    [self.pieChart setAnimationSpeed:1.0];	//optional
    [self.pieChart setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
    [self.pieChart setShowPercentage:YES];	//optional
    [self.pieChart setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];	//optional
    [self.pieChart setLabelShadowColor:[UIColor blackColor]];
    [self.pieChart setLabelColor:[UIColor blackColor]];
 
    
    votePercentage = @[[self.resultOfVoteDic objectForKey:@"total_no"],
                       [self.resultOfVoteDic objectForKey:@"total_pass"],
                       [self.resultOfVoteDic objectForKey:@"total_yes"]];
     [self.pieChart reloadData];
}

-(void)showResultOfVote{
    if (_showTheResultOfVote == NO) {
        self.votingButHeight.constant = 0;
        _showTheResultOfVote = YES;
        self.resultEditButHeight.constant = 30;
        self.yeImageHeight.constant = 40;
        self.noImageHeight.constant = 40;
        self.passImageHeight.constant = 40;
        [self.yesBut setTitleColor:[UIColor clearColor] forState:normal];
        [self.noBut setTitleColor:[UIColor clearColor] forState:normal];
        [self.passBut setTitleColor:[UIColor clearColor] forState:normal];
        [self.editBut setTitleColor:[UIColor blackColor] forState:normal];
        self.resultLabelHeight.constant = 20;
    }else{
        [self.yesBut setTitleColor:[UIColor blackColor] forState:normal];
        [self.noBut setTitleColor:[UIColor blackColor] forState:normal];
        [self.passBut setTitleColor:[UIColor blackColor] forState:normal];
        [self.editBut setTitleColor:[UIColor clearColor] forState:normal];
        self.votingButHeight.constant = 30;
        _showTheResultOfVote = NO;
        self.resultEditButHeight.constant = 0;
    }
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
