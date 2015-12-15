//
//  ViewController.m
//  reservationtable
//
//  Created by promatics on 11/3/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
      UIBarButtonItem *list,*filter;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    list = [[UIBarButtonItem alloc]initWithTitle:@"list" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    filter = [[UIBarButtonItem alloc]initWithTitle:@"filter" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.rightBarButtonItems = @[filter,list];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
