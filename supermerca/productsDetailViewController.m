//
//  productsDetailViewController.m
//  supermercacom
//
//  Created by azarateo on 31/05/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "productsDetailViewController.h"

@interface productsDetailViewController ()

@end

@implementation productsDetailViewController
@synthesize tipoProducto;
@synthesize producto;
@synthesize presentacion;
@synthesize cantidad;
@synthesize unidad;
@synthesize extra;
@synthesize primera;

@synthesize labelTipoProducto;
@synthesize labelProducto;
@synthesize labelPresentacion;
@synthesize labelCantidad;
@synthesize labelUnidad;
@synthesize labelExtra;
@synthesize labelPrimera;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self actualizarUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) actualizarUI{
    self.labelTipoProducto.text = tipoProducto;
    self.labelProducto.text = producto;
    self.labelPresentacion.text = presentacion;
    self.labelCantidad.text = cantidad;
    self.labelUnidad.text = unidad;
    self.labelExtra.text = extra;
    self.labelPrimera.text = primera;
    

    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
