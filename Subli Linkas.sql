DROP DATABASE IF EXISTS SubliLinkas;
CREATE DATABASE SubliLinkas;
USE SubliLinkas;

-- Tabla Producto
CREATE TABLE Producto (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    imagen VARCHAR(200),
    stock INT NOT NULL
);

-- Tabla Cliente
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    direccion VARCHAR(200),
    correo_electronico VARCHAR(200),
    telefono VARCHAR(20)
);

-- Tabla Factura
CREATE TABLE Factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    fecha_emision DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

-- Tabla CategoriaProducto
CREATE TABLE CategoriaProducto (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT
);

-- Tabla Empleado
CREATE TABLE Empleado (
    id_empleado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    cargo VARCHAR(100),
    salario DECIMAL(10, 2) NOT NULL
);

-- Tabla Proveedor
CREATE TABLE Proveedor (
    id_proveedor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(200) NOT NULL,
    direccion VARCHAR(200),
    contacto VARCHAR(20)
);

-- Tabla Venta
CREATE TABLE Venta (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_empleado INT,
    fecha DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

-- Tabla FacturaProducto
CREATE TABLE FacturaProducto (
    id_factura INT,
    id_producto INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_factura) REFERENCES Factura(id_factura),
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    PRIMARY KEY (id_factura, id_producto)
);

-- Tabla ProductoCategoria
CREATE TABLE ProductoCategoria (
    id_producto INT,
    id_categoria INT,
    FOREIGN KEY (id_producto) REFERENCES Producto(id_producto),
    FOREIGN KEY (id_categoria) REFERENCES CategoriaProducto(id_categoria),
    PRIMARY KEY (id_producto, id_categoria)
);

-- Insertar datos
INSERT INTO Producto (nombre, descripcion, precio, imagen, stock) 
VALUES 
('Camiseta', 'Camiseta con frase personalizada', 20000.00, 'camiseta.jpg', 20),
('Taza', 'Taza de cerámica blanca sublimada', 10000.00, 'taza.jpg', 25),
('Bolso', 'Bolso de equipo de fútbol', 33000.00, 'bolso.jpg', 26);

INSERT INTO Cliente (nombre, direccion, correo_electronico, telefono) 
VALUES 
('Juan Rodriguez', 'Calle 123, Barrio El Rincón', 'juan@gmail.com', '3002001234'),
('María Gómez', 'Avenida 46, Ciudad Bolívar', 'maria@gmail.com', '3011230908');

INSERT INTO CategoriaProducto (nombre, descripcion) 
VALUES 
('Ropa', 'Prendas de vestir personalizadas'),
('Hogar', 'Productos sublimados para el hogar'),
('Bolsos', 'Bolsos sublimados');

INSERT INTO Empleado (nombre, cargo, salario) 
VALUES 
('Carlos López', 'Vendedor', 1200000.00),
('Ana Torres', 'Gerente', 1200000.00);

INSERT INTO Proveedor (nombre, direccion, contacto) 
VALUES 
('Proveedor X', 'Unicentro', '3097778899'),
('Proveedor Y', 'Gran San', '3112347878');

INSERT INTO Factura (id_cliente, fecha_emision, total) 
VALUES 
(1, '2024-10-24', 60000.00),
(2, '2024-10-24', 40000.00);

INSERT INTO Venta (id_empleado, fecha, total) 
VALUES 
(1, '2024-10-24', 60000.00),
(2, '2024-10-24', 90000.00);

INSERT INTO FacturaProducto (id_factura, id_producto, cantidad, precio_unitario) 
VALUES 
(1, 1, 2, 20000.00), -- 2 camisetas en la factura 1
(1, 2, 1, 10000.00),  -- 1 taza en la factura 1
(2, 3, 3, 33000.00); -- 3 bolsos en la factura 2

INSERT INTO ProductoCategoria (id_producto, id_categoria) 
VALUES 
(1, 1), -- Camiseta en la categoría Ropa
(2, 2), -- Taza en la categoría Hogar
(3, 3); -- Bolso en la categoría Bolsos

SELECT * FROM Producto;
SELECT * FROM Cliente;
SELECT * FROM Factura;
SELECT * FROM CategoriaProducto;
SELECT * FROM Empleado;
SELECT * FROM Proveedor;
SELECT * FROM Venta;
SELECT * FROM FacturaProducto;
SELECT * FROM ProductoCategoria;
