//
//  ChangePaswordViewController.m
//  reservationtable
//
//  Created by promatics on 12/9/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "ChangePaswordViewController.h"
#import "WebServiceConnection.h"
#import "Indicator.h"


@interface ChangePaswordViewController (){
    
    NSDictionary *profileDic;
}

@end

@implementation ChangePaswordViewController

@synthesize email_lbl,password_textfield,confirmPasword_textfield,scroll_view,background_view,Save_btn;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setInterface];
    [self changePasswordData];

}

-(void)changePasswordData {
    
    profileDic = [[NSUserDefaults standardUserDefaults] valueForKey:@"userInfoDic"];
    
    email_lbl.text = [[profileDic valueForKey:@"User"] valueForKey:@"email"];
}
-(void)setInterface {
    
    UIStoryboard *storyboard ;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
        
        scroll_view.contentSize = CGSizeMake(self.view.frame.size.width, background_view.frame.size.height);
        
    } else {
        
        storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        
        scroll_view.contentSize = CGSizeMake(self.view.frame.size.width, background_view.frame.size.height);
    }
    
    Save_btn.layer.cornerRadius = 5.0f;
    
    
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

- (IBAction)tapSave_btn:(id)sender {
}
@end
