//
//  SignUPViewController.m
//  reservationtable
//
//  Created by Apple on 08/12/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "SignUPViewController.h"
#import "WebServiceConnection.h"
#import "Indicator.h"
#import "Validation.h"

@interface SignUPViewController () {
    
    WebServiceConnection *selectStateCon,*selectCityCon,*signUpCon;
    
    Indicator *indicator;
    
    Validation *validation;
    
    NSMutableArray *state , *city;
    
    BOOL isState;
    
    int stateId,cityId;
    
}

@end

@implementation SignUPViewController

@synthesize firstNamTxtF,lastNam_txtF,pswrd_txtF,con_Pswrd_txtF,emailTxtF,select_city_btn,selectState_btn;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    selectStateCon = [WebServiceConnection connectionManager];
    
    selectCityCon = [WebServiceConnection connectionManager];
    
    signUpCon = [WebServiceConnection connectionManager];
    
    validation = [Validation validationManager];
    
    indicator = [[Indicator alloc]initWithFrame:self.view.frame];
    
    state = [[NSMutableArray alloc]init];
    
    city = [[NSMutableArray alloc]init];
    
    stateId = 0;
    
    cityId = 0;
    
    isState = NO;
    
    
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

- (IBAction)create_btn_action:(id)sender {
    
    NSString *msg;
    
    if([firstNamTxtF.text length] < 1){
        
        msg = @"Please enter first Name";
        
    }else if([lastNam_txtF.text length] < 1){
        
        msg = @"Please enter last Name";
        
    }else if([emailTxtF.text length] < 1 || ![validation validateEmail:emailTxtF.text]){
        
        msg = @"Please enter valid email id";
        
    }else if ([pswrd_txtF.text length] < 1){
        
        msg = @"Please enter password";
        
    }else if([con_Pswrd_txtF.text length] < 1){
        
        msg = @"Please enter confirm password";
        
    } else if (![pswrd_txtF.text isEqualToString:con_Pswrd_txtF.text]){
        
        msg = @"Confirm Password must match Password";
        
    }else if(stateId == 0) {
        
        msg = @"Please select a state";
        
    }else if(cityId == 0){
        
        msg = @"Please select a city";
    }
    
    if([msg length] > 1){
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }else {
        
        NSDictionary *passContent = @{@"first_name":firstNamTxtF.text ,@"last_name":lastNam_txtF.text,@"email":emailTxtF.text,@"password":pswrd_txtF.text,@"state":[NSString stringWithFormat:@"%d",stateId],@"city":[NSString stringWithFormat:@"%d",cityId]};
        
        [self.view addSubview:indicator];
        
        [signUpCon startConnectionWithString:@"register" HttpMethodType:Post_Type HttpBodyType:passContent Output:^(NSDictionary *receivedData) {
            
            [indicator removeFromSuperview];
            
            if([signUpCon responseCode] == 1){
                
                NSLog(@"%@",receivedData);
                
                if ([[receivedData valueForKey:@"code"]integerValue] ==1) {
                    
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:[receivedData valueForKey:@"message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    
                    [self.navigationController popViewControllerAnimated:YES];
                    
                    [alert show];

                    
                } else {
                
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:[receivedData valueForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                    [alert show];
                    
                }
                
            }
            
            
        }];
        
    }
    
}

- (IBAction)selectState_btn_action:(id)sender {
    
    NSDictionary *passContent = @{};
    
    isState = YES;
    
    [self.view addSubview: indicator];
    
    [selectStateCon startConnectionWithString:@"state_list" HttpMethodType:Post_Type HttpBodyType:passContent Output:^(NSDictionary *receivedData) {
        
        [indicator removeFromSuperview];
        
        if([selectStateCon responseCode] == 1){
            
            [self showListData:[[[receivedData valueForKey:@"state"]valueForKey:@"State"] valueForKey:@"state_name"] allowMultipleSelection:NO selectedData:@[@""] title:@""];
            
            
            state = [receivedData valueForKey:@"state"];
            
        }
        
    }];
    
}
- (IBAction)update_switch_action:(id)sender {
    
}

- (IBAction)select_city_btn_action:(id)sender {
    
    isState = NO;
    
    if(stateId == 0){
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Please select state first" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alert show];
        
    }else {
        
        NSDictionary *passContent = @{@"state_id":[NSString stringWithFormat:@"%d",stateId]};
        
        [self.view addSubview: indicator];
        
        [selectCityCon startConnectionWithString:@"city_list" HttpMethodType:Post_Type HttpBodyType:passContent Output:^(NSDictionary *receivedData) {
            
            [indicator removeFromSuperview];
            
            if([selectCityCon responseCode] == 1){
                
                [self showListData:[[[receivedData valueForKey:@"city"]valueForKey:@"City"] valueForKey:@"city_name"] allowMultipleSelection:NO selectedData:@[@""] title:@""];
                
                city = [receivedData valueForKey:@"city"];
                
            }
            
        }];
        
    }
    
}

#pragma mark -listView Delegate
-(void)showListData:(NSArray *)items allowMultipleSelection:(BOOL)allowMultipleSelection selectedData:(NSArray*)selectedData title:(NSString *)title {
    
    ListingViewController *listViewController = [[ListingViewController alloc] init];
    
    UIStoryboard *story_board;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
        
        story_board = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
        
    }else {
        
        story_board = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    }
    
    listViewController = [story_board instantiateViewControllerWithIdentifier:@"listingVC"];
    
    listViewController.isMultipleSelected = allowMultipleSelection;
    
    listViewController.array_data = [items mutableCopy];
    
    listViewController.selectedData = [selectedData mutableCopy];
    
    listViewController.delegate = self;
    
    listViewController.title = title;
    
    // UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:listViewController];
    
    [self.navigationController pushViewController:listViewController animated:YES];
    
}

-(void)didSelectListItem:(id)item index:(NSInteger)index {
    
    [self.navigationController popViewControllerAnimated:YES];
    
    if(isState) {
        
        stateId = [[[[state objectAtIndex:index]valueForKey:@"State"]valueForKey:@"id"]intValue];
        
        [selectState_btn setTitle:item forState:UIControlStateNormal];
        
        isState = NO;
        
    } else {
        
        [select_city_btn setTitle:item forState:UIControlStateNormal];
        
        cityId = [[[[city objectAtIndex:index]valueForKey:@"City"]valueForKey:@"id"]intValue];
    }
    
}

@end
