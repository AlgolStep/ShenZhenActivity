//
//  LeftView.h
//  ShenZhenActivity
//
//  Created by 思来氏 on 15-3-18.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftView : UIView<UITableViewDataSource,UITableViewDelegate>
- (void)showLeftView;
- (void)hideLeftView;
@end
