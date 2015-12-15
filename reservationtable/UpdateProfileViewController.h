//
//  UpdateProfileViewController.h
//  reservationtable
//
//  Created by promatics on 12/8/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListingViewController.h"
@interface UpdateProfileViewController : UIViewController<listingDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scroll_view;
@property (strong, nonatomic) IBOutlet UIView *background_view;
@property (strong, nonatomic) IBOutlet UIButton *update_btn;
- (IBAction)tapUpdate_btn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *title_btn;
- (IBAction)tapTitle_btn:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *firstName_textfield;

@property (strong, nonatomic) IBOutlet UITextField *lastName_textField;
@property (strong, nonatomic) IBOutlet UITextField *address1_textfield;
@property (strong, nonatomic) IBOutlet UITextField *address2_textfield;
@property (strong, nonatomic) IBOutlet UIButton *state_btn;
- (IBAction)tapState_btn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *city_btn;
- (IBAction)tapCity_btn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *mobile_textfield;
@property (strong, nonatomic) IBOutlet UIButton *check_btn;
- (IBAction)tapCheck_btn:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *emailAddress_lbl;
@property (strong, nonatomic) IBOutlet UITextField *password_textfield;
@property (strong, nonatomic) IBOutlet UITextField *confirmPassword_textfield;

@end
