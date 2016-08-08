//
//  ViewController.m
//  定时器轮播图使用方式
//
//  Created by I三生有幸I on 16/5/27.
//  Copyright © 2016年 盛辰. All rights reserved.
//

#import "ViewController.h"
#import "CarouselView.h"
#import "RequestManager.h"
#import "RadioCarouselModel.h"
#define kRadioURL @"http://api2.pianke.me/ting/radio"
#define KRadioScrollViewHeight 130
#define KScreenWidth [[UIScreen mainScreen]bounds].size.width
#define KScreenHeight [[UIScreen mainScreen]bounds].size.height



@interface ViewController ()
@property (nonatomic, strong)NSMutableArray *modelArray;
@property (nonatomic, strong)NSMutableArray *imageURLArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSDictionary *parDic = @{@"client":@"1",@"deviceid":@"63A94D37-33F9-40FF-9EBB-481182338873",@"auth":@"",@"version":@"3.0.2"};
    [RequestManager requestWithUrlString:kRadioURL requestType:RequestPOST parDic:parDic finish:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"dic === %@", dic);
        
        // 最上方的轮播图
        self.modelArray = [RadioCarouselModel modelConfigureJson:dic];
        
        self.imageURLArray = [NSMutableArray array];
        for (RadioCarouselModel *model in self.modelArray)
        {
            [self.imageURLArray addObject:model.img];
        }
        
        CarouselView *carouseView = [[CarouselView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KRadioScrollViewHeight) imageURLs:self.imageURLArray];
        // 点击轮播图图片的触发方法
        carouseView.imageClick = ^(NSInteger index){
            NSLog(@"点击了 %ld", index);
        };
        [self.view addSubview:carouseView];

    } error:^(NSError *error) {
        NSLog(@"error === %@", error);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
