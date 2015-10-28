//
//  IssueViewController.m
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/20.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "IssueViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "VotingPageViewController.h"

@interface IssueViewController (){
    //int i;//for button
    
    NSMutableArray *mainArrayForBut;
    NSArray *issueArray;
}
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *issueCollectionBut;

@property (weak, nonatomic) IBOutlet UIButton *random;

@end

@implementation IssueViewController

//重新產生議題
- (IBAction)resetBut:(id)sender {
    [self getRandomIssue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getRandomIssue];
    self.random.layer.cornerRadius = self.random.bounds.size.width / 2.0;
}


//隨機產生議題
-(void) getRandomIssue {
    mainArrayForBut = [[NSMutableArray alloc] init];
    issueArray = @[@"農地", @"核四",@"服貿",@"吃飯",@"睡覺",@"打東東",@"哈囉",@"早安",@"午安"];
    while (mainArrayForBut.count<5) {
        NSUInteger randomIndex = arc4random() % [issueArray count];
        NSString *contain = [NSString stringWithFormat:@"SELF contains[c] '%@'", issueArray[randomIndex]];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:contain];
        NSArray *checkDuplicate = [mainArrayForBut filteredArrayUsingPredicate:predicate];
        long int lengthOfCheckDuplicate = checkDuplicate.count;
        if (lengthOfCheckDuplicate == 0) {
            [mainArrayForBut addObject:issueArray[randomIndex]];
        };
        NSLog(@"");
    };
    
    for (NSUInteger i = 0; i < 5; i++){
        UIButton *issues = self.issueCollectionBut[i];
        issues.layer.cornerRadius = issues.bounds.size.width / 2.0;
        [self.issueCollectionBut[i] setTitle:mainArrayForBut[i]  forState: UIControlStateNormal];
        
    }
}
//選擇按鍵後彈出對應議題的投票
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIButton *btn = sender;
    if ([segue.identifier isEqualToString:@"toVotingPage"]) {
        VotingPageViewController *votingpage = [segue destinationViewController];
        votingpage.issueTitle = btn.currentTitle;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonsClicked:(UIButton *)sender {

    [self performSegueWithIdentifier:@"toVotingPage" sender:sender];
    
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
