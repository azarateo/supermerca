//
//  feedbackDetailViewController.h
//  supermercacom
//
//  Created by azarateo on 1/06/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface feedbackDetailViewController : UIViewController
@property (strong, nonatomic) NSString *nombre;
@property (strong, nonatomic) NSString *apellido;
@property (strong, nonatomic) NSString *telefono;
@property (strong, nonatomic) NSString *celular;
@property (strong, nonatomic) NSString *placa;
@property (strong, nonatomic) NSString *capacidad;
@property (strong, nonatomic) NSString *califclientes;
@property (strong, nonatomic) NSString *califtrans;

@property (weak, nonatomic) IBOutlet UILabel *labelNombre;
@property (weak, nonatomic) IBOutlet UILabel *labelDirecionLocal;
@property (weak, nonatomic) IBOutlet UILabel *labelTelefonos;
@property (weak, nonatomic) IBOutlet UILabel *labelCalifClientes;
@property (weak, nonatomic) IBOutlet UILabel *labelCalifTrans;


@end
