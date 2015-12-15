//
//  SignUPViewController.h
//  reservationtable
//
//  Created by Apple on 08/12/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListingViewController.h"

@interface SignUPViewController : UIViewController<listingDelegate>

- (IBAction)create_btn_action:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *firstNamTxtF;

@property (weak, nonatomic) IBOutlet UITextField *lastNam_txtF;

@property (weak, nonatomic) IBOutlet UITextField *emailTxtF;

@property (weak, nonatomic) IBOutlet UITextField *pswrd_txtF;

@property (weak, nonatomic) IBOutlet UITextField *con_Pswrd_txtF;

- (IBAction)selectState_btn_action:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *selectState_btn;

@property (weak, nonatomic) IBOutlet UIButton *select_city_btn;

- (IBAction)select_city_btn_action:(id)sender;

@property (weak, nonatomic) IBOutlet UISwitch *updated_switch;

- (IBAction)update_switch_action:(id)sender;

@end
