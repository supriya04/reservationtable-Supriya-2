//
//  Restaurant_listngViewController.m
//  reservationtable
//
//  Created by Apple on 19/11/15.
//  Copyright (c) 2015 promatics. All rights reserved.
//

#import "Restaurant_listngViewController.h"
#import "ListingViewController.h"

@interface Restaurant_listngViewController ()
{
    UIBarButtonItem *list,*filter;
    
}
@end

@implementation Restaurant_listngViewController

@synthesize filter_btn,map_btn;
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
//    list = [[UIBarButtonItem alloc]initWithTitle:@"Map" style:UIBarButtonItemStylePlain target:nil action:nil];
//    
//    filter = [[UIBarButtonItem alloc]initWithTitle:@"Filter" style:UIBarButtonItemStylePlain target:self action:@selector(tap_filter)];
    
    
    self.navigationItem.rightBarButtonItems = @[filter_btn,map_btn];
    
    
}

-(void)tap_filter {
    
    [self performSegueWithIdentifier:@"list_Segue" sender:self];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
//    ListingViewController *listViewController = [[ListingViewController alloc] init];
//    
//    NSArray *price = [NSArray arrayWithObjects:@"All Cuisines",@"Afghan",@"Beer Garden",@"Colombian",@"Dim Sum",@"Halal",@"Seafood",nil];
//    
//    NSArray *selData = [[NSArray alloc]init];
//    
//    UIStoryboard *Story_board;
//    
//    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
//        
//        
//    }else {
//       
//        Story_board = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
//        
//    }
//   
//    
//    if([segue.identifier isEqualToString:@"list_Segue"]) {
//        
//        listViewController = [segue destinationViewController];
//        
//        listViewController.isMultipleSelected = NO;
//        
//        listViewController.array_data = [price mutableCopy];
//        
//        listViewController.selectedData = [selData mutableCopy];
//        
//        //listViewController.delegate = self;
//        
//        listViewController.title = @"Cuisines";
//    }
    
}

@end
