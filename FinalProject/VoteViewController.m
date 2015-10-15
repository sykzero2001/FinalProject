//
//  VoteViewController.m
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/15.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "VoteViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface VoteViewController ()
@property (weak, nonatomic) IBOutlet UIButton *financeBtn;

@property (weak, nonatomic) IBOutlet UIButton *interiorBtn;
@property (weak, nonatomic) IBOutlet UIButton *foreignBtn;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *ad;

@end

@implementation VoteViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.financeBtn.layer.cornerRadius = self.financeBtn.bounds.size.width / 2.0;
    self.interiorBtn.layer.cornerRadius = self.interiorBtn.bounds.size.width / 2.0;
    self.foreignBtn.layer.cornerRadius = self.foreignBtn.bounds.size.width / 2.0;
    UIButton *tmp = self.ad[1];
    
    tmp.layer.cornerRadius = tmp.bounds.size.width / 2.0;
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(40,40,50,50); // x,y自行設定
//    btn.layer.borderWidth = 1.0f; //設定邊線寬度
//    btn.layer.borderColor = [UIColor blackColor].CGColor; //設定邊線顏色
//    btn.layer.masksToBounds = YES;  //這行要有才能顯示出來
//    btn.layer.cornerRadius = 15.0f; //邊角15.0f，自行設定邊角圓弧度
//    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
