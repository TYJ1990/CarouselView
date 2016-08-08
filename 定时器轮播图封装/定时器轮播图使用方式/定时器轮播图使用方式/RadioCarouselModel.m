//
//  RadioCarouselModel.m
//  PianKe
//
//  Created by I三生有幸I on 16/5/16.
//  Copyright © 2016年 盛辰. All rights reserved.
//

#import "RadioCarouselModel.h"

@implementation RadioCarouselModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

+ (NSMutableArray *)modelConfigureJson:(NSDictionary *)jsonDic
{
    NSMutableArray *modelArray = [NSMutableArray array];
    NSDictionary *dataDic = jsonDic[@"data"];
    NSArray *carouselArray = dataDic[@"carousel"];
    for (NSDictionary *dic in carouselArray)
    {
        RadioCarouselModel *model = [[RadioCarouselModel alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [modelArray addObject:model];
    }
    return modelArray;
}
@end
