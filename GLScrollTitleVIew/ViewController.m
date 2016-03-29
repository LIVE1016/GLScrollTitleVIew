//
//  ViewController.m
//  GLScrollTitleVIew
//
//  Created by William on 16/3/20.
//  Copyright © 2016年 William. All rights reserved.
//

#import "ViewController.h"
#import "GLTitleView.h"
#import "GLScrollView.h"
#import "GLListTableViewController.h"

@interface ViewController ()
<
GLTitleViewDelegate
>

@property (nonatomic, strong) GLTitleView *titleView;

@end

@implementation ViewController

#pragma mark - Super

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setFrame:CGRectMake(0, 0, 39, 39)];
    
    GLTitleView *titleView = [[GLTitleView alloc] initWithTitleHeight:39];
    titleView.delegate     = self;
    titleView.titleBottomLineColor = [UIColor redColor];
    titleView.customView = btn;
    [self.view addSubview:titleView];
    
    self.titleView = titleView;
    
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsZero);
    }];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"添加" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - GLTitleViewDelegate

- (id)titleView:(GLTitleView *)titleView cellContentForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id content = nil;
    switch (indexPath.row) {
        case 0:
        {
            content = [GLScrollView new];
        }
            break;
            
        case 1:
        {
            UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            GLListTableViewController *vc = [storyBoard instantiateViewControllerWithIdentifier:@"listVc"];
            
            content = vc;
        }
            break;
            
        default:
            break;
    }
    
    return content;
}

- (void)titleView:(GLTitleView *)titleView scrollToContent:(id)content indexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"====content -->%@,\nindexPath -->%@",content,indexPath);
}

#pragma mark - Action

- (void)addBtnClick:(UIButton *)button
{
    self.titleView.titleArray   = @[@"菜单1", @"菜单2", @"菜单3", @"菜单4", @"菜单4", @"菜单4", @"菜单4", @"菜单4"];
    self.titleView.currentIndex = 0;
}

@end
