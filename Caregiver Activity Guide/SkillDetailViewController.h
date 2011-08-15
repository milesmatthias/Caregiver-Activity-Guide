//
//  SkillDetailViewController.h
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 8/4/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillDetailViewController : UIViewController{
    NSObject *skill;
    UITextView *skillDescriptionTextView;
}
@property (nonatomic, retain) NSObject *skill;
@property (nonatomic, retain) IBOutlet UITextView *skillDescriptionTextView;

@end
