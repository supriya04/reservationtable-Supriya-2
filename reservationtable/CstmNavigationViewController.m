//
//  CstmNavigationViewController.m
//  reservationtable
//
//  Created by promatics on 11/5/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "CstmNavigationViewController.h"

@interface CstmNavigationViewController ()

@end

@implementation CstmNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [UITabBarItem.appearance setTitleTextAttributes:
  @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1]}
                                           forState:UIControlStateNormal];
    
    // then if StateSelected should be different, you should add this code
//    [UITabBarItem.appearance setTitleTextAttributes:
//  @{NSForegroundColorAttributeName : [UIColor whiteColor]}
//                                           forState:UIControlStateSelected];
//    //ic_search_18pt
//    
//    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"restaurant_icon"]
//                                     imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    self.tabBarItem.image = [[UIImage imageNamed:@"restaurant_icon"]
//                             imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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

@end
