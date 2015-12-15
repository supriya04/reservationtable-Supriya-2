//
//  ActionViewController.m
//  reservationtable
//
//  Created by promatics on 11/24/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "ActionViewController.h"

@interface ActionViewController ()

@end

@implementation ActionViewController

@synthesize gift_btn,setting_btn,reservation_btn,reservation_view,review_btn,review_view,line_view,points_btn,favourite_btn,vocher_btn,point_view,favourite_view,vocher_view;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.hidesBackButton = YES;
    
    review_view.hidden = YES;
    point_view.hidden = YES;
    favourite_view.hidden = YES;
    vocher_view.hidden = YES;
    
    self.navigationItem.rightBarButtonItems = @[gift_btn,setting_btn];
    
    // Do any additional setup after loading the view.
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

- (IBAction)showActionSheet:(id)sender {
    
    NSString *actionSheetTitle = @"Settings"; //Action Sheet Title
    NSString *destructiveTitle = nil; //Action Sheet Button Titles
    NSString *other1 = @"Account Details";
    NSString *other2 = @"Rate Reservation.ng";
    NSString *other3 = @"About Reservation.ng";
    NSString *other4 = @"Sign out";
    NSString *cancelTitle = @"Cancel";
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:actionSheetTitle
                                  delegate:nil
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:destructiveTitle
                                  otherButtonTitles:other1, other2, other3,other4, nil];
    
    [actionSheet showInView:self.view];
}
- (IBAction)tapGift_btn:(id)sender {
    
}

- (IBAction)tapSetting_btn:(id)sender {
}
- (IBAction)tapReview_btn:(id)sender {
    
    [reservation_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [points_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [favourite_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [vocher_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    reservation_view.hidden = YES;
    point_view.hidden = YES;
    favourite_view.hidden = YES;
    vocher_view.hidden = YES;
    
    [review_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    review_view.hidden = NO;
    
    CGRect frame = line_view.frame;
    frame.origin.x = review_btn.frame.origin.x;
    frame.size.width = review_btn.frame.size.width;
    line_view.frame = frame;
    
}
- (IBAction)tapReservation_btn:(id)sender {
    
    [reservation_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    reservation_view.hidden = NO;
    
    [review_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [points_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [favourite_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [vocher_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    review_view.hidden = YES;
    point_view.hidden = YES;
    favourite_view.hidden = YES;
    vocher_view.hidden = YES;
    
    CGRect frame = line_view.frame;
    frame.origin.x = reservation_btn.frame.origin.x;
    frame.size.width = reservation_btn.frame.size.width;
    line_view.frame = frame;
    
}
- (IBAction)tapPoints_btn:(id)sender {
    
    [review_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [reservation_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [favourite_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [vocher_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    review_view.hidden = YES;
    reservation_view.hidden = YES;
    favourite_view.hidden = YES;
    vocher_view.hidden = YES;
    
    [points_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    point_view.hidden = NO;
    
    CGRect frame = line_view.frame;
    frame.origin.x = points_btn.frame.origin.x;
    frame.size.width = points_btn.frame.size.width;
    line_view.frame = frame;
}
- (IBAction)tapFavorite_btn:(id)sender {
    
    [review_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [points_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [reservation_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [vocher_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    review_view.hidden = YES;
    point_view.hidden = YES;
    reservation_view.hidden = YES;
    vocher_view.hidden = YES;
    
    [favourite_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    favourite_view.hidden = NO;
    
    CGRect frame = line_view.frame;
    frame.origin.x = favourite_btn.frame.origin.x;
    frame.size.width = favourite_btn.frame.size.width;
    line_view.frame = frame;
}
- (IBAction)tapVocher_btn:(id)sender{
    
    [review_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [points_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [favourite_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [reservation_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    review_view.hidden = YES;
    point_view.hidden = YES;
    favourite_view.hidden = YES;
    reservation_view.hidden = YES;
    
    [vocher_btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    vocher_view.hidden = NO;
    
    CGRect frame = line_view.frame;
    frame.origin.x = vocher_btn.frame.origin.x;
    frame.size.width = vocher_btn.frame.size.width;
    line_view.frame = frame;
 
}
@end
