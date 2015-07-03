//
//  ItemModel.h
//  H5ContainerFramework
//
//  Created by lizhijie on 7/3/15.
//  Copyright (c) 2015 resolr. All rights reserved.
//

#import <Foundation/Foundation.h>
//{"tid":"18116273333","key_index":"99","key_tid":"DFESDF923498349XSDFSDFSDF"}
@interface ItemModel : NSObject

@property (nonatomic, strong) NSString* tid;
@property (nonatomic, strong) NSString* keyIndex;
@property (nonatomic, strong) NSString* keyTid;

-(id)initWithDic:(NSDictionary*)dic;
@end
