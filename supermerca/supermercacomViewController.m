//
//  supermercacomViewController.m
//  supermerca
//
//  Created by azarateo on 1/06/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "supermercacomViewController.h"
#import <Parse/Parse.h>


@interface supermercacomViewController ()

@end

@implementation supermercacomViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation addUniqueObject:@"collectionists" forKey:@"channels"];
    [currentInstallation saveInBackground];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
