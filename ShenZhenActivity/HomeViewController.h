//
//  HomeViewController.h
//  ShenZhenActivity
//
//  Created by 思来氏 on 15-3-17.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *segmentView;

@property (strong, nonatomic) IBOutlet UIView *leftView;
@property (strong, nonatomic) IBOutlet UIView *rightView;
@property (strong, nonatomic) IBOutlet UIImageView *leftAvatarImageV;
@property (strong, nonatomic) IBOutlet UILabel *leftNameLable;
@property (strong, nonatomic) IBOutlet UITableView *leftTableView;

@end
