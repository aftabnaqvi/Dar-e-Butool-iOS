//
//  ViewController.h
//  DareButool
//
//  Created by Aftab Naqvi on 8/29/18.
//  Copyright © 2018 Syed Aftab Naqvi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)reloadPage:(UIBarButtonItem *)sender;
-(void) showSpinner:(bool)show;

@end

