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

//    
//    switch (self.lawType){
//        case LawEconomy:
//            
//            break;
//        case LawInternal:
//            break;
//        case LawFinance:
//            break;
//        case LawForeign:
//            break;
//        case LawTransportation:
//            break;
//        case LawWelfare:
//            break;
//        case LawEducation:
//            break;
//        case LawJustice:
//            break;
//        case LawHot:
//            break;
//       default:
//            break;
//    }
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

    
//    NSArray *keys = [dicLawEconomy allKeys];
//    NSDictionary *dic = keys[1];
//    cell.textLabel.text = dic[@"a"];
//    cell.detailTextLabel.text = dic[@"1"];
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
