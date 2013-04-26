//
//  BirdsDetailViewController.m
//  BirdWatching
//
//  Created by Jimmy Zuber on 4/19/13.
//  Copyright (c) 2013 Jimmy Zuber. All rights reserved.
//

#import "BirdsDetailViewController.h"
#import "BirdSighting.h"

@interface BirdsDetailViewController ()
- (void)configureView;
@end
 
@implementation BirdsDetailViewController

#pragma mark - Managing the detail item

- (void)setSighting:(BirdSighting *) newSighting
{
    if (_sighting != newSighting) {
        _sighting = newSighting;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    BirdSighting *theSighting = self.sighting;
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    if (theSighting) {
        self.birdNameLabel.text = theSighting.name;
        self.locationLabel.text = theSighting.location;
        self.dateLabel.text = [formatter stringFromDate:(NSDate *)theSighting.date];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    [self setTitle:@"Sighting"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:nil];
    NSInteger i = [indexPath row];
    if(i == 0)
    {
        [[cell textLabel] setText:@"Bird Name"];
        [[cell detailTextLabel] setText:self.sighting.name];
    }
    else if(i == 1)
    {
        [[cell textLabel] setText:@"Location"];
        [[cell detailTextLabel] setText:self.sighting.location];
    }
    else
    {
        static NSDateFormatter *formatter = nil;
        if (formatter == nil) {
            formatter = [[NSDateFormatter alloc] init];
            [formatter setDateStyle:NSDateFormatterMediumStyle];
        }
        [[cell textLabel] setText:@"Date"];
        [[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *)self.sighting.date]];
        
    }
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3; //3 static cells
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
