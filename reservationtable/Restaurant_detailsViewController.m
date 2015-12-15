//
//  Restaurant_detailsViewController.m
//  reservationtable
//
//  Created by Apple on 19/11/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "Restaurant_detailsViewController.h"

@interface Restaurant_detailsViewController ()


@end

@implementation Restaurant_detailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(10.0f, 0.0f, 45.0f, 30.0f)];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn1 setFrame:CGRectMake(0.0f, 0.0f, 20.0f, 20.0f)];
    [btn1 setBackgroundImage:[UIImage imageNamed:@"like"] forState:UIControlStateNormal];
    [btn1 addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setFrame:CGRectMake(35.0f, 0.0f, 20.0f, 20.0f)];
    [btn2 setBackgroundImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    [btn2 addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
    [customView addSubview:btn2];
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithCustomView:customView];
    
    [self.navigationItem setRightBarButtonItem:rightBtn];
    
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
