//
//  VocherViewController.h
//  reservationtable
//
//  Created by promatics on 11/30/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VocherViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *gift_btn;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *setting_btn;
- (IBAction)tapGift_btn:(id)sender;
- (IBAction)tapSetting_btn:(id)sender;


@end
