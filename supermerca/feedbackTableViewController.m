//
//  feedbackTableViewController.m
//  supermercacom
//
//  Created by azarateo on 1/06/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "feedbackTableViewController.h"
#import <Parse/Parse.h>

@interface feedbackTableViewController ()

@end

@implementation feedbackTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFQuery *query = [PFQuery queryWithClassName:@"comerciante"];
    [query whereKey:@"nombre" notEqualTo:@""];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Comerciantes encontrados %lu", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                
            }
            objetos = [NSMutableArray arrayWithArray:objects];
            NSLog(@"Número de objetos en arreglo objetos: %lu", (unsigned long)objetos.count);
            
            /*for (int i = 0; i < objetos.count; i++){
                NSLog(@"Resultados: %@", [objetos objectAtIndex:i]);
            }*/
            
            [tabla reloadData];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [objetos count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *celda = [tableView dequeueReusableCellWithIdentifier:@"comerciante" forIndexPath:indexPath];
    
    PFObject *eldato = [objetos objectAtIndex:indexPath.row];
    
    //NSString *objectId = [eldato objectId] == nil ? @"" : [NSString stringWithString:[eldato objectId]];
    NSString *nombre = [eldato objectForKey:@"nombre"] == nil ? @"" : [NSString stringWithString:[eldato objectForKey:@"nombre"]];
    NSString *apellido = [eldato objectForKey:@"apellido"] == nil ? @"" : [NSString stringWithString:[eldato objectForKey:@"apellido"]];
    //NSString *direccion = [eldato objectForKey:@"direccion"] == nil ? @"" : [NSString stringWithString:[eldato objectForKey:@"direccion"]];
    //NSString *local = [eldato objectForKey:@"local"] == nil ? @"" : [NSString stringWithString:[eldato objectForKey:@"local"]];
    //NSString *telefono = [eldato objectForKey:@"telefono"] == nil ? @"" : [NSString stringWithString:[eldato objectForKey:@"telefono"]];
    //NSString *celular = [eldato objectForKey:@"celular"] == nil ? @"" : [NSString stringWithString:[eldato objectForKey:@"celular"]];
    NSString *califclientes = [eldato objectForKey:@"califclientes"] == nil ? @"" : [NSString stringWithString:[eldato objectForKey:@"califclientes"]];
    NSString *califtrans = [eldato objectForKey:@"califtrans"] == nil ? @"" : [NSString stringWithString:[eldato objectForKey:@"califtrans"]];
    //NSString *nombre = [eldato objectForKey:@"nombre"];
    
    
   // NSString *detalle = [NSString stringWithFormat:@"Calificaciones: Clientes: %@ Transportadores: %@",califclientes,califtrans];
    NSString *nombrecom =  [NSString stringWithFormat:@" %@ %@",nombre,apellido];
    NSLog(@"Nombre: %@",nombrecom);
    [[celda textLabel] setText:nombrecom];
    //celda.detailTextLabel.text = detalle;
    return celda;
    
}



#pragma mark - Navegacion al detalle después de seleccionar la fila


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([sender isKindOfClass:[UITableViewCell class]]){
        NSIndexPath *indice = [tabla indexPathForCell:sender];
        if(indice){
            if([segue.identifier isEqualToString:@"feedbackDetail"]){
                if([segue.destinationViewController isKindOfClass:[feedbackDetailViewController class]]){
                    
                    //Variables para el detalle
                    NSString *elnombre = [[objetos objectAtIndex:indice.row] objectForKey:@"nombre"];
                    NSLog(@"elnombre ...%@",elnombre);
                    NSString *elapellido = [[objetos objectAtIndex:indice.row] objectForKey:@"apellido"];
                    NSString *laDireccion = [[objetos objectAtIndex:indice.row] objectForKey:@"direccion"];
                    NSString *ellocal = [[objetos objectAtIndex:indice.row] objectForKey:@"local"];
                    NSString *eltelefono = [[objetos objectAtIndex:indice.row] objectForKey:@"telefono"];
                    NSString *elcelular = [[objetos objectAtIndex:indice.row] objectForKey:@"celular"];
                    NSString *laCalifClientes = [[objetos objectAtIndex:indice.row] objectForKey:@"califclientes"];
                    NSString *laCalifTrans = [[objetos objectAtIndex:indice.row] objectForKey:@"califtrans"];

                    
                    //Configurar la vista de detalle
                    feedbackDetailViewController *vistaDestino = segue.destinationViewController;
                    [self configuraVista:vistaDestino conNombre:elnombre apellido:elapellido direccion:laDireccion local:ellocal telefono:eltelefono celular:elcelular califclientes:laCalifClientes califtrans:laCalifTrans];
                }
            }
        }
    }
    
}


-(void)configuraVista:(feedbackDetailViewController *)vista
      conNombre:(NSString *)elNombre
             apellido:(NSString *)elApellido
         direccion:(NSString *)laDireccion
             local:(NSString *)elLocal
               telefono:(NSString *)elTelefono
                celular:(NSString *)elCelular
              califclientes:(NSString *)laCalifClientes
        califtrans:(NSString *)laCalifTrans

{
    
    vista.nombre = elNombre;
    vista.apellido = elApellido;
    vista.direccion = laDireccion;
    vista.local = elLocal;
    vista.telefono = elTelefono;
    vista.celular = elCelular;
    vista.califclientes = laCalifClientes;
    vista.califtrans = laCalifTrans;

}





@end
