//
//  ItemModel.m
//  H5ContainerFramework
//
//  Created by lizhijie on 7/3/15.
//  Copyright (c) 2015 resolr. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel
-(id)initWithDic:(NSDictionary*)dic
{
    if (self == [super init]) {
        _tid = [dic objectForKey:@"tid"];
        _keyIndex = [dic objectForKey:@"key_index"];
        _keyTid = [dic objectForKey:@"key_tid"];
    }
    return self;
}
@end
