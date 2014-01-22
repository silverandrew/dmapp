//
//  MainViewController.h
//  DMAPP
//
//  Created by Brandon Scherff on 1/3/14.
//  Copyright (c) 2014 Dance Marathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController <UIWebViewDelegate> {
    UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;
@property (nonatomic, retain) IBOutlet UIWebView *webViewNews;
@end
