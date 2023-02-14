CREATE DATABASE real_estate_agency;

USE real_estate_agency;

CREATE TABLE
    Client(
        client_id INT AUTO_INCREMENT,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        email VARCHAR(100) NOT NULL,
        password VARCHAR(100),
        phone_number VARCHAR(20),
        PRIMARY KEY(client_id)
    );

CREATE TABLE
    Annonce(
        ad_id INT AUTO_INCREMENT,
        title VARCHAR(100) NOT NULL,
        price INT NOT NULL,
        publication_date DATE NOT NULL,
        last_modification_date DATE NOT NULL,
        address VARCHAR(200) NOT NULL,
        City VARCHAR(50) NOT NULL,
        Contry VARCHAR(50) NOT NULL,
        category ENUM('sale', 'rent') NOT NULL,
        type ENUM(
            'apartment',
            'house',
            'villa',
            'office',
            'land'
        ) NOT NULL,
        client_id INT NOT NULL,
        PRIMARY KEY(ad_id),
        FOREIGN KEY(client_id) REFERENCES Client(client_id)
    );

CREATE TABLE
    Image_d_annonce(
        Id_Image_d_annonce INT AUTO_INCREMENT,
        image_url VARCHAR(200),
        Is_principale BOOLEAN NOT NULL,
        ad_id INT NOT NULL,
        PRIMARY KEY(Id_Image_d_annonce),
        FOREIGN KEY(ad_id) REFERENCES Annonce(ad_id)
    );