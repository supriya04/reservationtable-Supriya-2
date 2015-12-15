
//
//  SettingViewController.m
//  reservationtable
//
//  Created by promatics on 12/8/15.
//  Copyright (c) 2015 promatics. All rights reserved.


#import "SettingViewController.h"
#import "SettingTableViewCell.h"

@interface SettingViewController () {
  
    SettingTableViewCell *settingCell;
    
}

@end

@implementation SettingViewController

@synthesize setting_tableView;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    setting_tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // Do any additional setup after loading the view.
}

#pragma mark- UITableView delegate & datasources

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    settingCell = [tableView dequeueReusableCellWithIdentifier:@"settingCell" forIndexPath:indexPath];
    
    settingCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (indexPath.row == 0) {
        
        settingCell.setting_lbl.text = @"My Profile";
        
    } else if (indexPath.row == 1){
        
        settingCell.setting_lbl.text = @"Logout";
        
    }
    
    
    return settingCell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        
        [self performSegueWithIdentifier:@"profileSegue" sender:self];
        
    }  else if (indexPath.row == 1) {
        
        [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"loginStatus"];
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userInfoDic"];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
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
