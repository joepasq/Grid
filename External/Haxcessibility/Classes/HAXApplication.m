// HAXApplication.m
// Created by Rob Rix on 2011-01-06
// Copyright 2011 Rob Rix

#import "HAXApplication.h"
#import "HAXElement+Protected.h"
#import "HAXWindow.h"

@implementation HAXApplication

/*
#define kAXMenuBarAttribute                     CFSTR("AXMenuBar")
#define kAXWindowsAttribute                     CFSTR("AXWindows")
#define kAXFrontmostAttribute                   CFSTR("AXFrontmost")
#define kAXHiddenAttribute                      CFSTR("AXHidden")
#define kAXMainWindowAttribute                  CFSTR("AXMainWindow")
#define kAXFocusedWindowAttribute               CFSTR("AXFocusedWindow")
#define kAXFocusedUIElementAttribute        CFSTR("AXFocusedUIElement")
*/

-(HAXWindow *)focusedWindow {
	NSError *error = nil;
	return [self elementOfClass:[HAXWindow class] forKey:(NSString *)kAXFocusedWindowAttribute error:&error];
}


-(NSString *)localizedName {
	return (NSString *)[self attributeValueForKey:(NSString *)kAXTitleAttribute error:NULL];
}


-(pid_t)processIdentifier {
	pid_t processIdentifier = 0;
	AXUIElementGetPid(self.elementRef, &processIdentifier);
	return processIdentifier;
}

@end
