//
//  ActionViewController.h
//  reservationtable
//
//  Created by promatics on 11/24/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionViewController : UIViewController
- (IBAction)showActionSheet:(id)sender;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *gift_btn;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *setting_btn;

- (IBAction)tapGift_btn:(id)sender;

- (IBAction)tapSetting_btn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *review_btn;

- (IBAction)tapReview_btn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *reservation_btn;

- (IBAction)tapReservation_btn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *points_btn;
- (IBAction)tapPoints_btn:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *favourite_btn;

- (IBAction)tapFavorite_btn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *vocher_btn;

- (IBAction)tapVocher_btn:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *reservation_view;

@property (strong, nonatomic) IBOutlet UIView *review_view;
@property (strong, nonatomic) IBOutlet UIView *line_view;


@property (strong, nonatomic) IBOutlet UIView *point_view;

@property (strong, nonatomic) IBOutlet UIView *favourite_view;

@property (strong, nonatomic) IBOutlet UIView *vocher_view;


@end
