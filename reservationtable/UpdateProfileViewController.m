//
//  UpdateProfileViewController.m
//  reservationtable
//
//  Created by promatics on 12/8/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "UpdateProfileViewController.h"
#import "WebServiceConnection.h"
#import "Indicator.h"
#import "Validation.h"
@interface UpdateProfileViewController (){
    
    WebServiceConnection *updateConn,*stateConn,*cityConn;
    Indicator *indicator;
    Validation *validation;
    NSString *stateId,*cityId,*titleValue;
    NSDictionary *profileDic;
    NSArray *stateArray,*cityArray,*titleArray;
    BOOL  tapCheck;
}

@end

@implementation UpdateProfileViewController
@synthesize scroll_view,background_view,update_btn,firstName_textfield,lastName_textField,address1_textfield,address2_textfield,emailAddress_lbl,mobile_textfield,city_btn,state_btn,password_textfield,check_btn,title_btn,confirmPassword_textfield;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    updateConn = [WebServiceConnection connectionManager];
     stateConn = [WebServiceConnection connectionManager];
     cityConn = [WebServiceConnection connectionManager];
    
    [check_btn setBackgroundImage:[UIImage imageNamed:@"gray check"] forState:UIControlStateNormal];
    //fill_checkBox
    tapCheck = NO;
    
    indicator = [[Indicator alloc] initWithFrame:self.view.frame];
    
    validation = [Validation validationManager];
    [self updateProfileData];

    
    [self setInterface];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    
  }
-(void)setInterface{
    
    UIStoryboard *storyboard;
    
    if (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad) {
        
        storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
        
        scroll_view.contentSize = CGSizeMake(self.view.frame.size.width, update_btn.frame.origin.y+60);
        
        
        
    } else {
        
        storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        
        scroll_view.contentSize = CGSizeMake(self.view.frame.size.width, update_btn.frame.origin.y+60);
    }
    
    update_btn.layer.cornerRadius = 5.0f;
}

