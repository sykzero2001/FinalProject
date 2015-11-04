//
//  UserNameViewController.m
//  FinalProject
//
//  Created by 鄭涵嚴 on 2015/10/27.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "UserNameViewController.h"
#import "LoginInfo.h"
#import <AFNetworking/AFNetworking.h>

@interface UserNameViewController ()<UITextFieldDelegate>
{
    NSArray *localArray;
}

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet UITextField *userEmailtext;
@property (weak, nonatomic) IBOutlet UITextField *userLocation;
@property (weak, nonatomic) IBOutlet UIPickerView *localPick;

@property (weak, nonatomic) IBOutlet UITextField *userNametext;
@end

@implementation UserNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    localArray = @[@"",@"基隆市",@"臺北市",@"新北市",@"臺中市",@"高雄市"];
    LoginInfo *loginfo = [LoginInfo logstatus] ;
    //    [loginfo getLoginfo:self] ;
    NSString *email = loginfo.userEmail ;
    NSString *name = loginfo.userName;
    NSString *location = loginfo.county;
    self.userNametext.text = name;
    self.userEmailtext.text = email;
    if (location != [NSNull alloc]) {
        self.userLocation.text = location;
    };
    
    // Do any additional setup after loading the view.
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:YES];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    self.topConstraint.constant = 20;
    LoginInfo *loginfo = [LoginInfo logstatus] ;
    NSUserDefaults *userDefault = [NSUserDefaults
                                   standardUserDefaults];
    NSString *loginToken = [userDefault objectForKey:@"loginToken"];
    NSString *apiName = [NSString stringWithFormat:@"http://jksong.tw/api/v1/profiles/%@",loginfo.userIdentify];
    if (loginToken != nil) {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:apiName parameters:@{@"auth_token":loginToken,@"profile":@{@"username":self.userNametext.text}} success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSONUSER: %@", responseObject);
            
        }
              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  NSLog(@"ErrorUSER: %@", error);
              }];
    };

    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField.tag == 101) {
        self.topConstraint.constant = 0;
    }
    return YES;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:
(NSInteger)component {
    long int returnValue;
    returnValue = localArray.count;
    return returnValue;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView
                      titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *returnValue ;
   returnValue = localArray[row];
//    [self.localPick selectRow:2 inComponent:1 animated:YES];
        return returnValue;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1; }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
