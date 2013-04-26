//
//  BirdsMasterViewController.m
//  BirdWatching
//
//  Created by Jimmy Zuber on 4/19/13.
//  Copyright (c) 2013 Jimmy Zuber. All rights reserved.
//

#import "AddSightingViewController.h"

#import "BirdsMasterViewController.h"

#import "BirdsDetailViewController.h"

#import "BirdSightingDataController.h"

#import "BirdSighting.h"

@implementation BirdsMasterViewController
@synthesize dataController;

- (void)viewDidLoad
{
    [super viewDidLoad];
    dataController = [[BirdSightingDataController alloc] init];
    [self setTitle:@"Bird Sightings"];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(goToAddSighting:)];
    [self.navigationItem setRightBarButtonItem:addButton];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"BirdSightingCell";
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    BirdSighting *sightingAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:sightingAtIndex.name];
    [[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *)sightingAtIndex.date]];
    [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    BirdSighting *sighting = [self.dataController objectInListAtIndex:[indexPath row]];
    BirdsDetailViewController *newview = [[BirdsDetailViewController alloc] init];
    [newview setSighting:sighting];
    [(UINavigationController *)(self.parentViewController) pushViewController:newview animated:TRUE];
}

- (void)goToAddSighting:(UIBarButtonItem *)barButton
{
    AddSightingViewController *newview = [[AddSightingViewController alloc] init];
    [newview setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    newview.datacontroller = dataController;
    [self.navigationController pushViewController:newview animated:YES];
}


@end
