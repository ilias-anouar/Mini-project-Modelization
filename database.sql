CREATE DATABASE real_estate_agency;

USE real_estate_agency;

CREATE TABLE Client(
   client_id COUNTER,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   email VARCHAR(100) NOT NULL,
   password VARCHAR(100),
   phone_number VARCHAR(20),
   PRIMARY KEY(client_id)
);

CREATE TABLE Annonce(
   ad_id COUNTER,
   title VARCHAR(100) NOT NULL,
   price INT NOT NULL,
   publication_date DATE NOT NULL,
   last_modification_date DATE NOT NULL,
   address VARCHAR(200) NOT NULL,
   category ENUM NOT NULL,
   type ENUM NOT NULL,
   client_id INT NOT NULL,
   PRIMARY KEY(ad_id),
   FOREIGN KEY(client_id) REFERENCES Client(client_id)
);

CREATE TABLE Image_d_annonce(
   Id_Image_d_annonce COUNTER,
   image_url VARCHAR(200),
   ad_id INT NOT NULL,
   PRIMARY KEY(Id_Image_d_annonce, image_url),
   FOREIGN KEY(ad_id) REFERENCES Annonce(ad_id)
);

CREATE TABLE image_principale(
   Id_Image_d_annonce INT,
   image_url VARCHAR(200),
   ad_id INT,
   PRIMARY KEY(Id_Image_d_annonce, image_url, ad_id),
   FOREIGN KEY(Id_Image_d_annonce, image_url) REFERENCES Image_d_annonce(Id_Image_d_annonce, image_url),
   FOREIGN KEY(ad_id) REFERENCES Annonce(ad_id)
);
