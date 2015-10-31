//
//  CongressTopThreeViewController.m
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/30.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "CongressTopThreeViewController.h"
#import "TopThreeListTableViewController.h"
@interface CongressTopThreeViewController ()

@end

@implementation CongressTopThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//選擇按鍵後彈出對應議題的投票
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIButton *btn = sender;
    if ([segue.identifier isEqualToString:@"toTopThreeList"]) {
        TopThreeListTableViewController *topThreeListController = [segue destinationViewController];
        topThreeListController.categoriesOfLaw = btn.currentTitle;
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
