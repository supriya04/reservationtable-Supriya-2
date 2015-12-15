//
//  AddGiftViewController.m
//  reservationtable
//
//  Created by promatics on 11/30/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "AddGiftViewController.h"

@interface AddGiftViewController ()

@end

@implementation AddGiftViewController
@synthesize scroll_view,t0_textfield,email_txtfield,emailTo_textfield,time_btn,timeZone_btn,personal_textview,date_btn,gotIt_lbl,from_txtfield;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    scroll_view.contentSize = CGSizeMake(320, 1200);
    gotIt_lbl.hidden = YES;
    
    t0_textfield.layer.borderWidth = 0.3f;
    t0_textfield.layer.borderColor = [UIColor darkGrayColor].CGColor;
    t0_textfield.layer.cornerRadius = 5.0f;
    
    emailTo_textfield.layer.borderWidth = 0.3f;
    emailTo_textfield.layer.borderColor = [UIColor darkGrayColor].CGColor;
    emailTo_textfield.layer.cornerRadius = 5.0f;
    
    from_txtfield.layer.borderWidth = 0.3f;
    from_txtfield.layer.borderColor = [UIColor darkGrayColor].CGColor;
    from_txtfield.layer.cornerRadius = 5.0f;
    
    email_txtfield.layer.borderWidth = 0.3f;
    email_txtfield.layer.borderColor = [UIColor darkGrayColor].CGColor;
    email_txtfield.layer.cornerRadius = 5.0f;
    
    personal_textview.layer.borderWidth = 0.3f;
    personal_textview.layer.borderColor = [UIColor darkGrayColor].CGColor;
    personal_textview.layer.cornerRadius = 5.0f;
    
    date_btn.layer.borderWidth = 0.3f;
    date_btn.layer.borderColor = [UIColor darkGrayColor].CGColor;
    date_btn.layer.cornerRadius = 5.0f;
    
    time_btn.layer.borderWidth = 0.3f;
    time_btn.layer.borderColor = [UIColor darkGrayColor].CGColor;
    time_btn.layer.cornerRadius = 5.0f;
    
    timeZone_btn.layer.borderWidth = 0.3f;
    timeZone_btn.layer.borderColor = [UIColor darkGrayColor].CGColor;
    timeZone_btn.layer.cornerRadius = 5.0f;
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
