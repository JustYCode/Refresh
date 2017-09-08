//
//  WebViewVC.m
//  Rubulls_IOS
//
//  Created by MrChen on 2017/3/20.
//  Copyright © 2017年 吴银春. All rights reserved.
//

#import "WebViewVC.h"
#define SCREEN_SIZE [[UIScreen mainScreen]bounds].size

@interface WebViewVC ()

@end

@implementation WebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, SCREEN_SIZE.height - 64)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:_num]];
    [self.view addSubview: webView];
    [webView loadRequest:request];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
