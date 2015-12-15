//
//  ChangePaswordViewController.h
//  reservationtable
//
//  Created by promatics on 12/9/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChangePaswordViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scroll_view;
@property (strong, nonatomic) IBOutlet UILabel *email_lbl;
@property (strong, nonatomic) IBOutlet UITextField *password_textfield;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasword_textfield;
@property (strong, nonatomic) IBOutlet UIButton *Save_btn;
@property (strong, nonatomic) IBOutlet UIView *background_view;
- (IBAction)tapSave_btn:(id)sender;

@end
