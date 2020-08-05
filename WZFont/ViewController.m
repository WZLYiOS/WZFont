//
//  ViewController.m
//  WZFont
//
//  Created by xiaobin liu on 2019/6/24.
//  Copyright © 2019 xiaobin liu. All rights reserved.
//

#import "WZFont.h"
#import "TableViewCell.h"
#import "ViewController.h"


/**
 分组类型

 - WZSectionCustomFont: 自定义字体
 - WZSectionSystemFont: 系统字体
 - WZSectionCount: 分组数量
 */
typedef NS_ENUM(NSInteger, WZSectionType) {
    WZSectionCustomFont = 0,
    WZSectionSystemFont,
    WZSectionCount
};


@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;//列表
@property(nonatomic,strong)NSArray <NSNumber *> *customFontArray;//自定义字体颜色
@property(nonatomic,strong)NSArray <NSString *> *systemFontArray;//系统字体颜色
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"字体演示";
    [self configView];
    [self configLocation];
    //[self printFont];
}

/**
 打印所有字体
 */
-(void)printFont {
    
    for (NSString *name in [UIFont familyNames]) {
        //NSLog(@"%@",name);
        NSArray *fontnames = [UIFont fontNamesForFamilyName:name];
        for (NSString *type in fontnames) {
            NSLog(@"%@",type);
        }
    }
}

/// 配置视图
-(void)configView {
    [self.view addSubview: self.tableView];
}

-(void)configLocation {
    
     self.tableView.translatesAutoresizingMaskIntoConstraints = false;
     [[self.tableView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor] setActive: true];
     [[self.tableView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor] setActive: true];
     [[self.tableView.topAnchor constraintEqualToAnchor: self.view.topAnchor] setActive: true];
     [[self.tableView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor] setActive: true];
}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return WZSectionCount;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    switch (section) {
        case WZSectionCustomFont:
            return self.customFontArray.count;
        case WZSectionSystemFont:
            return self.systemFontArray.count;
        default:
            break;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell"];
    cell.textLabel.text = @"字体文本123456abcdefABCDEF";
    switch (indexPath.section) {
        case WZSectionCustomFont:
            cell.textLabel.font = [WZFont setFontType: self.customFontArray[indexPath.row].integerValue size:17];
            cell.detailTextLabel.text = @"";
            break;
        case WZSectionSystemFont:
            cell.textLabel.font =  [WZFont fontWithName: self.systemFontArray[indexPath.row] size:17];
            cell.detailTextLabel.text = self.systemFontArray[indexPath.row];
        default:
            break;
    }
    return cell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0f;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    switch (section) {
        case WZSectionCustomFont:
            return @"    自定义字体";
        case WZSectionSystemFont:
            return @"    系统字体";
        default:
            break;
    }
    return @"";
}

#pragma mark - get
-(UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.rowHeight = 44;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorInset = UIEdgeInsetsZero;
        [_tableView registerClass:[TableViewCell self] forCellReuseIdentifier: @"TableViewCell"];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}

-(NSArray<NSNumber *> *)customFontArray {
    
    if (!_customFontArray) {
        
        _customFontArray = @[@(WZFontDINBold),
                             @(WZFontDINMedium),
                             @(WZFontHelveticaLT),
                             @(WZFontMittelschrift),
                             @(WZFontSourceHanSerifCN),
                             @(WZFontTT0144M),
                             @(WZFontwzlyhw)];
    }
    return _customFontArray;
}

-(NSArray<NSString *> *)systemFontArray {
    if (!_systemFontArray) {
        _systemFontArray = [UIFont familyNames];
    }
    return _systemFontArray;
}

@end
