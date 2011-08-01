//
//  BenefitsTableViewController.m
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 7/31/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import "BenefitsTableViewController.h"
#import "BenefitDetailViewController.h"
#import "Caregiver_Activity_GuideAppDelegate.h"
#import "Benefit.h"

@implementation BenefitsTableViewController

@synthesize benefitsArray;
@synthesize benefitDetailViewController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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

// TODO: Make this list populate from titles in array in Benefits.plist
- (void)viewDidLoad
{
    self.title = @"Benefits";

    NSArray *array = [[NSArray alloc] initWithObjects:@"Physical Skills", @"Cognitive Skills",
                             @"Social Skills", @"Spiritual Health", @"Laughter", @"Reduce Stress",
                             @"Decrease Boredom", @"Increase Creativity", @"Success and Achievement",
                             @"Control and Choice", nil]; 
    
    
    self.benefitsArray = array;
    [array release];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) dealloc{
    [benefitDetailViewController release];
    [benefitsArray release];
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.benefitsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    NSUInteger row = [indexPath row];
    /*Benefit *theBenefit = [self.benefitsArray objectAtIndex:row];
    cell.textLabel.text = theBenefit.title;*/
    cell.textLabel.text = [self.benefitsArray objectAtIndex:row];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    NSInteger row = [indexPath row];
    if (self.benefitDetailViewController == nil){
        BenefitDetailViewController *aBenefitDetail = [[BenefitDetailViewController alloc] initWithNibName:@"BenefitDetailViewController" bundle:nil];
        self.benefitDetailViewController = aBenefitDetail;
        [aBenefitDetail release];   
    }
    
    benefitDetailViewController.title = [NSString stringWithFormat:@"%@", [benefitsArray objectAtIndex:row]];
    
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:benefitDetailViewController animated:YES];
    
}

@end
