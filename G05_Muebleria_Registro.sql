CREATE DATABASE Muebleria_Registro
DEFAULT CHARACTER SET UTF8MB4;
/* Usando la base de datos */

USE Muebleria_Registro;
/* Creando las tablas */
CREATE table Ubigeo(
	Cod_Ubigeo INT AUTO_INCREMENT,
	Departamento VARCHAR(40) NOT NULL,
	Provincia VARCHAR(60) NOT NULL,
    Distrito VARCHAR(60) NOT NULL,
	PRIMARY KEY (Cod_Ubigeo)
);

INSERT INTO Ubigeo (Cod_Ubigeo , Departamento , Provincia, Distrito)
VALUES ('1', 'Puno' , 'Puno' , 'acora'),
	   ('2', 'Tacna' , 'Tacna' , 'Calana'),
	   ('3', 'Pasco' , 'Huachon' , 'Pasco'),
       ('4', 'Lima' , 'Cañete' , 'San Vicente'),
       ('5', 'Lambayeque' , 'Chiclayo' , 'Jayanca'),
       ('6', 'Tumbes' , 'Tumbes' , 'La cruz'),
       ('7', 'Arequipa' , 'Provincia de Arequipa' , 'Characato'),
       ('8', 'Cajarma' , 'Yakanora' , 'Asuncion'),
       ('9', 'Piura' , 'Piura' , 'Castilla'),
       ('10', 'Apurimac' , 'Abancay' , 'Curasco');
       


CREATE table Cliente(
	Id_Cliente INT AUTO_INCREMENT,
    Cod_Ubigeo INT,
	Nombre VARCHAR(30),
	Ap_Paterno VARCHAR(25),
    Ap_Materno VARCHAR(25),
    Telefono char(9),
	PRIMARY KEY (Id_Cliente),
	foreign key (Cod_Ubigeo) references Ubigeo(Cod_Ubigeo)
);

INSERT INTO Cliente (Id_Cliente  ,  Cod_Ubigeo , Nombre , Ap_Paterno,Ap_Materno,Telefono)
VALUES 
 ('1', '1' , 'Erika' , 'Antolin','Sacristan','952748598'),
 ('2', '2' , 'Gustavo' , 'San Juan','Pelaez','946163121'),
 ('3', '3' , 'Yassin' , 'Perera','Bernal','956583225'),
 ('4', '4' , 'Cayetano' , 'Roman','Pizarro','951114002'),
 ('5', '5' , 'Ane' , 'Cuellar','Perera','945576168'),
 ('6', '6' , 'Xavi' , 'Diez','Gómez','973205837'),
 ('7', '7' , 'Paloma' , 'Estevez','Levano','909517606'),
 ('8', '8' , 'Anas' , 'Echeverria','Vergara','940520358'),
 ('9', '9' , 'Regina' , 'Hurtado','Ceballos','963869952'),
 ('10', '10' , 'Igor' , 'Bosch','Blasco','964836432');


CREATE table Empleado(
	Id_Empleado INT AUTO_INCREMENT,
    Id_Cliente 	INT,
	Cod_Ubigeo INT,
    Nombre VARCHAR(30),
	Ap_Paterno VARCHAR(30),
    Ap_Materno VARCHAR(30),
    Telefono char(9),
    Horario VARCHAR(10),
	PRIMARY KEY (Id_Empleado),
    foreign key (Cod_Ubigeo) references Ubigeo(Cod_Ubigeo),
    foreign key (Id_Cliente) references Cliente(Id_Cliente)
);

