//
//  CatchTopthreeViewController.m
//  FinalProject
//
//  Created by 廖崇捷 on 2015/11/6.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "CatchTopthreeViewController.h"

@interface CatchTopthreeViewController ()

@end

@implementation CatchTopthreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.notiDic = self.catchDic;
     [[NSNotificationCenter defaultCenter] postNotificationName:@"UpdateUiNoti" object:nil userInfo:self.notiDic];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];

   

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