-(void)updateProfileData {
    
    profileDic = [[NSUserDefaults standardUserDefaults] valueForKey:@"userInfoDic"];
    
    NSString *titleStr ;
    
     titleValue = [[profileDic valueForKey:@"User"] valueForKey:@"title"];
    
    if ([titleValue isEqualToString:@"1"]) {
        
        titleStr = @"Mr.";
        
    } else if ([titleValue isEqualToString:@"2"]){
        
        titleStr = @"Mrs.";
        
    } else if ([titleValue isEqualToString:@"3"]){
        
        titleStr = @"Ms.";
        
    }else{
        
        titleStr = @"Select";
    }
    
    [title_btn setTitle:titleStr forState:UIControlStateNormal];
    
    firstName_textfield.text = [[profileDic valueForKey:@"User"] valueForKey:@"first_name"];
    
    lastName_textField.text = [[profileDic valueForKey:@"User"] valueForKey:@"last_name"];
   
    address1_textfield.text = [[profileDic valueForKey:@"User"] valueForKey:@"address1"];
    
    address2_textfield.text = [[profileDic valueForKey:@"User"] valueForKey:@"address2"];
    
    NSString *stateStr = [[profileDic valueForKey:@"State"] valueForKey:@"state_name"];
    
    [state_btn setTitle:stateStr forState:UIControlStateNormal];
    
    stateId = [[profileDic valueForKey:@"State"] valueForKey:@"id"];
    
    NSString *cityStr = [[profileDic valueForKey:@"City"] valueForKey:@"city_name"];
    
    [city_btn setTitle:cityStr forState:UIControlStateNormal];
    
    cityId = [[profileDic valueForKey:@"City"] valueForKey:@"id"];
    
    mobile_textfield.text = [[profileDic valueForKey:@"User"] valueForKey:@"mobile_number"];
    
    emailAddress_lbl.text = [[profileDic valueForKey:@"User"] valueForKey:@"email"];
    
   
    
    
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

- (IBAction)tapUpdate_btn:(id)sender {
    
    NSString *message;
    
    if ([firstName_textfield.text isEqualToString:@""]) {
        
        message = @"Please enter first name.";
    } else if ([lastName_textField.text isEqualToString:@""]){
        
        message = @"Please enter last name.";
    } else if ([address1_textfield.text isEqualToString:@""]){
        
        message = @"Please enter address line1";
    }else if ([address2_textfield.text isEqualToString:@""]){
        
        message = @"Please enter address line2";
    }else if ([state_btn.titleLabel.text isEqualToString:@"Select"]||[state_btn.titleLabel.text isEqualToString:@""]){
        
        message = @"Please select state.";
    }else if ([city_btn.titleLabel.text isEqualToString:@"Select"]||[state_btn.titleLabel.text isEqualToString:@""]){
        
        message = @"Please select city.";
    } else if ([mobile_textfield.text isEqualToString:@""]){
        
         message = @"Please enter mobile number";
        
    }else if (![validation validatePhoneNumber:mobile_textfield.text]) {
            
            message = @"Please enter 10 digits mobile number";

    }else if (![password_textfield.text isEqualToString:confirmPassword_textfield.text]){
        
        message = @"Confirm Password must match Password";
    }
    if ([message length]>1) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reservation" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        
        [alert show];
        
    } else {
        
        NSDictionary *paramurl;
        
        if ([password_textfield.text isEqualToString:@""]&&[confirmPassword_textfield.text isEqualToString:@""]) {
            
             paramurl = @{@"id":[[profileDic valueForKey:@"User"] valueForKey:@"id"], @"first_name":firstName_textfield.text, @"last_name":lastName_textField.text, @"state":stateId, @"title":titleValue, @"address1":address1_textfield.text, @"address2":address2_textfield.text, @"city":cityId, @"mobile_number":mobile_textfield.text};
            
        } else {
            
        paramurl = @{@"id":[[profileDic valueForKey:@"User"] valueForKey:@"id"], @"first_name":firstName_textfield.text, @"last_name":lastName_textField.text, @"password":password_textfield.text, @"state":stateId, @"title":titleValue, @"address1":address1_textfield.text, @"address2":address2_textfield.text, @"city":cityId, @"mobile_number":mobile_textfield.text};
            
        }
            [self.view addSubview:indicator];
    
    [updateConn startConnectionWithString:@"update_profile" HttpMethodType:Post_Type HttpBodyType:paramurl Output:^(NSDictionary *receivedData){
        
        [indicator removeFromSuperview];
        
            if ([updateConn responseCode]==1) {
            
                NSLog(@"%@",receivedData);
            
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reservation" message:@"Your profile has been updated successfully." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                
                [[NSUserDefaults standardUserDefaults] setObject:[receivedData valueForKey:@"info"] forKey:@"userInfoDic"];
            
                [alert show];
            }
        }];
    }
}
- (IBAction)tapState_btn:(id)sender {
    
    state_btn.tag = 1;
    
    if([stateArray count] > 0){
        
        [self showListData:[stateArray valueForKey:@"state_name"] allowMultipleSelection:NO selectedData:[@"" componentsSeparatedByString:@", "] title:@"State"];
        
    } else {
        
        
        NSDictionary *paramUrl = @{};
        
        [self.view addSubview:indicator];
        [stateConn startConnectionWithString:@"state_list" HttpMethodType:Post_Type HttpBodyType:paramUrl Output:^(NSDictionary *receivedData) {
            
            [indicator removeFromSuperview];
            
            if ([stateConn responseCode] == 1) {
                
                NSLog(@"recivedData %@",receivedData);
                
                stateArray = [[receivedData valueForKey:@"state"] valueForKey:@"State"];
                
                NSLog(@"%@",stateArray);
                
                [self showListData:[stateArray valueForKey:@"state_name"] allowMultipleSelection:NO selectedData:[@"" componentsSeparatedByString:@", "] title:@"State"];
                
            }
        }];
        
    }
}
-(void)showListData:(NSArray *)items allowMultipleSelection:(BOOL)allowMultipleSelection selectedData:(NSArray*)selectedData title:(NSString *)title {
    
    ListingViewController *listViewController = [[ListingViewController alloc] init];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        listViewController = [[UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil] instantiateViewControllerWithIdentifier:@"listingVC"];
        
    } else {
        
        listViewController = [[UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil] instantiateViewControllerWithIdentifier:@"listingVC"];
    }
    
    listViewController.isMultipleSelected = allowMultipleSelection;
    
    listViewController.array_data = [items mutableCopy];
    
    listViewController.selectedData = [selectedData mutableCopy];
    
    listViewController.delegate = self;
    
    listViewController.title = title;
    
    // UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:listViewController];
    
    [self.navigationController pushViewController:listViewController animated:YES];
    
    //  [self presentViewController:nav animated:YES completion:nil];
}

