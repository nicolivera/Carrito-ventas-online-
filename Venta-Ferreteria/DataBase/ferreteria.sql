create database ferreteria;
use ferreteria;


CREATE TABLE admins (
  id int NOT NULL,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  name varchar(255) NOT NULL
);

INSERT INTO admins (id, username, password, name) VALUES(1, 'nikko', '123456', 'Nicolás');
INSERT INTO admins (id, username, password, name) VALUES(2, 'carla', '789', 'Salvador');
INSERT INTO admins (id, username, password, name) VALUES(3, 'fer', '3789', 'Fernando');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carro`
--

CREATE TABLE carro (
  id int primary key NOT NULL ,
  id_cliente int NOT NULL,
  id_producto int NOT NULL,
  cant int NOT NULL
); 

alter table carro
add foreign key (id_cliente) references clientes (id);

alter table carro
add foreign key (id_producto) references productos (id);
--
-- Volcado de datos para la tabla `carro`
--

exec sp_carro 2, 2, 1, 3;
exec sp_carro 1, 2, 2, 10;
exec sp_carro 3, 2, 4, 7;
exec sp_carro 4, 1, 5, 2;
exec sp_carro 5, 3, 5, 4;

select * from carro
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE categorias (
  id int primary key NOT NULL,
  categoria varchar(255) NOT NULL
);

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO categorias (id, categoria) VALUES(1, 'Tecnologia');
INSERT INTO categorias (id, categoria)VALUES(2, 'Construccion');
INSERT INTO categorias (id, categoria)VALUES(3, 'Iluminacion');
INSERT INTO categorias (id, categoria)VALUES(4, 'Pinturas');
INSERT INTO categorias (id, categoria)VALUES(5, 'Jardineria');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE clientes (
  id int primary key NOT NULL,
  username varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  name varchar(255) NOT NULL
); 

insert into clientes values(1, 'colo', '1234', 'Gonzalo');
insert into clientes values(2, 'negra', '14234', 'Jesica');
insert into clientes values(3, 'ghostrider', 'sad1234', 'Horacio');
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE compra (
  id int primary key NOT NULL,
  id_cliente int NOT NULL,
  fecha datetime NOT NULL,
  monto float NOT NULL,
  estado int NOT NULL
); 

alter table compra
add foreign key (id_cliente) references clientes (id);

insert into compra values(1, 1, 1993-05-22, 12000, 1);
insert into compra values(3, 2, 1994-12-12, 2000, 2);
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE pagos(
  id int primary key NOT NULL,
  id_cliente int NOT NULL,
  id_compra int NOT NULL,
  comprobante varchar(255) NOT NULL,
  nombre varchar(50) NOT NULL,
  fecha datetime NOT NULL,
 estado int NOT NULL
) ;

alter table pagos
add foreign key (id_cliente) references clientes (id);

alter table pagos
add foreign key (id_compra) references compra (id);

insert into pagos values(1, 1, 1, 'sdasda', 'aaaaa', 2002-08-15, 2 );


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE productos (
  id int primary key NOT NULL,
  price float NOT NULL,
  imagen varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  id_categoria int NOT NULL,
  oferta int NOT NULL,
  descargable varchar(255) NOT NULL
) ;


alter table productos
add foreign key (id_categoria) references categorias (id);
--
-- Volcado de datos para la tabla `productos`
--


INSERT INTO productos (id, price, imagen, name, id_categoria, oferta, descargable) VALUES(1, 3250, 'Amoladora.png', 'Amoladora', 3, 0, '');
INSERT INTO productos (id, price, imagen, name, id_categoria, oferta, descargable) VALUES(2, 350, 'Fotocélula.png', 'Fotocélula', 3, 0, '');
INSERT INTO productos (id, price, imagen, name, id_categoria, oferta, descargable) VALUES(4, 200, 'maza.png', 'Maza', 3, 50, '');
INSERT INTO productos (id, price, imagen, name, id_categoria, oferta, descargable) VALUES(5, 960, 'pintura-latex-interior-x-10-litros-nicsol.png', 'Latex10ltsNicsol', 3, 10, '');
INSERT INTO productos (id, price, imagen, name, id_categoria, oferta, descargable) VALUES(7, 950, 'reflector-led-blanco-50w-bajo-consumo.png', 'Reflector500', 0, 0, '');

select * from productos
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_compra`
--

CREATE TABLE productos_compra (
  id int primary key NOT NULL,
  id_compra int NOT NULL,
  id_producto int NOT NULL,
  cantidad int NOT NULL,
  monto float NOT NULL
) ;

alter table productos_compra
add foreign key (id_compra) references compra (id);
alter table productos_compra
add foreign key (id_producto) references productos (id);

--
-- Volcado de datos para la tabla `productos_compra`
--

INSERT INTO productos_compra (id, id_compra, id_producto, cantidad, monto) VALUES(1, 3, 5, 7, 400);
INSERT INTO productos_compra (id, id_compra, id_producto, cantidad, monto) VALUES(2, 3, 4, 4, 1000);
INSERT INTO productos_compra (id, id_compra, id_producto, cantidad, monto) VALUES(3, 3, 3, 4, 1200);
INSERT INTO productos_compra (id, id_compra, id_producto, cantidad, monto) VALUES(4, 3, 2, 4, 200);
INSERT INTO productos_compra (id, id_compra, id_producto, cantidad, monto) VALUES(5, 3, 1, 4, 1000);
INSERT INTO productos_compra (id, id_compra, id_producto, cantidad, monto) VALUES(6, 4, 5, 1, 400);
INSERT INTO productos_compra (id, id_compra, id_producto, cantidad, monto) VALUES(7, 4, 7, 1, 1000);
INSERT INTO productos_compra (id, id_compra, id_producto, cantidad, monto) VALUES(8, 5, 5, 1, 400);
INSERT INTO productos_compra (id, id_compra, id_producto, cantidad, monto) VALUES(9, 5, 4, 1, 1000);
INSERT INTO productos_compra (id, id_compra, id_producto, cantidad, monto) VALUES(10, 5, 7, 1, 1000);



create procedure sp_carro(
@id int,
@id_cliente int,
@id_producto int,
@cant int
)
as
begin
   insert into carro(id, id_cliente, id_producto, cant)values(@id, @id_cliente, @id_producto, @cant)
end;

