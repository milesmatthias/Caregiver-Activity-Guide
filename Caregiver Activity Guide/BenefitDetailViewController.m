//
//  BenefitDetailViewController.m
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 7/31/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import "BenefitDetailViewController.h"
#import "Caregiver_Activity_GuideAppDelegate.h"

@implementation BenefitDetailViewController
@synthesize benefitDescriptionTextView, benefit;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewWillAppear:(BOOL)animaated
{
    // Set the title and the text from the selected object
    self.title = [NSString stringWithFormat:@"%@", [self.benefit valueForKey:@"title"]];
    [self.benefitDescriptionTextView setText:[NSString stringWithFormat:@"%@", [self.benefit valueForKey:@"desc"]]];
    
    [super viewWillAppear:YES];    
}

- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.benefit = nil;
    self.benefitDescriptionTextView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc{
    [benefitDescriptionTextView release];
    [benefit release];
    [super dealloc];
}

@end
