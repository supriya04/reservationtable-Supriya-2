//
//  RestaurantsFilterViewController.m
//  reservationtable
//
//  Created by promatics on 12/11/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "RestaurantsFilterViewController.h"

@interface RestaurantsFilterViewController ()

@end

@implementation RestaurantsFilterViewController
@synthesize cancel_btn;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = cancel_btn;
    
    
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

- (IBAction)tapCancel_btn:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
