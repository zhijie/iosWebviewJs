//
//  BestpaySDK.h
//  H5ContainerFramework
//
//  Created by Zhijie on 7/3/15.
//  Copyright (c) 2015 resolr. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "OrderModel.h"

@protocol BestpayDelegate <NSObject>

-(void)bestpayDelegate;

@end


@interface BestpaySDK : NSObject


+(void)payWithOrder:(OrderModel*)order fromViewController:(UIViewController*)hostvc;

@end
