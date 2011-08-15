//
//  SkillDetailViewController.m
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 8/4/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import "SkillDetailViewController.h"
#import "Caregiver_Activity_GuideAppDelegate.h"

@implementation SkillDetailViewController
@synthesize skillDescriptionTextView, skill;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

- (void)viewWillAppear:(BOOL)animated
{
    // Set the title and the text from the selected object
    self.title = [NSString stringWithFormat:@"%@", [self.skill valueForKey:@"title"]];
    [self.skillDescriptionTextView setText:[NSString stringWithFormat:@"%@", [self.skill valueForKey:@"desc"]]];
    
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
    self.skill = nil;
    self.skillDescriptionTextView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc{
    [skill release];
    [skillDescriptionTextView release];
    [super dealloc];
}

@end
