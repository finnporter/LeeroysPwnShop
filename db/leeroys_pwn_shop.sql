DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS types;
DROP TABLE IF EXISTS suppliers;

CREATE TABLE suppliers (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  location VARCHAR(255),
  picture TEXT
);

CREATE TABLE types (
  id SERIAL8 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE products (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) not null,
  type VARCHAR(255),
  quantity INT2,
  buy_price INT2,
  sell_price INT2,
  supplier_id INT8 REFERENCES suppliers(id) ON DELETE CASCADE,
  type_id INT8 REFERENCES types(id) ON DELETE CASCADE
);

