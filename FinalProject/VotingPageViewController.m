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

@end

@implementation VotingPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[[self navigationController] setNavigationBarHidden:YES animated:YES];
    
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
        CGRect newFrame = self.viewOfResult.frame;
        
        newFrame.size.width = 260;
        newFrame.size.height = 230;
        [self.viewOfResult setFrame:newFrame];
    }else {
        CGRect newFrame = self.viewOfResult.frame;
        
        newFrame.size.width = 0;
        newFrame.size.height = 0;
        [self.viewOfResult setFrame:newFrame];
    }
    
    [UIView animateWithDuration:0.3f animations:^{
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
