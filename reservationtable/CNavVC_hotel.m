//
//  CNavVC_hotel.m
//  reservationtable
//
//  Created by Apple on 18/11/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "CNavVC_hotel.h"

@interface CNavVC_hotel ()

@end

@implementation CNavVC_hotel

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [UITabBarItem.appearance setTitleTextAttributes:
     @{NSForegroundColorAttributeName : [UIColor colorWithRed:0.424 green:0.29 blue:0.529 alpha:1]}
                                           forState:UIControlStateNormal];
    
    // then if StateSelected should be different, you should add this code
//    [UITabBarItem.appearance setTitleTextAttributes:
//     @{NSForegroundColorAttributeName : [UIColor whiteColor]}
//                                           forState:UIControlStateSelected];
//    
//    self.tabBarItem.selectedImage = [[UIImage imageNamed:@"hotel.png"]
//                                     imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    self.tabBarItem.image = [[UIImage imageNamed:@"hotel.png"]
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
