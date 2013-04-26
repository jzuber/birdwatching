//
//  AddSightingViewController.m
//  BirdWatching
//
//  Created by Jimmy Zuber on 4/19/13.
//  Copyright (c) 2013 Jimmy Zuber. All rights reserved.
//

#import "AddSightingViewController.h"

#import "BirdSighting.h"

@interface AddSightingViewController ()

@end

@implementation AddSightingViewController

@synthesize birdNameInput;
@synthesize locationInput;
@synthesize birdSighting;
@synthesize datacontroller;


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ((textField == self.birdNameInput) || (textField == self.locationInput)) {
        [textField resignFirstResponder];
        if(textField == self.locationInput)
        {
            [self done:nil];
        }
    }
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Add Sighting"];
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(done:)];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
    [self.navigationItem setRightBarButtonItem:doneButton];
    [self.navigationItem setLeftBarButtonItem:cancelButton];
}

- (void)done:(UIBarButtonItem *)button
{
    if(![birdNameInput.text isEqual: @""] && ![locationInput.text isEqual: @""])
    {
        BirdSighting *newsighting = [[BirdSighting alloc] initWithName:birdNameInput.text location:locationInput.text date:[NSDate date]];
        [datacontroller addBirdSightingWithSighting:newsighting ];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)cancel:(UIBarButtonItem *)button
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger i = [indexPath row];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    
    
    if(i == 0)
    {
        birdNameInput = [[UITextField alloc] init];
        birdNameInput.borderStyle = UITextBorderStyleRoundedRect;
        birdNameInput.placeholder = @"Enter name of bird";
        birdNameInput.clearsOnBeginEditing = YES;
        birdNameInput.returnKeyType = UIReturnKeyNext;
        birdNameInput.delegate = self;
        
        CGFloat x = (cell.frame.size.width / 3.0) + (cell.frame.size.width / 20.0);
        CGFloat y = cell.frame.origin.y + (cell.frame.size.height / 8.0) ;
        CGFloat w = (2.0 * cell.frame.size.width / 3.0) - (2.0 * cell.frame.size.width / 20.0);
        CGFloat h = 3.0 * cell.frame.size.height / 4.0;
        
        
        birdNameInput.frame = CGRectMake(x,y,w,h);
        [[cell textLabel] setText: @"Bird Name"];
        [cell.contentView addSubview:birdNameInput];
    }
    else
    {
        locationInput = [[UITextField alloc] init];
        locationInput.borderStyle = UITextBorderStyleRoundedRect;
        locationInput.placeholder = @"Enter location";
        locationInput.clearsOnBeginEditing = YES;
        locationInput.returnKeyType = UIReturnKeyDone;
        locationInput.delegate = self;
        
        CGFloat x = cell.frame.size.width / 3.0;
        CGFloat y = (1.0 * cell.frame.size.height / 8.0) ;
        CGFloat w = (2.0 * cell.frame.size.width / 3.0) - cell.frame.size.width / 20.0;
        CGFloat h = 3.0 * cell.frame.size.height / 4.0;
        
        
        locationInput.frame = CGRectMake(x,y,w,h);
        [[cell textLabel] setText: @"Location"];
        [cell.contentView addSubview:locationInput];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2; //2 static cells
}


@end
