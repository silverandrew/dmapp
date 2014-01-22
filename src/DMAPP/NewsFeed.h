//
//  FirstViewController.h
//  DMAPP
//
//  Created by Brandon Scherff on 12/30/13.
//  Copyright (c) 2013 Dance Marathon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsFeed : UIViewController <UIWebViewDelegate> {
    UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic, retain) IBOutlet UIWebView *webView;

@end
