DROP DATABASE IF EXISTS myrecipe;
CREATE DATABASE myrecipe;

DROP ROLE IF EXISTS admin;
CREATE ROLE admin LOGIN PASSWORD 'admin';

\c myrecipe;

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  user_id CHAR(8) PRIMARY KEY,
  username VARCHAR(15) NOT NULL default '', 
  password TEXT, 
  email VARCHAR(20),
  address VARCHAR(100)
);


DROP TABLE IF EXISTS cart_item CASCADE;
CREATE TABLE cart_item (
  user_id CHAR(8) PRIMARY KEY,
  ingredient_id CHAR(8) REFERENCES ingredients(ingredient_id),
  price FLOAT(2),
  quantity INT
);


DROP TABLE IF EXISTS recipes CASCADE;
CREATE TABLE recipes (
  recipe_id CHAR(8) PRIMARY KEY,
  recipe VARCHAR(50),
  image VARCHAR(200), 
  directions VARCHAR(200),
  created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);


DROP TABLE IF EXISTS recipes_users CASCADE;
CREATE TABLE recipes_users (
  user_id CHAR(8) REFERENCES users(user_id),
  recipe_id CHAR(8) REFERENCES recipes(recipe_id)
);


DROP TABLE IF EXISTS categories CASCADE;
CREATE TABLE categories (
  category_id serial NOT NULL PRIMARY KEY,    
  category VARCHAR(200)
);


DROP TABLE IF EXISTS recipe_categories CASCADE;
CREATE TABLE recipe_categories (
  recipe_id CHAR(8),
  category_id INT,
  FOREIGN KEY(recipe_id) REFERENCES recipes(recipe_id),
  FOREIGN KEY(category_id) REFERENCES categories(category_id)
);


DROP TABLE IF EXISTS ingredients CASCADE;
CREATE TABLE ingredients (
  ingredient_id CHAR(8) PRIMARY KEY, 
  ingredient VARCHAR(50)
);


DROP TABLE IF EXISTS recipe_ingredients;
CREATE TABLE recipe_ingredients (     -- should also add quantity here
  recipe_id CHAR(8) REFERENCES recipes(recipe_id),
  ingredient_id CHAR(8) REFERENCES ingredients(ingredient_id),
  quantity FLOAT(2)
);

GRANT ALL PRIVILEGES ON users, cart_item, recipes, recipes_users, recipe_categories, ingredients, recipe_ingredients TO admin;







