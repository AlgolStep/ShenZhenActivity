//
//  HomeViewController.m
//  ShenZhenActivity
//
//  Created by 思来氏 on 15-3-17.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"
#import "OrderPlaceViewController.h"


@interface HomeViewController ()

@end

@implementation HomeViewController
{
    NSMutableArray *segmentButtonArray;
    NSArray *leftImageArray;
    NSArray *leftTitleArray;
    CGFloat screenWidth;
    CGFloat screenHeight;
    DetailViewController *detailVCtrl;
    OrderPlaceViewController *orderPlaceVCtrl;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@""]
                                           forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBarHidden = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.leftTableView.dataSource = self;
    self.leftTableView.delegate = self;
    screenWidth = [UIScreen mainScreen].bounds.size.width;
    screenHeight = [UIScreen mainScreen].bounds.size.height;
    leftImageArray = @[@"left_activityCheck",@"left_orderPlace",@"left_myOrder",@"left_activitySign",@"left_expandFunction"];
    leftTitleArray = @[@"活动查询",@"预约场地",@"我的预约",@"活动签到",@"拓展功能"];
    
    UIBarButtonItem *avatarButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"home_avatar"] style:UIBarButtonItemStyleDone target:self action:@selector(showLeftViewBtn:)];
    
    self.navigationController.navigationItem.leftBarButtonItem = avatarButton;
     self.navigationController.navigationBarHidden = YES;
    CGRect leftViewFrame = CGRectMake(-screenWidth, 0, screenWidth, screenHeight);
    self.leftView.frame = leftViewFrame;
    [self.view addSubview:self.leftView];
    UIGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideLeftView)];

    [self.rightView addGestureRecognizer:tapGesture];
    segmentButtonArray = [[NSMutableArray alloc] initWithCapacity:4];
    CGFloat segmentWidth = screenWidth/4;
    for (int i = 0 ; i < 4; i++) {
        UIButton *segmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        segmentButton.frame = CGRectMake(i*(segmentWidth+0.2), 0, segmentWidth, 36);
        [segmentButton setTitle:@"推荐活动" forState:UIControlStateNormal];
        [segmentButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [segmentButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [segmentButton setBackgroundImage:[UIImage imageNamed:@"home_segmentBg"]
                                 forState:UIControlStateNormal];
        [segmentButton setBackgroundImage:[UIImage imageNamed:@"home_segmentBgH"]
                                 forState:UIControlStateSelected];
        [segmentButton addTarget:self
                          action:@selector(segmentButtonClick:)
                forControlEvents:UIControlEventTouchUpInside];
        [segmentButtonArray addObject:segmentButton];
        [self.segmentView addSubview:segmentButton];
    }
    [segmentButtonArray[0] setSelected:YES];
    
   detailVCtrl = [[DetailViewController alloc] initWithNibName:@"DetailViewController"
                                                        bundle:nil];
    orderPlaceVCtrl = [[OrderPlaceViewController alloc] initWithNibName:@"OrderPlaceViewController"
                                                                 bundle:nil];
}


#pragma mark - UITableView DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = tableView.bounds.size.height/5;
    return height;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSLog(@"the tableView width%f",tableView.frame.size.width);
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        CGFloat lableX = tableView.bounds.size.width-105;
        CGFloat lableY = (tableView.bounds.size.height/5-50)/2;
        CGFloat imageX = tableView.bounds.size.width-150;
        CGFloat imageY = (tableView.bounds.size.height/5-30)/2;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, imageY, 30, 30)];
        imageView.image = [UIImage imageNamed:leftImageArray[indexPath.row]];
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(lableX,lableY, 100, 50)];
        lable.text = leftTitleArray[indexPath.row];
        lable.textColor = [UIColor whiteColor];
        [cell addSubview:lable];
        [cell addSubview:imageView];
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self hideLeftView];
    UIViewController *controller = nil;
    switch (indexPath.row) {
        case 0:
            controller = detailVCtrl;
            break;
        case 1:
            controller = orderPlaceVCtrl;
            break;
        case 2:
            break;
        case 3:
            break;
        case 4:
            break;
            
        default:
            break;
    }
    [self.navigationController pushViewController:controller animated:YES];
}
- (UITableViewCell*)costumTableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell * cell =  [[[NSBundle mainBundle] loadNibNamed:@"LeftTableViewCell" owner:nil options:nil] lastObject];
    return cell;
}


#pragma mark - ButtonAction

- (void)segmentButtonClick:(UIButton*)sender
{
    if ([sender isSelected]) {
        
    }else{
        [sender setSelected:YES];
        for (UIButton *button in segmentButtonArray) {
            if (button == sender) {
                
            }else{
                [button setSelected:NO];
            }
        }
    }
   
    
    
}
//展现左视图
- (IBAction)showLeftViewBtn:(id)sender {
   
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    
    self.leftView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
    [UIView commitAnimations];

    
}
// 隐藏左视图
- (void)hideLeftView
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    self.leftView.frame = CGRectMake(-screenWidth, 0, screenWidth, screenHeight);
    [UIView commitAnimations];
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
