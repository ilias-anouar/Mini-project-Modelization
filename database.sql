CREATE DATABASE real_estate_agency;

USE real_estate_agency;

CREATE TABLE client (
  client_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  password VARCHAR(100) NOT NULL,
  phone_number VARCHAR(20) NOT NULL
);

CREATE TABLE ad (
  ad_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  price INT NOT NULL,
  publication_date DATE NOT NULL,
  last_modification_date DATE NOT NULL,
  address VARCHAR(200) NOT NULL,
  category ENUM('sale', 'rent') NOT NULL,
  type ENUM('apartment', 'house', 'villa', 'office', 'land') NOT NULL,
  client_id INT,
  FOREIGN KEY (client_id) REFERENCES client(client_id)
);

CREATE TABLE ad_images (
  ad_id INT,
  image_url VARCHAR(200) NOT NULL,
  PRIMARY KEY (ad_id, image_url),
  FOREIGN KEY (ad_id) REFERENCES ad(ad_id)
);

CREATE TABLE main_image (
  ad_id INT,
  image_url VARCHAR(200) NOT NULL,
  PRIMARY KEY (ad_id),
  FOREIGN KEY (ad_id, image_url) REFERENCES ad_images(ad_id, image_url)
);
