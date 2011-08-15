//
//  BenefitDetailViewController.h
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 7/31/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BenefitDetailViewController : UIViewController{
    NSObject *benefit;
    UITextView *benefitDescriptionTextView;
}
@property (nonatomic, retain) NSObject *benefit;
@property (nonatomic, retain) IBOutlet UITextView *benefitDescriptionTextView;

@end
