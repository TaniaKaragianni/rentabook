-- Δημιουργία πίνακα Users
CREATE TABLE Users (
    userid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    usertype ENUM('lend', 'borrow') NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- Δημιουργία πίνακα Categories
CREATE TABLE Units (
    unitid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT
);

-- Δημιουργία πίνακα Books
CREATE TABLE Books (
    bookid INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    unitid INT,
    FOREIGN KEY (unitid) REFERENCES Units(unitid) ON DELETE SET NULL
);

-- Δημιουργία πίνακα Rentals
CREATE TABLE Rentals (
    rentalid INT PRIMARY KEY AUTO_INCREMENT,
    bookid INT NOT NULL,
    userid INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    FOREIGN KEY (bookid) REFERENCES Books(bookid) ON DELETE CASCADE,
    FOREIGN KEY (userid) REFERENCES Users(userid) ON DELETE CASCADE
);

