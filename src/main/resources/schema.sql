CREATE TABLE "position" (
  id INT NOT NULL,
  title VARCHAR(50) NOT NULL UNIQUE,
  PRIMARY KEY (id));

CREATE TABLE employee (
  id INT NOT NULL,
  name VARCHAR(50) NOT NULL,
  dob DATE,
  phone VARCHAR (20) UNIQUE,
  position_id INT NOT NULL,
  salary REAl,
  PRIMARY KEY (id),
  FOREIGN KEY (position_id)
  REFERENCES "position" (id));

CREATE TABLE ingredient (
  id INT NOT NULL,
  ingredient_name VARCHAR(50) NOT NULL UNIQUE,
  PRIMARY KEY (id));

CREATE TABLE dish (
  id INT NOT NULL,
  dish_name VARCHAR(50) NOT NULL UNIQUE,
  category VARCHAR (50),
  price REAL,
  weight REAL,
  PRIMARY KEY (id));

CREATE TABLE dish_ingredient (
  dish_id int,
  ingredient_id int,
  FOREIGN KEY (dish_id)
  REFERENCES "dish" (id),
  FOREIGN KEY (ingredient_id)
  REFERENCES "ingredient" (id));

CREATE TABLE "order" (
  id INT NOT NULL,
  order_date TIMESTAMP,
  table_number int,
  employee_id int,
  PRIMARY KEY (id),
  FOREIGN KEY (employee_id)
  REFERENCES "employee" (id));

  CREATE TABLE order_dish (
  order_id INT NOT NULL,
  dish_id INT NOT NULL,
  FOREIGN KEY (order_id)
  REFERENCES "order" (id),
  FOREIGN KEY (dish_id)
  REFERENCES "dish" (id));

CREATE TABLE menu (
  id INT NOT NULL,
  menu_name VARCHAR(50) NOT NULL UNIQUE,
  PRIMARY KEY (id));

CREATE TABLE menu_structure (
  menu_id INT NOT NULL,
  dish_id INT NOT NULL,
  FOREIGN KEY (menu_id)
  REFERENCES "menu" (id),
  FOREIGN KEY (dish_id)
  REFERENCES "dish" (id));

CREATE TABLE store_house (
  ingredient_id int NOT NULL,
  quantiity char(30),
  FOREIGN KEY (ingredient_id)
  REFERENCES "ingredient" (id));

CREATE TABLE prepared_dishes (
  id INT NOT NULL,
  prepared_dish TIMESTAMP,
  dish_id int,
  employee_id int,
  order_id int,
  PRIMARY KEY (id),
  FOREIGN KEY (dish_id)
  REFERENCES "dish" (id),
  FOREIGN KEY (employee_id)
  REFERENCES "employee" (id),
  FOREIGN KEY (order_id)
  REFERENCES "order" (id));