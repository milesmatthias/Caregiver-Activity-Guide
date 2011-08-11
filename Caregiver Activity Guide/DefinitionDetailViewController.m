//
//  DefinitionDetailViewController.m
//  Caregiver Activity Guide
//
//  Created by Miles Matthias on 8/4/11.
//  Copyright 2011 UNO/PKI. All rights reserved.
//

#import "DefinitionDetailViewController.h"
#import "Caregiver_Activity_GuideAppDelegate.h"

@implementation DefinitionDetailViewController
@synthesize definitionDescriptionTextView;

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

- (void)viewDidLoad
{
    // Do any additional setup after loading the view from its nib.
    
    // Get the objects from Core Data database
    /*Caregiver_Activity_GuideAppDelegate *appDelegate =
	[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSEntityDescription *entityDescription = [NSEntityDescription
											  entityForName:@"Definition"
											  inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDescription];
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"(title = %@)", self.title];
    [request setPredicate:pred];
	
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request error:&error];
    if (objects == nil) {
        NSLog(@"There was an error!");
        // Do whatever error handling is appropriate
    }
    
    for (NSManagedObject *oneObject in objects) {
        [definitionDescriptionTextView setText:[oneObject valueForKey:@"desc"]];
    }
    
    [objects release];
    [request release];*/
    
    // ** I don't understand why the above doesn't work.
    // ** I can set breakpoints after this code and it reaches the breakpoint fine, 
    // ** then gets a "Bad Access" error.
    // ** But commenting out this code makes it work, so what's the deal??
   
    [definitionDescriptionTextView setText:@"This isn't working yet..."];
    
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.definitionDescriptionTextView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc{
    [definitionDescriptionTextView release];
    [super dealloc];
}

@end
