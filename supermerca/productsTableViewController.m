//
//  productsTableViewController.m
//  supermercacom
//
//  Created by azarateo on 31/05/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "productsTableViewController.h"

#pragma mark - Configuracion de constantes

#define URL_DE_DESCARGA @"http://servicedatosabiertoscolombia.cloudapp.net/v1/corabastos/boletinprecios?$format=json&"//Url para la descarga del JSON
#define VARIABLE_DE_DATOS_EN_JSON @"d"//Variable que contiene el arreglo que se mostrará en la tabla
#define IDENTIFICADOR_DE_CELDA @"productsResult"//Cadena para identificar el tipo de celda
#define ELEMENTO_ARREGLO_PARA_TIPO_PRODUCTO @"tipoproducto"//Nombre de la llave que tiene los datos de título
#define ELEMENTO_ARREGLO_PARA_PRODUCTO @"producto"//Nombre de la llave que tiene los datos del subtítulo
#define ELEMENTO_ARREGLO_PARA_PRESENTACION @"presentacion"
#define ELEMENTO_ARREGLO_PARA_CANTIDAD @"cantidad"
#define ELEMENTO_ARREGLO_PARA_UNIDAD @"unidad"
#define ELEMENTO_ARREGLO_PARA_EXTRA @"preciocalidadextra"
#define ELEMENTO_ARREGLO_PARA_PRIMERA @"preciocalidadprimera"





@implementation productsTableViewController

#pragma mark - Conneccion y descarga de datos

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;//Indica al usuario que los datos estan cargando
    
    //Creación de la conexión para la descarga de datos
    NSURL *url = [NSURL URLWithString:URL_DE_DESCARGA];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    coneccion = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Se recibió respuesta del servidor...");
    datos = [[NSMutableData alloc] init];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //NSLog(@"descargando datos...");
    [datos appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"Terminó la carga de datos");
    NSDictionary *diccionarioInicial = [NSJSONSerialization JSONObjectWithData:datos options: 0 error:NULL];
    NSArray *arregloDelDiccionariodeDatos = [diccionarioInicial valueForKeyPath:VARIABLE_DE_DATOS_EN_JSON];
    //NSLog(@"Datos del arreglo de a partir del diccionario %@",arregloDelDiccionariodeDatos);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    arregloDatos = [NSMutableArray arrayWithArray:arregloDelDiccionariodeDatos];
    [tablaDatos reloadData];
    
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Falló la conexión");
    NSLog(@"Error:%@",[error debugDescription]);
    UIAlertView *vistaError = [[UIAlertView alloc] initWithTitle:@"Error de conexión" message:@"Error en la descarga de datos" delegate:nil cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
    [vistaError show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"Alerta de memoria");
}

#pragma mark - Configuración de datos para la tabla

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arregloDatos count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:IDENTIFICADOR_DE_CELDA forIndexPath:indexPath];
    NSString *titulo = [[arregloDatos objectAtIndex:indexPath.row] objectForKey:ELEMENTO_ARREGLO_PARA_TIPO_PRODUCTO];
    NSString *subtitulo = [[arregloDatos objectAtIndex:indexPath.row] objectForKey:ELEMENTO_ARREGLO_PARA_PRODUCTO];
    /*NSString *subtitulo2 = [NSString stringWithFormat:@" %@ %@",
                            [[arregloDatos objectAtIndex:indexPath.row] objectForKey:ELEMENTO_ARREGLO_PARA_PRESENTACION],
                            [[arregloDatos objectAtIndex:indexPath.row] objectForKey:ELEMENTO_ARREGLO_PARA_CANTIDAD]
                            ];*/
    cell.textLabel.text = titulo;
    cell.detailTextLabel.text = subtitulo;
    
    return cell;
}

#pragma mark - Navegacion al detalle después de seleccionar la fila


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([sender isKindOfClass:[UITableViewCell class]]){
        NSIndexPath *indice = [tablaDatos indexPathForCell:sender];
        if(indice){
            if([segue.identifier isEqualToString:@"detalleProducto"]){
                if([segue.destinationViewController isKindOfClass:[productsDetailViewController class]]){
                    
                    //Variables para el detalle
                    NSString *elTipoProducto = [[arregloDatos objectAtIndex:indice.row] objectForKey:ELEMENTO_ARREGLO_PARA_TIPO_PRODUCTO];
                    NSString *elProducto = [[arregloDatos objectAtIndex:indice.row] objectForKey:ELEMENTO_ARREGLO_PARA_PRODUCTO];
                    NSString *laPresentacion = [[arregloDatos objectAtIndex:indice.row] objectForKey:ELEMENTO_ARREGLO_PARA_PRESENTACION];
                    NSString *laCantidad = [[arregloDatos objectAtIndex:indice.row] objectForKey:ELEMENTO_ARREGLO_PARA_CANTIDAD];
                    NSString *laUnidad = [[arregloDatos objectAtIndex:indice.row] objectForKey:ELEMENTO_ARREGLO_PARA_UNIDAD];
                    NSString *pExtra = [[arregloDatos objectAtIndex:indice.row] objectForKey:ELEMENTO_ARREGLO_PARA_EXTRA];
                    NSString *pPrimera = [[arregloDatos objectAtIndex:indice.row] objectForKey:ELEMENTO_ARREGLO_PARA_PRIMERA];
                    
                    //Configurar la vista de detalle
                    productsDetailViewController *vistaDestino = segue.destinationViewController;
                    [self configuraVista:vistaDestino conTipoProducto:elTipoProducto Producto:elProducto Presentacion:laPresentacion Cantidad:laCantidad Unidad:laUnidad Extra:pExtra Primera:pPrimera];
                }
            }
        }
    }
    
}


-(void)configuraVista:(productsDetailViewController *)vista
            conTipoProducto:(NSString *)elTipoProducto
             Producto:(NSString *)elProducto
         Presentacion:(NSString *)laPresentacion
             Cantidad:(NSString *)laCantidad
               Unidad:(NSString *)laUnidad
                Extra:(NSString *)pExtra
              Primera:(NSString *)pPrimera

{
    
    vista.tipoProducto = elTipoProducto;
    vista.producto = elProducto;
    vista.presentacion = laPresentacion;
    vista.cantidad = laCantidad;
    vista.unidad = laUnidad;
    vista.extra = pExtra;
    vista.primera = pPrimera;
}





@end