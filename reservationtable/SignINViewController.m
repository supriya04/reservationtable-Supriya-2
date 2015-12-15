//
//  SignINViewController.m
//  reservationtable
//
//  Created by Apple on 07/12/15.
//  Copyright (c) 2015 promatics. All rights reserved.

#import "SignINViewController.h"
#import "WebServiceConnection.h"
#import "Indicator.h"
#import "Validation.h"
#import "Constant.h"
#import "ActionViewController.h"

@interface SignINViewController ()
{
    Validation *validate;
    
    WebServiceConnection *loginCon;
    
    Indicator *indicator;
    
    BOOL isCheck;
}
@end

@implementation SignINViewController
@synthesize email_txtF,pass_txtF,scroll_view,check_btn;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    validate = [[Validation alloc]init];
    
    loginCon = [WebServiceConnection connectionManager];
    
    indicator = [[Indicator alloc]initWithFrame:self.view.frame];
    
    isCheck = NO;
    
   
}
-(void)viewWillAppear:(BOOL)animated{
    
    if([[[NSUserDefaults standardUserDefaults]valueForKey:@"loginStatus"]integerValue]){
        
        [self performSegueWithIdentifier:@"login_segue" sender:self];
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
}


- (IBAction)fb_btn_action:(id)sender {
    
}
- (IBAction)check_btn_action:(id)sender {
    
    if(!isCheck){
        
        [pass_txtF setSecureTextEntry:NO];
        
        isCheck = YES;
        
        [check_btn setBackgroundImage:[UIImage imageNamed:@"fill_checkBox"] forState:UIControlStateNormal];
        
    }else {
        
        [pass_txtF setSecureTextEntry:YES];
        
        isCheck = NO;
        
        [check_btn setBackgroundImage:[UIImage imageNamed:@"gray check"] forState:UIControlStateNormal];
    }
    
}

- (IBAction)forgot_pass_btn_action:(id)sender {
}

- (IBAction)sign_btn_action:(id)sender {
    
    [self call_SignService];
    
}

- (IBAction)cancel_btn_action:(id)sender {
}

#pragma mark- textField Delgate

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if(textField == email_txtF) {
        
        [pass_txtF becomeFirstResponder];
        
    }else if (textField == pass_txtF) {
        
        [textField resignFirstResponder];
        
        [self call_SignService];
        
    }
    
    
    
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    //    if(signVW.frame.origin.y > self.view.frame.size.height - 280){
    //        [UIView beginAnimations:@"slide" context:nil];
    //
    //        CGRect frame = self.view.frame;
    //
    //        frame.origin.y = self.view.frame.origin.y - 280 - textField.frame.size.height ;
    //
    //     [UIView animateWithDuration:1.0 animations:^{
    //
    //         self.view.frame = frame;
    //
    //     }];
    //
    //    }
    
}

#pragma mark - SignIN

-(void)call_SignService {
    
    NSString *msg;
    
    if(![validate validateEmail:email_txtF.text] || ![validate validateBlankField:email_txtF.text]) {
        
        msg = @"Please enter valid email";
        
    }else if (![validate validatePassword:pass_txtF.text] || ![validate validateBlankField:pass_txtF.text]){
        
        msg = @"Please enter valid password";
        
    }
    
    if([msg length] > 1){
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }else {
        
        NSDictionary *passContent;
        
        passContent = @{@"email":email_txtF.text,@"password":pass_txtF.text};
        
        [self.view addSubview:indicator];
        
        [loginCon startConnectionWithString:@"login" HttpMethodType:Post_Type HttpBodyType:passContent Output:^(NSDictionary *receivedData) {
            
            [indicator removeFromSuperview];
            
            NSLog(@"%@",receivedData);
            
            if([loginCon responseCode] == 1){
                
                if([[receivedData valueForKey:@"code"]integerValue]){
                    
                    [[NSUserDefaults standardUserDefaults]setValue:@"1" forKey:@"loginStatus"];
                    
                    [[NSUserDefaults standardUserDefaults]setObject:[receivedData valueForKey:@"info"] forKey:@"userInfoDic"];
                    
                    
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Login successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    email_txtF.text = @"";
                    
                    pass_txtF.text = @"";
                    
                    [self performSegueWithIdentifier:@"login_segue" sender:self];
                    
                }else {
                    
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Invalid Credentials" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [alert show];
                    
                    [[NSUserDefaults standardUserDefaults]setValue:@"0" forKey:@"loginStatus"];
                    
                }
                
            }
            
        }];
        
    }
}

@end
