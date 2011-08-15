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

// TODO: Have the table reset when user taps on it's tab
- (void)viewDidLoad
{
    self.title = @"Benefits";
    
    // Get the objects from Core Data database
    Caregiver_Activity_GuideAppDelegate *appDelegate =
	[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"Benefit"
											  inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
	
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if (objects == nil) {
        NSLog(@"There was an error!");
        // Do whatever error handling is appropriate
    }

    // An array to put the names of the benefits into...
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSManagedObject *oneObject in objects) {
        [array addObject:oneObject];
    }
    [request release];
    
    
    self.benefitsArray = array;
    [array release];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.benefitsArray = nil;
    self.benefitDetailViewController = nil;
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

// TODO: Make this more efficient by actually using the reuseIdentifier
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [[self.benefitsArray objectAtIndex:row] valueForKey:@"title"];
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
    
    // Pass the selected object to the new view controller.    
    benefitDetailViewController.benefit = [benefitsArray objectAtIndex:row];

    [self.navigationController pushViewController:benefitDetailViewController animated:YES];
    
}

@end
