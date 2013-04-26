//
//  AddSightingViewController.h
//  BirdWatching
//
//  Created by Jimmy Zuber on 4/19/13.
//  Copyright (c) 2013 Jimmy Zuber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BirdSightingDataController.h"

@class BirdSighting;

@interface AddSightingViewController : UITableViewController <UITextFieldDelegate>

@property (strong, nonatomic) UITextField *birdNameInput;

@property (strong, nonatomic) UITextField *locationInput;

@property (strong, nonatomic) BirdSighting *birdSighting;

@property (strong, nonatomic) BirdSightingDataController *datacontroller;

@end