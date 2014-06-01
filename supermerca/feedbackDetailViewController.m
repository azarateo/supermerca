//
//  feedbackDetailViewController.m
//  supermercacom
//
//  Created by azarateo on 1/06/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "feedbackDetailViewController.h"

@interface feedbackDetailViewController ()

@end

@implementation feedbackDetailViewController

@synthesize nombre;
@synthesize apellido;
@synthesize direccion;
@synthesize local;
@synthesize telefono;
@synthesize celular;
@synthesize califclientes;
@synthesize califtrans;

@synthesize labelNombre;
@synthesize labelDirecionLocal;
@synthesize labelTelefonos;
@synthesize labelCalifClientes;
@synthesize labelCalifTrans;



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self actualizarUI];
    // Do any additional setup after loading the view.
}

-(void) actualizarUI{
    self.labelNombre.text = [NSString stringWithFormat:@"%@ %@",nombre,apellido];
    self.labelDirecionLocal.text = [NSString stringWithFormat:@"%@ - %@",direccion,local];
    self.labelTelefonos.text = [NSString stringWithFormat:@"%@,%@",telefono,celular];
    self.labelCalifClientes.text = [NSString stringWithFormat:@"%@",califclientes];
    self.labelCalifTrans.text = [NSString stringWithFormat:@"%@",califtrans];
    
    
    
    
}


@end
