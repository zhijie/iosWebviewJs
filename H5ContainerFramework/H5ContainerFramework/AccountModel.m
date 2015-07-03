//
//  ItemModel.m
//  H5ContainerFramework
//
//  Created by lizhijie on 7/3/15.
//  Copyright (c) 2015 resolr. All rights reserved.
//

#import "AccountModel.h"

@implementation AccountModel
-(id)initWithDic:(NSDictionary*)dic
{
    if (self == [super init]) {
        _tid = [dic objectForKey:@"tid"];
        _keyIndex = [dic objectForKey:@"key_index"];
        _keyTid = [dic objectForKey:@"key_tid"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder*)coder
{
    [coder encodeObject:_tid forKey:@"tid"];
    [coder encodeObject:_keyIndex forKey:@"key_index"];
    [coder encodeObject:_keyTid forKey:@"key_tid"];
}

- (id)initWithCoder:(NSCoder*)decoder
{
    if (self = [super init])
    {
        if (decoder == nil)
        {
            return self;
        }
        _tid = [decoder decodeObjectForKey:@"tid"];
        _keyIndex = [decoder decodeObjectForKey:@"key_index"];
        _keyTid = [decoder decodeObjectForKey:@"key_tid"];
    }
    return self;
}
@end
