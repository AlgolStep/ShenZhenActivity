//
//  LeftView.m
//  ShenZhenActivity
//
//  Created by 思来氏 on 15-3-18.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import "LeftView.h"

@implementation LeftView
{
    UIImageView *imageView;
    UITableView *leftTableView;
    UIImageView *avatarImageView;
    UILabel *nameLable;
    CGFloat screenWidth;
    CGFloat screenHeight;
    
    CGRect avatarOriginFrame;
    CGRect nameLableOriginFrame;
    CGRect leftOriginFrame;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//- (id)init{
//    self = [super init];
//    if (self) {
//        self.backgroundColor = [UIColor lightGrayColor];
//        screenWidth = [UIScreen mainScreen].bounds.size.width;
//        screenHeight = [UIScreen mainScreen].bounds.size.height;
//        self.frame = CGRectMake(0, 0, screenWidth, screenHeight);
//        self.frame = CGRectMake(0, 0, 0, screenHeight);;
//        imageView = [[UIImageView alloc] initWithFrame:self.frame];
//        imageView.image = [UIImage imageNamed:@"left_background"];
//        [self addSubview:imageView];
//        avatarImageView = [[UIImageView alloc] init];
//        avatarImageView.frame = CGRectMake(70, 44, 100, 100);
//        avatarOriginFrame = avatarImageView.frame;
//        avatarImageView.layer.cornerRadius = 50.0;
//        
//        nameLable = [[UILabel alloc] init];
//        nameLable.frame = CGRectMake(avatarImageView.frame.origin.x-30, avatarImageView.frame.origin.y+avatarImageView.frame.size.height, 0, 30);
//        nameLableOriginFrame = nameLable.frame;
//        nameLable.text = @"王浩然";
//        
//        CGFloat tableY = avatarImageView.frame.origin.y+avatarImageView.frame.size.height+nameLable.frame.size.height;
//        CGRect tableRect = CGRectMake(0, tableY,self.frame.size.width, screenHeight-tableY);
//        leftOriginFrame = tableRect;
//        leftTableView = [[UITableView alloc] initWithFrame:tableRect style:UITableViewStylePlain];
//        leftTableView.dataSource = self;
//        leftTableView.delegate = self;
//        [self addSubview:avatarImageView];
//        [self addSubview:nameLable];
//        [self addSubview:leftTableView];
        
//    }
//    return self;
//}

#pragma mark - UITableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [self costumTableView:tableView cellForRowAtIndexPath:indexPath];
    }
    return cell;
    
}

- (UITableViewCell*)costumTableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell * cell =  [[[NSBundle mainBundle] loadNibNamed:@"LeftTableViewCell" owner:nil options:nil] lastObject];
    return cell;
}

- (void)showLeftView
{

    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    
    self.frame = CGRectMake(0, 0, screenWidth-70, screenHeight);
    imageView.frame = self.frame;
    CGFloat tableY = avatarImageView.frame.origin.y+avatarImageView.frame.size.height+nameLable.frame.size.height;
    leftTableView.frame = CGRectMake(0, tableY, self.bounds.size.width-100, screenHeight-tableY);
    nameLable.frame = CGRectMake(avatarImageView.frame.origin.x-30, avatarImageView.frame.origin.y+avatarImageView.frame.size.height, 80, 30);
    [UIView commitAnimations];
}

- (void)hideLeftView
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    self.frame = CGRectMake(0, 0, 0, screenHeight);
    imageView.frame = self.frame;
    leftTableView.frame = leftOriginFrame;
    nameLable.frame = nameLableOriginFrame;
    [UIView commitAnimations];
}
@end
