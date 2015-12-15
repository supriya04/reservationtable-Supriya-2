//
//  SignINViewController.h
//  reservationtable
//
//  Created by Apple on 07/12/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignINViewController : UIViewController<UITextFieldDelegate>

- (IBAction)fb_btn_action:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *email_txtF;

@property (weak, nonatomic) IBOutlet UITextField *pass_txtF;

@property (weak, nonatomic) IBOutlet UIButton *check_btn;

- (IBAction)check_btn_action:(id)sender;

- (IBAction)forgot_pass_btn_action:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scroll_view;


- (IBAction)sign_btn_action:(id)sender;

- (IBAction)cancel_btn_action:(id)sender;

@end
