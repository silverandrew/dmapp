//
//  SecondViewController.h
//  DMAPP
//
//  Created by Brandon Scherff on 12/30/13.
//  Copyright (c) 2013 Dance Marathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Calender : UIViewController <UIWebViewDelegate> {
    UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end
