//
//  LegisCategoryTableViewController.m
//  FinalProject
//
//  Created by 廖崇捷 on 2015/10/15.
//  Copyright © 2015年 鄭涵嚴. All rights reserved.
//

#import "LegisCategoryTableViewController.h"

@interface LegisCategoryTableViewController (){
    
    NSMutableDictionary *dicLawEconomy, *dicLawInternal, *dicLawFinance, *dicLawForeign, *dicLawTransportation, *dicLawWelfare, *dicLawEducation, *dicLawJustice, *dicLawHot;
    
}

@end

@implementation LegisCategoryTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    dicLawEconomy = [NSMutableDictionary dictionaryWithDictionary:@{@"1":@"a",@"11":@"aa"}] ;
    dicLawInternal = [NSMutableDictionary dictionaryWithDictionary:@{@"2":@"b",@"22":@"bb"}] ;
    dicLawFinance = [NSMutableDictionary dictionaryWithDictionary:@{@"3":@"c",@"33":@"cc"}] ;
    dicLawForeign = [NSMutableDictionary dictionaryWithDictionary:@{@"4":@"d",@"44":@"dd"}] ;
    dicLawTransportation = [NSMutableDictionary dictionaryWithDictionary:@{@"5":@"e",@"55":@"ee"}] ;
    dicLawWelfare = [NSMutableDictionary dictionaryWithDictionary:@{@"6":@"f",@"66":@"ff"}] ;
    dicLawEducation = [NSMutableDictionary dictionaryWithDictionary:@{@"7":@"g",@"77":@"gg"}] ;
    dicLawJustice = [NSMutableDictionary dictionaryWithDictionary:@{@"8":@"h",@"88":@"hh"}] ;
    dicLawHot = [NSMutableDictionary dictionaryWithDictionary:@{@"9":@"i",@"99":@"ii"}] ;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Issue" forIndexPath:indexPath];
    
    
    switch (self.lawType){
        case LawEconomy:
            
            break;
        case LawInternal:
            break;
        case LawFinance:
            break;
        case LawForeign:
            break;
        case LawTransportation:
            break;
        case LawWelfare:
            break;
        case LawEducation:
            break;
        case LawJustice:
            break;
        case LawHot:
            break;
        default:
            break;
    }

    
    return cell;
}

@end
