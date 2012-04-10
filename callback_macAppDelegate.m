//
//  callback_macAppDelegate.m
//  callback-mac
//
//  Created by shazron on 10-04-08.
//  Copyright 2010 Nitobi Software Inc. All rights reserved.
//

#import "callback_macAppDelegate.h"

@implementation callback_macAppDelegate

@synthesize window, contentView;

- (void) applicationDidStartLaunching:(NSNotification *)aNotification {}

- (void) applicationWillFinishLaunching:(NSNotification *)aNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self.contentView 
											 selector:@selector(windowResized:) 
												 name:NSWindowDidResizeNotification 
											   object:[self window]];
	
    NSURL* fileUrl = [NSURL URLWithString:[[NSUserDefaults standardUserDefaults] stringForKey:@"url"]];

    if (!fileUrl) {
        fileUrl = [NSURL fileURLWithPath:[[Utils sharedInstance] pathForResource:kStartPage]];
    }

	[self.contentView.webView setMainFrameURL:[fileUrl description]];

}

- (void) applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    self.contentView.webView.alphaValue = 1.0;
    self.contentView.alphaValue = 1.0;
}

@end
