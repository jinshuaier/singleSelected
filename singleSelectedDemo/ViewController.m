//
//  ViewController.m
//  singleSelectedDemo
//
//  Created by qhx on 2017/7/27.
//  Copyright © 2017年 quhengxing. All rights reserved.
//

#import "ViewController.h"
#import "singleSelectTableViewCell.h"

#define defaultTag 1990

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *totleArray;
@property (nonatomic, assign) NSInteger   btnTag;//默认选中的Tag

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"请选择支付方式";
    self.totleArray = @[@"支付宝",@"微信",@"Apple Pay",@"云支付",@"小米pay"];
    
    //想默认选择第几个个，就设置成几，比如默认第一个就是设置成：0，以此类推
    self.btnTag = -1;
    
    [self createTableView];
}

- (void)createTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenSizeWidth, ScreenSizeHeight) style:UITableViewStyleGrouped];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = cellHeight;
    [self.tableView registerClass:[singleSelectTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.totleArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0000001;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    singleSelectTableViewCell *customCell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    customCell.titleLabel.text = self.totleArray[indexPath.row];
    customCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [customCell.selectBtn addTarget:self action:@selector(clickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    if (self.btnTag == indexPath.row) {
        customCell.selectBtn.selected = YES;
    }else{
        customCell.selectBtn.selected = NO;
    }
    return  customCell;
}
- (void)clickSelectBtn:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    if (sender.selected == NO) {
        self.btnTag = -1;
        [self.tableView reloadData];
    }else{
        UITableViewCell *cell = (UITableViewCell *)[[sender superview]superview];
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        self.btnTag = indexPath.row;
        [self.tableView reloadData];
    }
    NSLog(@"最后选择的数组的下标%ld",self.btnTag);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
