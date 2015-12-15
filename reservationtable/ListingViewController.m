//
//  ListingViewController.m
//  ecaHUB
//
//  Created by promatics on 3/19/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "ListingViewController.h"

@interface ListingViewController (){
    
    BOOL isSelectAll;
}
@end

@implementation ListingViewController

@synthesize array_data,delegate,isMultipleSelected,tblView_list,barButton_cancel,barButton_save,selectedData,get_attended_date,getCurrentAttenddate;//barButton_SelectAll;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //self.navigationItem.leftBarButtonItem = barButton_cancel;
    
     //[self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
        
    //[self.navigationController.navigationBar setBarTintColor:UIColorFromRGB(default_app_blueColor)];

    isSelectAll = YES;
    
    if (isMultipleSelected) {
        
        self.navigationItem.rightBarButtonItems = @[barButton_save];
        
        tblView_list.editing = YES;
        
        [array_data insertObject:@"Select All" atIndex:0];
        
        [tblView_list setAllowsMultipleSelection:YES];
        
    } else {
        
        [tblView_list setAllowsMultipleSelection:NO];
        
        self.navigationController.navigationItem.rightBarButtonItem = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    
    if (isMultipleSelected)
    {
        
        for (NSString *data in selectedData) {
            
            [tblView_list selectRowAtIndexPath:[NSIndexPath indexPathForRow:[array_data indexOfObject:data] inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
            
        }
    }
}

- (IBAction)tappedCancel:(id)sender {
    
    if ([delegate respondsToSelector:@selector(didCancel)]) {
        
        [delegate didCancel];
    }
    
}

- (IBAction)tappedSave:(id)sender {
    
    if([selectedData containsObject:@"Select All"]){
        
        [selectedData removeObject:@"Select All"];
        
    }
    
    if([selectedData containsObject:@""]){
        
        [selectedData removeObject:@""];
        
    }
    
    if ([delegate respondsToSelector:@selector(didSaveItems:indexs:)]) {
        
        [delegate didSaveItems:selectedData indexs:[tblView_list indexPathsForSelectedRows]];
    }
    
}

- (IBAction)tappedSelectAll:(id)sender {
    
    selectedData = [array_data mutableCopy];
    
    for (NSString *data in selectedData) {
        
        [tblView_list selectRowAtIndexPath:[NSIndexPath indexPathForRow:[array_data indexOfObject:data] inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
        
    }
}

#pragma mark uitableview delegates and datasources

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return array_data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListingCell"];

       cell.textLabel.text = [array_data objectAtIndex:indexPath.row ];
    
    //cell.textLabel.text = [array_data objectAtIndex:indexPath.row ];
    
    if ([selectedData containsObject:array_data[indexPath.row]]) {
        
        if (isMultipleSelected) {
            
            [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
      
        } else {
           
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        //cell.selected = YES;
        
    } else{
        
        cell.accessoryType = UITableViewCellAccessoryNone;
      
        //cell.selected = NO;
    }
    
    NSString *str = cell.textLabel.text;
    
    NSLog(@"%lu",(unsigned long)selectedData.count);
    
    for (int i = 0; i < selectedData.count; i++) {
                
        if ([str isEqualToString:[selectedData objectAtIndex:i]]) {
            
            [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionNone];
            
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(selectedData.count == array_data.count){
        
        [selectedData removeAllObjects];
        
    }
    
    if(selectedData.count <= array_data.count){
    
        [selectedData addObject:array_data[indexPath.row]];
        
    }
    
   // NSLog(@"%@",selectedData[1]);
    
    if (!isMultipleSelected && [delegate respondsToSelector:@selector(didSelectListItem:index:)]) {
        
        [delegate didSelectListItem:array_data[indexPath.row] index:indexPath.row];
        
    } else {
        
        if (indexPath.row == 0) {
            
            selectedData = [array_data mutableCopy];
            
            for (NSString *data in selectedData) {
                
                [tblView_list selectRowAtIndexPath:[NSIndexPath indexPathForRow:[array_data indexOfObject:data] inSection:0] animated:NO scrollPosition:UITableViewScrollPositionNone];
            }
        }        
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [selectedData removeObject:array_data[indexPath.row]];
    
    if([selectedData containsObject:@"Select All"]){
    
      [selectedData removeObject:array_data[0]];
        
        [tblView_list deselectRowAtIndexPath:[NSIndexPath indexPathForRow:[array_data indexOfObject:@"Select All"] inSection:0] animated:NO];
        
    }
    
    if (indexPath.row == 0) {
        
        selectedData = [array_data mutableCopy];
        
        for (NSString *data in selectedData) {
            
            [tblView_list deselectRowAtIndexPath:[NSIndexPath indexPathForRow:[array_data indexOfObject:data] inSection:0] animated:NO];
            
        }
        
        [selectedData removeAllObjects];
    }
}

@end
