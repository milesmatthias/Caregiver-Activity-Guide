//
//  DefinitionsTableViewController.m
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 8/4/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import "DefinitionsTableViewController.h"
#import "DefinitionDetailViewController.h"
#import "Caregiver_Activity_GuideAppDelegate.h"

@implementation DefinitionsTableViewController

@synthesize definitionDetailViewController;
@synthesize definitionsArray;

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

- (void)viewDidLoad
{
    self.title = @"Definitions";
    
    // Get the objects from Core Data database
    Caregiver_Activity_GuideAppDelegate *appDelegate =
	[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"Definition"
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
        [array addObject:[oneObject valueForKey:@"title"]];
    }
    [request release];
    
    /*NSArray *array = [[NSArray alloc] initWithObjects:@"Physical Skills", @"Cognitive Skills",
     @"Social Skills", @"Spiritual Health", @"Laughter", @"Reduce Stress",
     @"Decrease Boredom", @"Increase Creativity", @"Success and Achievement",
     @"Control and Choice", nil];*/
    
    self.definitionsArray = array;
    [array release];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.definitionsArray = nil;
    self.definitionDetailViewController = nil;
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

- (void)dealloc{
    [definitionsArray release];
    [definitionDetailViewController release];
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
    return [self.definitionsArray count];
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
    cell.textLabel.text = [self.definitionsArray objectAtIndex:row];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    NSInteger row = [indexPath row];
    if (self.definitionDetailViewController == nil){
        DefinitionDetailViewController *aDefinitionDetail = [[DefinitionDetailViewController alloc] initWithNibName:@"DefinitionDetailViewController" bundle:nil];
        self.definitionDetailViewController = aDefinitionDetail;
        [aDefinitionDetail release];   
    }
    
    definitionDetailViewController.title = [NSString stringWithFormat:@"%@", [definitionsArray objectAtIndex:row]];
    
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:definitionDetailViewController animated:YES];
    
}

@end
