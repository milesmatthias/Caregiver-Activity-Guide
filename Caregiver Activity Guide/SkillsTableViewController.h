//
//  SkillsTableViewController.h
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 8/4/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SkillDetailViewController;

@interface SkillsTableViewController : UITableViewController
<UITableViewDelegate, UITableViewDataSource>{
    IBOutlet UITableView *skillsTableView;
    NSArray *skillsArray;
    SkillDetailViewController *skillDetailViewController;
}
@property (nonatomic, retain) NSArray *skillsArray;
@property (nonatomic, retain) SkillDetailViewController *skillDetailViewController;
@end