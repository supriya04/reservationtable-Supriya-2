//
//  AddGiftViewController.h
//  reservationtable
//
//  Created by promatics on 11/30/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddGiftViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scroll_view;
@property (strong, nonatomic) IBOutlet UITextField *t0_textfield;

@property (strong, nonatomic) IBOutlet UITextField *from_txtfield;
@property (strong, nonatomic) IBOutlet UITextField *email_txtfield;

@property (strong, nonatomic) IBOutlet UITextView *personal_textview;
@property (strong, nonatomic) IBOutlet UITextField *emailTo_textfield;
@property (strong, nonatomic) IBOutlet UIButton *date_btn;
@property (strong, nonatomic) IBOutlet UIButton *time_btn;
@property (strong, nonatomic) IBOutlet UIButton *timeZone_btn;
@property (strong, nonatomic) IBOutlet UILabel *gotIt_lbl;

@end