# pragma listing delegates


-(void)didSelectListItem:(id)item index:(NSInteger)index {
    
    if(state_btn.tag == 1) {
        
        [state_btn setTitle:item forState:UIControlStateNormal];
        
        stateId = [[stateArray objectAtIndex:index]valueForKey:@"id"];
        
        [state_btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        NSLog(@"location id=%@",stateId);
        
        state_btn.tag =0;
        
    }else if(city_btn.tag == 1) {
        
        [city_btn setTitle:item forState:UIControlStateNormal];
        
        cityId= [[cityArray objectAtIndex:index]valueForKey:@"id"];
        
        [city_btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        city_btn.tag = 0;
        
    }else if(title_btn.tag == 1) {
        
        [title_btn setTitle:item forState:UIControlStateNormal];
        
        titleValue= [[titleArray objectAtIndex:index]valueForKey:@"value"];
        
        NSLog(@"%@",titleValue);
        
        [title_btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        
        title_btn.tag = 0;
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)tapCity_btn:(id)sender {
    
    city_btn.tag = 1;
    
    if([cityArray count] > 0){
        
        [self showListData:[cityArray valueForKey:@"city_name"] allowMultipleSelection:NO selectedData:[@"" componentsSeparatedByString:@", "] title:@"City"];
        
    } else {
        
        
        NSDictionary *paramUrl = @{};
        
        [self.view addSubview:indicator];
        [cityConn startConnectionWithString:@"city_list" HttpMethodType:Post_Type HttpBodyType:paramUrl Output:^(NSDictionary *receivedData) {
            
            [indicator removeFromSuperview];
            
            if ([cityConn responseCode] == 1) {
                
                NSLog(@"recivedData %@",receivedData);
                
                cityArray = [[receivedData valueForKey:@"city"] valueForKey:@"City"];
                
                NSLog(@"%@",cityArray);
                
                [self showListData:[cityArray valueForKey:@"city_name"] allowMultipleSelection:NO selectedData:[@"" componentsSeparatedByString:@", "] title:@"City"];
                
            }
        }];
        
    }
}
- (IBAction)tapCheck_btn:(id)sender {
    
    
    [check_btn setBackgroundImage:[UIImage imageNamed:@"fill_checkBox"] forState:UIControlStateNormal];
    
    tapCheck = YES;
}
- (IBAction)tapTitle_btn:(id)sender {
    
    title_btn.tag =1;
    
    titleArray = @[
                      @{@"experience":@"Mr.",@"value":@"1"},
                      @{@"experience":@"Mrs.",@"value":@"2"},
                      @{@"experience":@"Ms.",@"value":@"3"}
                     
                      ];
    
    
    [self showListData:[titleArray valueForKey:@"experience"] allowMultipleSelection:NO selectedData:[@"" componentsSeparatedByString:@", "] title:@"Title"];
    
}
@end
