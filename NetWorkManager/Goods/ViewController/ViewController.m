//
//  ViewController.m
//  NetWorkManager
//
//  Created by fanxiaobin on 2017/3/24.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "ViewController.h"
#import "GoodsViewModel.h"
#import "GoodsCell.h"
#import <MJRefresh.h>

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *dataArr;

@property (nonatomic) NSInteger currentPage;

@property (nonatomic,strong) GoodsViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.currentPage = 1;
    
    [self.view addSubview:self.tableView];
    
    _viewModel = [[GoodsViewModel alloc] init];
    __weak typeof(self) weakSelf = self;
    [_viewModel setRequestWithScrollView:self.tableView Page:self.currentPage result:^(id obj) {
        weakSelf.dataArr = obj;
        [weakSelf.tableView reloadData];
        
    } failure:^(id error) {
        
    }];
   
    
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource =self;
        _tableView.tableFooterView = [UIView new];
        _tableView.estimatedRowHeight = 44;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        [_tableView registerNib:[UINib nibWithNibName:@"GoodsCell" bundle:nil] forCellReuseIdentifier:@"GoodsCell"];
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            self.currentPage = 1;
    
            __weak typeof(self) weakSelf = self;
            [_viewModel setRequestWithScrollView:self.tableView Page:self.currentPage result:^(id obj) {
                
                weakSelf.dataArr = obj;
                [weakSelf.tableView reloadData];
                
            } failure:^(id error) {
                
            }];
            
        }];
        MJRefreshNormalHeader *header = (MJRefreshNormalHeader *)_tableView.mj_header;
        header.lastUpdatedTimeLabel.hidden = YES;
        
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            self.currentPage += 1;
            
            __weak typeof(self) weakSelf = self;
            [_viewModel setRequestWithScrollView:self.tableView Page:self.currentPage result:^(id obj) {
                
                weakSelf.dataArr = obj;
                [weakSelf.tableView reloadData];
                
            } failure:^(id error) {
                
            }];
        }];
    }
    
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    GoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodsCell" forIndexPath:indexPath];
    GoodsModel *model = [self.dataArr objectAtIndex:indexPath.row];
    cell.model = model;
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
