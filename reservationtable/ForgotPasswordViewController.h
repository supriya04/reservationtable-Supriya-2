//
//  ForgotPasswordViewController.h
//  reservationtable
//
//  Created by Apple on 07/12/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordViewController : UIViewController<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *getEmail_txtF;

- (IBAction)submit_btn_action:(id)sender;

@end
