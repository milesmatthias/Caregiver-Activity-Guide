//
//  BrowseDetailViewController.h
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 7/31/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrowseDetailViewController : UIViewController{
    UITextView *browseDescriptionTextView;
}
@property (nonatomic, retain) IBOutlet UITextView *browseDescriptionTextView;

@end
