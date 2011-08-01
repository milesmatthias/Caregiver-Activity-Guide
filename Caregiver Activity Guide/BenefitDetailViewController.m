//
//  BenefitDetailViewController.m
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 7/31/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import "BenefitDetailViewController.h"

@implementation BenefitDetailViewController
@synthesize benefitDescriptionTextView;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [benefitDescriptionTextView setText:@"This is a test!"];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.benefitDescriptionTextView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc{
    [benefitDescriptionTextView release];
    [super dealloc];
}

@end
