//
//  News_detailViewController.m
//  TimeMovie
//
//  Created by 黄翔宇 on 15/8/31.
//  Copyright (c) 2015年 黄翔宇. All rights reserved.
//

#import "News_detailViewController.h"

@interface News_detailViewController ()

@end

@implementation News_detailViewController

- (void)viewDidLoad {
    self.title=@"网页新闻";
    UIWebView *web=[[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURL *url=[NSURL URLWithString:@"http://www.hao123.com"];
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];
    [web loadRequest:request];
    
    
    
    
   /* NSDictionary *data=[MovieJson loadData:@"news_detail"];
    NSString *content=data[@"content"];
    NSString *time=data[@"time"];
    NSString *title=data[@"title"];
    NSString *source=data[@"source"];
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    NSString *htmlstring=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    htmlstring=[NSString stringWithFormat:htmlstring,title,content,time,source];
    [web loadHTMLString:htmlstring baseURL:nil];*/
    web.scalesPageToFit=YES;
    [self.view addSubview:web];
    
    
    [super viewDidLoad];
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
