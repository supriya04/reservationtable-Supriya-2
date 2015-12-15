//
//  HotelMapVWViewController.m
//  reservationtable
//
//  Created by Apple on 19/11/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "HotelMapVWViewController.h"

@interface HotelMapVWViewController ()
{
    UIBarButtonItem *list,*filter;
    
}
@end

@implementation HotelMapVWViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    list = [[UIBarButtonItem alloc]initWithTitle:@"List" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    filter = [[UIBarButtonItem alloc]initWithTitle:@"Filter" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.rightBarButtonItems = @[filter,list];
    
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
