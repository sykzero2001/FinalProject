//
//  CongressTopThreeViewController.m
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/30.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "CongressTopThreeViewController.h"
#import "TopThreeListTableViewController.h"
#import "CatchTopthreeViewController.h"
@interface CongressTopThreeViewController (){
    NSDictionary *dic;
}
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *issueCollectionBut;
@end

@implementation CongressTopThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        for (NSUInteger i = 0; i < 10; i++){
            UIButton *issues = self.issueCollectionBut[i];
            issues.layer.cornerRadius = 10;
        }
//    self.random.layer.cornerRadius = 10;
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

- (IBAction)buttonsClicked:(UIButton *)sender {
    UIButton *btn = sender;
     CatchTopthreeViewController *controller =
    [self.storyboard instantiateViewControllerWithIdentifier:@"TopThreeViewController"];
    
    NSLog(@"按鈕名稱%@",btn.currentTitle);
    if ([btn.currentTitle isEqualToString:@"教育/文化"]){
        dic = @{@"category":@"education"};
    }else if([btn.currentTitle isEqualToString:@"社福/衛環"]){
        dic = @{@"category":@"social"};
    }else if([btn.currentTitle isEqualToString:@"交通"]){
        dic = @{@"category":@"traffic"};
    }else if([btn.currentTitle isEqualToString:@"內政"]){
        dic = @{@"category":@"interior"};
    }else if([btn.currentTitle isEqualToString:@"外交/國防"]){
        dic = @{@"category":@"diplomacy"};
    }else if([btn.currentTitle isEqualToString:@"司法/法制"]){
        dic = @{@"category":@"law"};
    }else if([btn.currentTitle isEqualToString:@"經濟"]){
        dic = @{@"category":@"economy"};
    }else if([btn.currentTitle isEqualToString:@"財政"]){
        dic = @{@"category":@"finance"};
    }else if([btn.currentTitle isEqualToString:@"民心所向"]){
        dic = @{@"category":@"total"};
    }else if([btn.currentTitle isEqualToString:@"民心盡失"]){
        dic = @{@"category":@"law"};
    }
    
    controller.catchDic = dic;
    [self.navigationController pushViewController:controller
                                         animated:YES];
    
    

//    [self dismissViewControllerAnimated:YES completion:nil];
//    [self performSegueWithIdentifier:@"toTopThreeList" sender:sender];
    
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