INSERT INTO Empleado (Id_Empleado  , Id_Cliente , Cod_Ubigeo  , Nombre ,Ap_Paterno, Ap_Materno,Telefono,Horario)
VALUES 
('1', '1' , '7' , 'Elizabeth','Taboada','Rocha','975640432','madrugada'),
('2', '2' , '5' , 'Simon','Robles','Borja','907657434','noche'),
('3', '3' , '2' , 'Otilia','Wang','Sempere','966178574','tarde'),
('4', '4' , '1' , 'Consuelo','Jimenes','Ladrillo','973654236','tarde'),
('5', '5' , '9' , 'Noah','Cereza','Yataco','950430445','madrugada'),
('6', '6' , '10' , 'Arantza','Contreras','Ramon','988331212','mañana'),
('7', '7' , '3' , 'Herminio','Caparros','Carhuancho','996256017','mañana'),
('8', '8' , '4' , 'Arnold','Moreno','Gimenez','904727424','tarde'),
('9', '9' , '6' , 'Blas','Rosas','Paez','902716226','tarde'),
('10', '10' , '8' , 'Myriam','Herraiz','Vilca','904827539','noche');

CREATE table Pedido(
	Id_Pedido INT AUTO_INCREMENT,
    Id_Cliente 	INT,
	Id_Empleado INT,
    Precio float,
	Nombre VARCHAR(30),
    Cantidad int,
	PRIMARY KEY (Id_Pedido),
    foreign key (Id_Cliente) references Cliente(Id_Cliente),
    foreign key (Id_Empleado) references Empleado(Id_Empleado)
);

INSERT INTO Pedido (Id_Pedido , Id_Cliente , Id_Empleado, Precio,Nombre,Cantidad)
VALUES 
('1', '1' , '1' , '726.90','PedidoEnTienda','1'),
('2', '2' , '2' , '856.40','PedidoDelivery','3'),
('3', '3' , '3' , '1282.45','PedidoEnTienda','3'),
('4', '4' , '4' , '893.20','PedidoEnTienda','1'),
('5', '5' , '5' , '4782.30','PedidoDelivery','4'),
('6', '6' , '6' , '632.00','PedidoDeliverry','2'),
('7', '7' , '7' , '382.30','PedidoDelivery','1'),
('8', '8' , '8' , '8273.42','PedidoEnTienda','5'),
('9', '9' , '9' , '281.60','PedidoEnTienda','1'),
('10', '10' , '10' , '2046.00','PedidoDelivery','2');

CREATE table Venta(
	Codigo_Venta INT AUTO_INCREMENT,
    Id_Pedido INT,
    Fecha DATE,
    Total float,
	PRIMARY KEY (Codigo_Venta),
    foreign key (Id_Pedido) references Pedido(Id_Pedido)
);

INSERT INTO Venta (Codigo_Venta , Id_Pedido , Fecha, Total)
VALUES 
('1', '1' , '23/07/21' , '726.90'),
('2', '2' , '16/07/21' , '856.40'),
('3', '3' , '21/07/21' , '1282.45'),
('4', '4' , '09/07/21' , '893.20'),
('5', '5' , '17/07/21' , '4782.30'),
('6', '6' , '03/07/21' , '120.00'),
('7', '7' , '20/07/21' , '382.30'),
('8', '8' , '27/07/21' , '8273.40'),
('9', '9' , '13/07/21' , '2046.00'),
('10', '10' , '15/07/21' , '281.60');

CREATE table Categoria(
	Codigo_Categoria INT AUTO_INCREMENT,
	Nombre VARCHAR (50),
	PRIMARY KEY (Codigo_Categoria)

);

INSERT INTO Categoria (Codigo_Categoria , Nombre)
VALUES 
 ('1',  'Terraza' ),
 ('2',  'Dormitorio' ),
 ('3',  'Cocina' ),
 ('4',  'Comedor'),
 ('5',  'Bar' ),
 ('6',  'Muebles' ),
 ('7',  'Sala-Comedor' ),
 ('8', 'Patio' ),
 ('9',  'Cuartos' ),
 ('10', 'Cuarto de Baño ' );

CREATE table Producto(
	Codigo_Producto INT AUTO_INCREMENT,
    Codigo_Categoria INT,
    Descripcion text,
    Nombre VARCHAR (50),
    Precio float,
	PRIMARY KEY (Codigo_Producto),
    foreign key (Codigo_Categoria) references Categoria(Codigo_Categoria)
);

