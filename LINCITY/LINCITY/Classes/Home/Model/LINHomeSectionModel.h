//
//  LINHomeSectionModel.h
//  LINCITY
//
//  Created by 林荣安 on 15/11/21.
//  Copyright © 2015年 Family. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LINHomeCellModel.h"

@interface LINHomeSectionModel : NSObject

@property(nonatomic, strong) NSString *color;
@property(nonatomic, strong) NSString *section_count;
@property(nonatomic, strong) NSString *tag_name;
@property(nonatomic, strong) NSArray *body;

@end
