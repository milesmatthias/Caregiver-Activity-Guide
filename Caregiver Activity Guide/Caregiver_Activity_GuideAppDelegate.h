//
//  Caregiver_Activity_GuideAppDelegate.h
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 7/31/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BenefitsNavController;

@interface Caregiver_Activity_GuideAppDelegate : NSObject <UIApplicationDelegate>{
    IBOutlet UITabBarController *rootController;
    IBOutlet BenefitsNavController *benefitsNavController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *rootController;
@property (nonatomic, retain) IBOutlet BenefitsNavController *benefitsNavController;

@end


// TODO: Attribution for the icons
// ATTRIBUTION -- a note reading "icons by Joseph Wain / glyphish.com" or similar, 
// plus a link back to glyphish.com from your app's website, is the preferred form of attribution. 
// Also acceptable would be, like, a link from within your iPhone application, or 
// from the iTunes store page, but those aren't as useful to other people.