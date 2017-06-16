DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS suppliers;

CREATE TABLE suppliers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null
);

CREATE TABLE products (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  quantity INT2,
  supplier_id INT8 REFERENCES suppliers(id)
);