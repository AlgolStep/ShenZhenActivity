//
//  OrderPlaceViewController.m
//  ShenZhenActivity
//
//  Created by 思来氏 on 15-3-20.
//  Copyright (c) 2015年 PSYDemo. All rights reserved.
//

#import "AFNetworking.h"
#import "OrderPlaceViewController.h"
#import "OrderCostumTableViewCell.h"
#import "PlaceDetailViewController.h"

#define orderPlaceURL @"http://192.168.1.55:8040/szhd/cdList?school=1"
@interface OrderPlaceViewController ()

@end

@implementation OrderPlaceViewController
{
    NSMutableArray *segmentButtonArray;
    NSArray *segmentTitleArray;
    CGFloat screenWidth;
    CGFloat screenHeight;
    UITableView *newTableView;
    NSDictionary *dataDictionary;
    NSArray *dataArray;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self dataFirst];
    segmentTitleArray = @[@"全部",@"左边校区",@"右边校区",@"拓展功能"];
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
    [self.view addSubview:newTableView];
    self.activityTableView.dataSource = self;
    self.activityTableView.delegate = self;
    

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)dataFirst
{
    NSString *str= orderPlaceURL;
    NSURL *url = [NSURL URLWithString:[str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *html = operation.responseString;
        NSData* data = [html dataUsingEncoding:NSUTF8StringEncoding];
        id tempDic = [NSJSONSerialization  JSONObjectWithData:data options:0 error:nil];
        dataArray = tempDic;
        NSLog(@"获取到的数据为：%@",dataArray);
        [self.activityTableView reloadData];
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"发生错误！%@",error);
    }];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperation:operation];
}

#pragma mark - UITableView DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 103;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifierTwo = @"cellIdentifier";
    UITableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierTwo];
    NSLog(@"the tableView width%f",tableView.frame.size.width);
    if (nil == cell) {
        cell = [self costumTableView:tableView cellForRowAtIndexPath:indexPath];
    }
    dataDictionary = dataArray[indexPath.row];
    UIImageView *avatarImageView = (UIImageView*)[cell viewWithTag:1001];
    UILabel *placeNameLb = (UILabel*)[cell viewWithTag:1002];
    placeNameLb.text = [dataDictionary objectForKey:@"name"];
    
    UILabel *peopleNumLb = (UILabel*)[cell viewWithTag:1003];
    peopleNumLb.text = [dataDictionary objectForKey:@"totalNum"];
    
    UILabel *projectNameLb = (UILabel*)[cell viewWithTag:1004];
    projectNameLb.text = [dataDictionary objectForKey:@"type"];
    
    UILabel *placeAddrLb = (UILabel*)[cell viewWithTag:1005];
    NSString *schoolDepart = [dataDictionary objectForKey:@"school_depart"];
    NSString *placeAddr = [dataDictionary objectForKey:@"position"];
    placeAddrLb.text = [NSString stringWithFormat:@"%@    %@",schoolDepart,placeAddr];
    
//    UIButton *button = (UIButton*)[cell viewWithTag:1006];
//    NSString *orderNum = [dataDictionary objectForKey:@"numTimes"];
//    [button setTitle:orderNum forState:UIControlStateNormal];
    
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PlaceDetailViewController *placeDetailVCtrl = [[PlaceDetailViewController alloc] initWithNibName:@"PlaceDetailViewController" bundle:nil];
    [self.navigationController pushViewController:placeDetailVCtrl animated:YES];
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
