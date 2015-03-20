//
//  OrderPlaceViewController.h
//  ShenZhenActivity
//
//  Created by 思来氏 on 15-3-20.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderPlaceViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
