//
//  PrivateDiningViewController.m
//  reservationtable
//
//  Created by promatics on 11/30/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "PrivateDiningViewController.h"

@interface PrivateDiningViewController ()

@end

@implementation PrivateDiningViewController
@synthesize name,email,forGuest,detail,submit,date,time,eventType,phone;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    name.layer.borderColor = [UIColor darkGrayColor].CGColor;
    name.layer.borderWidth = 0.3f;
    name.layer.cornerRadius = 5.0f;
    
    email.layer.borderColor = [UIColor darkGrayColor].CGColor;
    email.layer.borderWidth = 0.3f;
    email.layer.cornerRadius = 5.0f;
    
    forGuest.layer.borderColor = [UIColor darkGrayColor].CGColor;
    forGuest.layer.borderWidth = 0.3f;
    forGuest.layer.cornerRadius = 5.0f;
    
    detail.layer.borderColor = [UIColor darkGrayColor].CGColor;
    detail.layer.borderWidth = 0.3f;
    detail.layer.cornerRadius = 5.0f;
    
    date.layer.borderColor = [UIColor darkGrayColor].CGColor;
    date.layer.borderWidth = 0.3f;
    date.layer.cornerRadius = 5.0f;
    
    time.layer.borderColor = [UIColor darkGrayColor].CGColor;
    time.layer.borderWidth = 0.3f;
    time.layer.cornerRadius = 5.0f;
    
    eventType.layer.borderColor = [UIColor darkGrayColor].CGColor;
    eventType.layer.borderWidth = 0.3f;
    eventType.layer.cornerRadius = 5.0f;
    
    phone.layer.borderColor = [UIColor darkGrayColor].CGColor;
    phone.layer.borderWidth = 0.3f;
    phone.layer.cornerRadius = 5.0f;
    
    submit.layer.cornerRadius = 5.0f;
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

@end
