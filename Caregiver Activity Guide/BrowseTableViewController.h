//
//  BrowseTableViewController.h
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 7/31/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BrowseDetailViewController;

@interface BrowseTableViewController : UITableViewController
<UITableViewDelegate, UITableViewDataSource>{
    IBOutlet UITableView *browseTableView;
    NSArray *browseArray;
    BrowseDetailViewController *browseDetailViewController;
}
@property (nonatomic, retain) NSArray *browseArray;
@property (nonatomic, retain) BrowseDetailViewController *browseDetailViewController;
@end
