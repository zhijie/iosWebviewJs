//
//  BestpaySDK.m
//  H5ContainerFramework
//
//  Created by Zhijie on 7/3/15.
//  Copyright (c) 2015 resolr. All rights reserved.
//

#import "BestpaySDK.h"
#import "H5ContainerViewController.h"


@implementation BestpaySDK

+(void)payWithOrder:(OrderModel*)order fromViewController:(UIViewController*)hostvc
{
    BOOL ret =[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"bestpay"]];
    if (ret) {
        //call native
        NSLog(@"found native bestpay, calling");
    }else {
        NSLog(@"not found native bestpay, calling h5 version");
        H5ContainerViewController* vc = [[H5ContainerViewController alloc] initWithNibName:nil bundle:nil];
        if (hostvc.navigationController) {
            
            [hostvc.navigationController pushViewController:vc animated:YES];
        }else {
            [hostvc presentViewController:vc animated:YES completion:^{
                
            }];
        }
    }
}

@end
