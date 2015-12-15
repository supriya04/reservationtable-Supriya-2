//
//  PrivateDiningViewController.h
//  reservationtable
//
//  Created by promatics on 11/30/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PrivateDiningViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *phone;

@property (strong, nonatomic) IBOutlet UIButton *date;
@property (strong, nonatomic) IBOutlet UIButton *time;
@property (strong, nonatomic) IBOutlet UITextField *forGuest;
@property (strong, nonatomic) IBOutlet UIButton *eventType;
@property (strong, nonatomic) IBOutlet UITextField *detail;
@property (strong, nonatomic) IBOutlet UIButton *submit;

@end
