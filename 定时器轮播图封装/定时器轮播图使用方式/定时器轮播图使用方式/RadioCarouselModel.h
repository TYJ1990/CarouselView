//
//  RadioCarouselModel.h
//  PianKe
//
//  Created by I三生有幸I on 16/5/16.
//  Copyright © 2016年 盛辰. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RadioCarouselModel : NSObject
@property (nonatomic, strong)NSString *img;

+ (NSMutableArray *)modelConfigureJson:(NSDictionary *)jsonDic;
@end
