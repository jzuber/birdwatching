//
//  BirdsMasterViewController.h
//  BirdWatching
//
//  Created by Jimmy Zuber on 4/19/13.
//  Copyright (c) 2013 Jimmy Zuber. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BirdSightingDataController;

@interface BirdsMasterViewController : UITableViewController 

@property (strong, nonatomic) BirdSightingDataController *dataController;
/*
- (IBAction)done:(UIStoryboardSegue *)segue;

- (IBAction)cancel:(UIStoryboardSegue *)segue;
*/
@end
