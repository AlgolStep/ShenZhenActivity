//
//  OrderPlaceViewController.m
//  ShenZhenActivity
//
//  Created by 思来氏 on 15-3-20.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import "OrderPlaceViewController.h"
#import "OrderCostumTableViewCell.h"

@interface OrderPlaceViewController ()

@end

@implementation OrderPlaceViewController
{
    NSMutableArray *segmentButtonArray;
    NSArray *segmentTitleArray;
    CGFloat screenWidth;
    CGFloat screenHeight;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    segmentTitleArray = @[@"全部",@"左边校区",@"右边校区",@"拓展功能"];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    screenWidth = [UIScreen mainScreen].bounds.size.width;
    screenHeight = [UIScreen mainScreen].bounds.size.height;
    segmentButtonArray = [[NSMutableArray alloc] initWithCapacity:4];
    CGFloat segmentWidth = screenWidth/4;
    for (int i = 0 ; i < 4; i++) {
        UIButton *segmentButton = [UIButton buttonWithType:UIButtonTypeCustom];
        segmentButton.frame = CGRectMake(i*(segmentWidth+0.2), 0, segmentWidth, 36);
        [segmentButton setTitle:segmentTitleArray[i] forState:UIControlStateNormal];
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
        [self.scrollView addSubview:segmentButton];
    }
    [segmentButtonArray[0] setSelected:YES];

}


#pragma mark - UITableView DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 103;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSLog(@"the tableView width%f",tableView.frame.size.width);
    if (nil == cell) {
        cell = [self costumTableView:tableView cellForRowAtIndexPath:indexPath];
    }
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

- (UITableViewCell*)costumTableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    UITableViewCell * cell =  [[[NSBundle mainBundle] loadNibNamed:@"OrderCostumTableViewCell" owner:nil options:nil] lastObject];
    return cell;
}


#pragma mark - UIButton Action
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
- (IBAction)backButtonClick:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
