//
//  FirstViewController.m
//  DMAPP
//
//  Created by Brandon Scherff on 12/30/13.
//  Copyright (c) 2013 Dance Marathon. All rights reserved.
//

#import "NewsFeed.h"
#import <Foundation/Foundation.h>
#import <Social/Social.h>
#include "Reachability.h"

@interface NewsFeed ()

@end

@implementation NewsFeed
@synthesize webView;

- (BOOL) connectedToNetwork
{
	Reachability *r = [Reachability reachabilityForInternetConnection];
	NetworkStatus internetStatus = [r currentReachabilityStatus];
	BOOL internet;
	if ((internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN)) {
		internet = NO;
	} else {
		internet = YES;
	}
	return internet;
}

-(BOOL) checkInternet
{
	//Make sure we have internet connectivity
	if([self connectedToNetwork] != YES)
	{
		return NO;
	}
	else {
		return YES;
	}
}

- (void)viewDidLoad
{
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
    activityIndicator.frame = CGRectMake(self.view.frame.size.width/2 - 15,
                                         self.view.frame.size.height/2 - 15, 30,30);
    //activityIndicator.center = self.view.center;
    [self.view addSubview:activityIndicator];
    webView.delegate = self;
    
    if ([self checkInternet]) {
        NSURL *url = [NSURL URLWithString:@"http://www.davidyeung.net/dm/preview"];
        NSURLRequest *requestURL = [NSURLRequest requestWithURL:url];
        [webView loadRequest:requestURL];
    }else{
        UILabel *tLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                    self.view.frame.size.height/2 - 50,
                                                                    self.view.frame.size.width, 100)];
        tLabel.textAlignment = NSTextAlignmentCenter;
        [tLabel setText: [NSString stringWithFormat:@"Not connected to WiFi"]];
        [self.view addSubview:tLabel];
        NSLog(@"Not Connected");
    }
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"Begin Loading");
    [activityIndicator startAnimating];
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicator stopAnimating];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"Done Loading");
    [activityIndicator stopAnimating];
}

@end
