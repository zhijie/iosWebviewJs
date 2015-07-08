//
//  H5ContainerViewController.m
//  H5ContainerFramework
//
//  Created by lizhijie on 7/3/15.
//  Copyright (c) 2015 resolr. All rights reserved.
//

#import "H5ContainerViewController.h"
#import "AccountModel.h"

@interface H5ContainerViewController () {
    UIWebView* _webview;
    
}

@end

@implementation H5ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"翼支付";
    
    _webview = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webview.delegate = self;
    [self.view addSubview:_webview];
    
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://121.40.151.203:8080/xyhmob/"]];
    [_webview loadRequest:request];
}

#pragma mark UIWebDelegate implementation

- (void)webViewDidFinishLoad:(UIWebView*)theWebView
{
    // Black base color for background matches the native apps
    theWebView.backgroundColor = [UIColor blackColor];
    

}

 - (void) webViewDidStartLoad:(UIWebView*)theWebView
 {
     
 }
 
 - (void) webView:(UIWebView*)theWebView didFailLoadWithError:(NSError*)error
 {
     
 }

// js call: window.location.href = "myscheme://string"
- (BOOL) webView:(UIWebView*)theWebView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSURL *URL =[request URL];
    if([[URL scheme] isEqualToString:@"myscheme"]){
        NSString* params =[URL resourceSpecifier];
        NSString *decoded = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (CFStringRef)params, CFSTR(""), kCFStringEncodingUTF8);

        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"debug：收到参数" message:decoded delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
        [self parseAndSaveList:params];
        return NO;
    }
    
    return YES;
}

-(NSArray*)parseAndSaveList:(NSString*)str
{
    NSData * data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary * dic =
    [NSJSONSerialization JSONObjectWithData: data
                                    options: NSJSONReadingMutableContainers
                                      error: nil];
    NSNumber* success = [dic objectForKey:@"success"];
    if ( success != nil && success.boolValue) {
        NSMutableArray* list = [[NSMutableArray alloc] init];
        NSArray* arr = [dic objectForKey:@"result"];
        for (NSDictionary* item in arr) {
            AccountModel* m = [[AccountModel alloc] initWithDic:item];
            [list addObject:m];
        }
        
        //save to local
        NSString* tmpDir = NSTemporaryDirectory();
        NSString* path = [tmpDir stringByAppendingPathComponent:@"account"];
        [NSKeyedArchiver archiveRootObject:list toFile: path ];
        
        return  list;
    }
    return nil;
}

@end
