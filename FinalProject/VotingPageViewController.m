//
//  VotingPageViewController.m
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/15.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "VotingPageViewController.h"

@interface VotingPageViewController (){
    bool showTheResultOfVote;
}
@property (weak, nonatomic) IBOutlet UIView *viewOfResult;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *resultLabelHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameOfResultHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pictureOfResultHeight;


@end

@implementation VotingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
    self.Title.text = self.issueTitle;
    
    showTheResultOfVote = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//生成相似的立委
- (IBAction)voteWithAgreeOrDisagree:(UIButton*)sender {
    
    if (showTheResultOfVote == NO) {
        self.resultLabelHeight.constant = 20.5;
        self.nameOfResultHeight.constant = 20.5;
        self.pictureOfResultHeight.constant = 190;
        showTheResultOfVote = YES;
    }
    [UIView animateWithDuration:0.2f animations:^{
        [self.view layoutIfNeeded];
    }];
    
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
