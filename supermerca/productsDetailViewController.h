//
//  productsDetailViewController.h
//  supermercacom
//
//  Created by azarateo on 31/05/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface productsDetailViewController : UIViewController
@property (strong, nonatomic) NSString *tipoProducto;
@property (strong, nonatomic) NSString *producto;
@property (strong, nonatomic) NSString *presentacion;
@property (strong, nonatomic) NSString *cantidad;
@property (strong, nonatomic) NSString *unidad;
@property (strong, nonatomic) NSString *extra;
@property (strong, nonatomic) NSString *primera;

@property (weak, nonatomic) IBOutlet UILabel *labelTipoProducto;
@property (weak, nonatomic) IBOutlet UILabel *labelProducto;
@property (weak, nonatomic) IBOutlet UILabel *labelPresentacion;
@property (weak, nonatomic) IBOutlet UILabel *labelCantidad;
@property (weak, nonatomic) IBOutlet UILabel *labelUnidad;
@property (weak, nonatomic) IBOutlet UILabel *labelExtra;
@property (weak, nonatomic) IBOutlet UILabel *labelPrimera;





@end
