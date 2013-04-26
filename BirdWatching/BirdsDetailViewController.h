//
//  BirdsDetailViewController.h
//  BirdWatching
//
//  Created by Jimmy Zuber on 4/19/13.
//  Copyright (c) 2013 Jimmy Zuber. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BirdSighting;

@interface BirdsDetailViewController : UITableViewController

@property (strong, nonatomic) BirdSighting *sighting;
@property (weak, nonatomic) UILabel *birdNameLabel;
@property (weak, nonatomic) UILabel *locationLabel;
@property (weak, nonatomic) UILabel *dateLabel;

@end
