//
//  ForgotPasswordViewController.m
//  reservationtable
//
//  Created by Apple on 07/12/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import "WebServiceConnection.h"
#import "Indicator.h"
#import "Validation.h"

@interface ForgotPasswordViewController ()
{
    
    WebServiceConnection *forgotCon;
    
    Validation *validation;
    
    Indicator *indicator;
    
}
@end

@implementation ForgotPasswordViewController
@synthesize getEmail_txtF;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    forgotCon = [WebServiceConnection connectionManager];
    
    indicator = [[Indicator alloc]initWithFrame:self.view.frame];
    
    validation = [Validation validationManager];
    
    getEmail_txtF.layer.borderColor = [UIColor darkGrayColor].CGColor;
    getEmail_txtF.layer.borderWidth = 0.8f;
    getEmail_txtF.layer.cornerRadius = 5.0f;
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

- (IBAction)submit_btn_action:(id)sender {
    
    NSString *msg;
    
    if([getEmail_txtF.text length] < 1 || ![validation validateEmail:getEmail_txtF.text]){
        
        msg = @"Please enter valid email id";
        
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }else {
        
        NSDictionary *passContent;
        
        passContent = @{@"email":getEmail_txtF.text};
        
        [self.view addSubview:indicator];
        
        [forgotCon startConnectionWithString:@"forgot_password" HttpMethodType:Post_Type HttpBodyType:passContent Output:^(NSDictionary *receivedData) {
            
            [indicator removeFromSuperview];
            
            if([forgotCon responseCode] == 1){
                
                if([[receivedData valueForKey:@"code"]integerValue]){
                    
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"A link to reset your password has been sent to email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [self.navigationController popViewControllerAnimated:YES];
                    [alert show];
                    
                    getEmail_txtF.text = @"";
                 
                    
                }else {
                    
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Email Not registered" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                }
                
            }
            
            
        }];
    }
    
}

#pragma mark- textField
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
    
}

@end
