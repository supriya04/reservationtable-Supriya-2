//
//  SettingViewController.h
//  reservationtable
//
//  Created by promatics on 12/8/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *setting_tableView;

@end
