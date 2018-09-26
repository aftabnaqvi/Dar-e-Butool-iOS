//
//  ViewController.m
//  DareButool
//
//  Created by Aftab Naqvi on 8/29/18.
//  Copyright © 2018 Syed Aftab Naqvi. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.webView setDelegate:self];
    [self reloadPage:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)reloadPage:(UIBarButtonItem *)sender {
    if(!_webView.isLoading) {
        NSURL *url = [NSURL URLWithString:@"https://www.dar-e-butool.org/"];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:req];
        [self showSpinner:YES];
    }
}

// Progress spinner helper function
-(void) showSpinner:(bool)show{
    if(show == YES){
        [SVProgressHUD setRingThickness:2.0];
        [SVProgressHUD setForegroundColor:[UIColor blackColor]];
        [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
        [SVProgressHUD setBackgroundColor:[UIColor clearColor]];
        //[SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    }
    else
        [SVProgressHUD dismiss];
}

#pragma UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{

    // AppStore requirement: launch donation URLs in external browser like Safari.
    
    NSURL *url = [request URL];
    NSString *data = [url host];
    if([data isEqualToString: @"www.paypal.com"] ||
       [data isEqualToString:@"commerce.coinbase.com"] ||
       [data isEqualToString:@"smile.amazon.com"]){
        UIApplication *application = [UIApplication sharedApplication];
        [application openURL:url options:@{} completionHandler:nil];
        return NO;
    }
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    if (!webView.isLoading) {
        NSLog(@"webViewDidFinishLoad");
       [self showSpinner:NO];
    }
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"didFailLoadWithError");
}

@end