INSERT INTO Producto (Codigo_Producto , Codigo_Categoria , Descripcion, Nombre, Precio)
VALUES 

('1', '1' , 'Cuerpo Davis Negro' ,'Sillón Reclinable','799.40'),
('2', '2' , 'Salamanca 6 Sillas Negro' ,'Juego de Comedor Extensible', '2330.60'),
('3', '3' , 'Estructura: Madera, Relleno: Espuma' ,'Seccional Intercambiable Bombai Gris', '1120.60'),
('4', '4' , 'Stubbe Negro/Roble','Mesa de TV 50"', '538.10'),
('5', '5' , 'Ahorra Espacio 4 Sillas Negro','Juego de Comedor', '2742.00'),
('6', '6' , 'Mueble de la coleción Lucia Milano Blanco','Centro De Entretenimiento 55"', '830.99'),
('7', '7' , '6 Puertas 6 Cajones color Cacao','Ropero Onda', '238.00'),
('8', '8' , '4 Puertas 3 Cajones + Espejo Blanco','Ropero Charlotte', '4840.10'),
('9', '9' , 'Sofas de estilo Vermont color Gris ' ,'Juego de Sala 3-2-1', '1362.50'),
('10', '10' , ' Plazas + Cabecera + 2 Veladores + 2 almohadas' ,'Dormitorio Vital Paraíso ', '645.27');

CREATE table Venta_Detalle(
	Codigo_VentaDetalle INT AUTO_INCREMENT,
    Codigo_Venta INT,
    Codigo_Producto int,
    Cantidad int,
    Precio int,
	PRIMARY KEY (Codigo_VentaDetalle),
    foreign key (Codigo_Venta) references Venta(Codigo_Venta),
    foreign key (Codigo_Producto) references Producto(Codigo_Producto)
);

INSERT INTO Venta_Detalle (Codigo_VentaDetalle , Codigo_Venta , Codigo_Producto, Cantidad,Precio)
VALUES 

('1', '1' , '1' , '1','726.90'),
('2', '2' , '2' , '2','856.40'),
('3', '3' , '3' , '2','1282.45'),
('4', '4' , '4' , '3','893.20'),
('5', '5' , '5' , '1','4782.30'),
('6', '6' , '6' , '1','8273.40'),
('7', '7' , '7' , '2','382.30'),
('8', '8' , '8' , '4','240.00'),
('9', '9' , '9' , '2','281.60'),
('10', '10' , '10' , '1','2046.00');

CREATE table Categoria_Producto(
	Codigo_CategoriaProducto INT AUTO_INCREMENT,
    Codigo_Categoria INT,
	Codigo_Producto INT,
    Seccion varchar(20),
	PRIMARY KEY (Codigo_CategoriaProducto),
    foreign key (Codigo_Categoria) references categoria(Codigo_Categoria),
    foreign key (Codigo_Producto) references Producto(Codigo_Producto)
);

INSERT INTO Categoria_Producto (Codigo_CategoriaProducto ,  Codigo_Categoria , Codigo_Producto , Seccion)
VALUES 
('1', '1' , '1' , 'Dormitorio'),
('2', '2' , '2' , 'Comedor'),
('3', '3' , '3' , 'Baño'),
('4', '4' , '4' , 'Terraza'),
('5', '5' , '5' , 'Interiores'),
('6', '6' , '6' , 'Exterior'),
('7', '7' , '7' , 'Cocina'),
('8', '8' , '8' , 'Terraza'),
('9', '9' , '9' , 'Exterior'),
('10', '10' , '10' , 'Dormitorio');

SELECT * FROM Ubigeo;
SELECT * FROM Cliente;
SELECT * FROM Empleado;
SELECT * FROM Pedido;
SELECT * FROM Venta;
SELECT * FROM Categoria;
SELECT * FROM Producto;
SELECT * FROM Venta_Detalle;
SELECT * FROM Categoria_Producto;