CREATE DATABASE IF NOT EXISTS zapateriadb;
USE zapateriadb;
CREATE TABLE IF NOT EXISTS Articulo(
  Id_articulo INT (4) NOT NULL AUTO_INCREMENT,
  Tipo VARCHAR(30) NOT NULL,
  Material VARCHAR(30) NOT NULL,
  Talla FLOAT NOT NULL,
  Precio FLOAT NOT NULL,
  PRIMARY KEY (Id_articulo)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Usuario(
  Id_usuario INT (4) NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(60) NOT NULL,
  Puesto VARCHAR(40) NOT NULL,
  Edad INT (4) NOT NULL,
  Telefono VARCHAR (20) NOT NULL,
  Direccion VARCHAR(80) NOT NULL,
  PRIMARY KEY (Id_usuario)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Inventario(
  Id_inventario INT (4) NOT NULL AUTO_INCREMENT,
  Tipo VARCHAR(30) NOT NULL,
  Material VARCHAR(30) NOT NULL,
  Talla VARCHAR(10) NOT NULL,
  Precio FLOAT NOT NULL,
  Ubicacion VARCHAR(30) NOT NULL,
  Descripcion VARCHAR(40) NOT NULL,
  PRIMARY KEY (Id_inventario)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Proveedor(
  Id_proveedor INT(4) NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(60) NOT NULL,
  Telefono VARCHAR(20) NOT NULL,
  Direccion VARCHAR(80) NOT NULL,
  CorreoElectronico VARCHAR(60) NOT NULL,
  PRIMARY KEY (Id_proveedor)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Cliente(
  Id_cliente INT (4) NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(60) NOT NULL,
  Telefono VARCHAR(20) NOT NULL,
  Direccion VARCHAR(80) NOT NULL,
  PRIMARY KEY(Id_cliente)
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Coste(
  Id_coste INT(4) NOT NULL AUTO_INCREMENT,
  Motivo VARCHAR(40) NOT NULL,
  Fecha VARCHAR(30) NOT NULL,
  Cantidad INT(10) NOT NULL,
  Cantidad_gastada FLOAT NOT NULL,
  Id_proveedor INT(4) NOT NULL,
  Id_usuario INT(4) NOT NULL,
  PRIMARY KEY (Id_coste),
  INDEX coste_proveedor (Id_proveedor ASC),
  INDEX coste_usuario (Id_usuario ASC),
  CONSTRAINT coste_proveedor 
  	FOREIGN KEY (Id_proveedor)
  	REFERENCES Proveedor(Id_proveedor)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT coste_usuario
    FOREIGN KEY (Id_usuario)
    REFERENCES Usuario(Id_usuario)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Pedido(
  Id_pedido INT(4) NOT NULL AUTO_INCREMENT,
  Cantidad INT(4) NOT NULL,
  Fecha_pedido VARCHAR(30) NOT NULL,
  Id_cliente INT(4) NOT NULL,
  Id_articulo INT(4) NOT NULL,
  PRIMARY KEY (Id_pedido),
  INDEX pedido_cliente (Id_cliente ASC),
  INDEX pedido_articulo (Id_articulo ASC),
  CONSTRAINT pedido_cliente
    FOREIGN KEY (Id_cliente)
    REFERENCES Cliente(Id_cliente)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT pedido_articulo
    FOREIGN KEY(Id_articulo)
    REFERENCES Articulo(Id_articulo)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Venta(
  Id_venta INT(4) NOT NULL AUTO_INCREMENT,
  Fecha_venta VARCHAR(30) NOT NULL,
  Id_pedido INT(4) NOT NULL,
  Id_usuario INT(4) NOT NULL,
  PRIMARY KEY(Id_venta),
  INDEX venta_pedido (Id_pedido ASC),
  INDEX venta_usuario (Id_usuario ASC),
  CONSTRAINT venta_pedido
    FOREIGN	KEY (Id_pedido)
    REFERENCES Pedido (Id_pedido)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT venta_usuario
    FOREIGN KEY (Id_usuario)
    REFERENCES Usuario(Id_usuario)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)
ENGINE=InnoDB;