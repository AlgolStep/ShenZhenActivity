//
//  LoginViewController.m
//  ShenZhenActivity
//
//  Created by 思来氏 on 15-3-19.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.320  180
    self.navigationController.navigationBarHidden = YES;
    
}
-(void)viewWillLayoutSubviews
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButtonClick:(id)sender {
    HomeViewController *homeVCtrl = [[HomeViewController alloc] initWithNibName:@"HomeViewController"
                                                                         bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:homeVCtrl];
   UIWindow *currentWindow = [[UIApplication sharedApplication].delegate window];
    currentWindow.rootViewController = nav;
//    [self.navigationController pushViewController:homeVCtrl animated:YES];
//    [self presentViewController:homeVCtrl animated:YES completion:nil];
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
