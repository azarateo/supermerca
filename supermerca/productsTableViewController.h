//
//  productsTableViewController.h
//  supermercacom
//
//  Created by azarateo on 31/05/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "productsDetailViewController.h"

@interface productsTableViewController : UITableViewController{
    
    NSMutableData *datos;
    NSMutableArray *arregloDatos;
    NSURLConnection *coneccion;
    IBOutlet UITableView *tablaDatos;
    
    
}


@end
