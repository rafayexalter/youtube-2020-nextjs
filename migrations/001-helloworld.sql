-- UP
CREATE TABLE Person (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    email TEXT,
    password TEXT
);

CREATE TABLE Vehicle (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    brand TEXT,
    model TEXT,
    ownedId INTEGER REFERENCES Person(id)
);

-- INSERT INTO Person(name, email) values ('bruno', 'bruno@gmail.com');
-- INSERT INTO Person(name, email) values ('rafay', 'rafay@gmail.com');
-- INSERT INTO Vehicle(brand, model, ownedId) values ('audi', 'R8', 1);
-- INSERT INTO Vehicle(brand, model, ownedId) values ('audi', 'R7', 1);
-- INSERT INTO Vehicle(brand, model, ownedId) values ('suzuki', 'cultus', 1);
-- INSERT INTO Vehicle(brand, model, ownedId) values ('mercedes', 'benz', 2);

-- DOWN
DROP TABLE Person;
DROP TABLE Vehicle;