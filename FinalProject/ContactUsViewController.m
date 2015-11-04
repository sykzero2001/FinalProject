//
//  ContactUsViewController.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/11/3.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "ContactUsViewController.h"
#import <MessageUI/MessageUI.h>

@interface ContactUsViewController ()<MFMailComposeViewControllerDelegate>

@end

@implementation ContactUsViewController
- (IBAction)contactPhone:(UITapGestureRecognizer *)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"聯絡我們" message:@"撥號:0912345678" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelButton = [UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        BOOL result = [[UIApplication sharedApplication] openURL:
                       [NSURL URLWithString:@"tel://0912345678"]];
    }];
    UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"否"
                                                       style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                                                       }];
    [alertController addAction:cancelButton];
    [alertController addAction:okButton];
    [self presentViewController:alertController animated:YES completion:nil];

}
- (IBAction)contactUrl:(UITapGestureRecognizer *)sender {
    BOOL result = [[UIApplication sharedApplication] openURL:
                   [NSURL URLWithString:@"http://www.jksong.tw"]];
}
- (IBAction)contactEmail:(UITapGestureRecognizer *)sender {
    NSString *emailTitle = @"我有話說";
    // Email Content
    NSString *messageBody = @"iOS programming is so fun!";
    // To address
    NSArray *toRecipents = [NSArray arrayWithObject:@"purpleice9765@msn.com"];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:messageBody isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];

}
- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
      [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
