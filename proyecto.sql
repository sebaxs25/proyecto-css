create database proyectointegrador;

create table producto (
	id_producto int,
	constraint PK_id_producto primary key (id_producto),
	id_proveedorFK int,
	constraint FK_id_proveedor foreign key (id_proveedorFK) references proveedor (id_proveedor),
 	nom_producto varchar (30),
	precio int, 
	categoria_proc varchar (20)
);


create table cliente (
	id_cliente int, 
	constraint PK_id_cliente primary key (id_cliente),
	nom_cliente varchar (15) not null,
	ape_cliente varchar (30)  not null,
	direccion varchar (30)  not null, 
	cuidad varchar (30)  not null, 
	pais varchar (20)  not null,
	correo varchar (35) ,
	constraint UQ_cliente_correo unique (correo),
	telefono int
);

create table proveedor ( 
	id_proveedor int,
	constraint PK_id_proveedor primary key (id_proveedor),
	nom_proveedor varchar (15) not null,
	ape_proveedor varchar (30)  not null,
	direccion varchar (30)  not null, 
	ciudad varchar (30)  not null, 
	pais varchar (20)  not null,
	correo varchar (35) ,
	constraint UQ_proveedor_correo unique (correo),
	telefono int
);

create table pedido (
	cod_pedido int,
	constraint PK_cod_pedido primary key (cod_pedido),
	id_productoFK int, 
	constraint FK_id_producto foreign key (id_productoFK) references producto (id_producto),
	id_clienteFK int,
	constraint FK_id_cliente foreign key (id_clienteFK) references cliente (id_cliente),
	fecha_pedido date,
	fecha_envio date,
	cantidad_pedido smallint,
	metodo_pago varchar (25),
	estado_pedido varchar (30)
);







bulk insert cliente from 'C:\Users\sebas\Downloads\cliente - Hoja 1.tsv' with (firstrow = 2);
bulk insert proveedor from 'C:\Users\sebas\Downloads\proveedor - Hoja 1.tsv'with (firstrow = 2);
bulk insert producto from 'C:\Users\sebas\Downloads\producto - Hoja 1.tsv'with (firstrow = 2);
bulk insert pedido from 'C:\Users\sebas\Downloads\pedido - Hoja 1.tsv'with (firstrow = 2);
select * from cliente;
select * from proveedor;
select * from producto;
select * from pedido;