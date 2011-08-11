//
//  DefinitionsTableViewController.h
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 8/4/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DefinitionDetailViewController;

@interface DefinitionsTableViewController : UITableViewController
<UITableViewDelegate, UITableViewDataSource>{
    IBOutlet UITableView *definitionsTableView;
    NSArray *definitionsArray;
    DefinitionDetailViewController *definitionDetailViewController;
}
@property (nonatomic, retain) NSArray *definitionsArray;
@property (nonatomic, retain) DefinitionDetailViewController *definitionDetailViewController;
@end