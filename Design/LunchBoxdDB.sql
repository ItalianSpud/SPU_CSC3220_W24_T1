--
-- File generated with SQLiteStudio v3.4.4 on Fri Feb 9 13:30:04 2024
--
-- Text encoding used: System
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: Recipes
CREATE TABLE Recipes (
    recipeId     INTEGER PRIMARY KEY
                         UNIQUE
                         NOT NULL
                         DEFAULT AUTO_INCREMENT,
    creationDate TEXT    NOT NULL
                         DEFAULT (CURRENT_DATE),
    title        TEXT    NOT NULL,
    description  TEXT,
    ingredients  TEXT    NOT NULL,
    instructions TEXT    NOT NULL,
    type         TEXT    CHECK (type = "Breakfast" OR 
                                type = "Lunch" OR 
                                type = "Dinner" OR 
                                type = "Snack" OR 
                                type = NULL),
    userId       INTEGER REFERENCES Users (UserId) 
                         NOT NULL
);


-- Table: Reviews
CREATE TABLE Reviews (
    reviewId     INTEGER PRIMARY KEY
                         UNIQUE
                         NOT NULL
                         DEFAULT AUTO_INCREMENT,
    recipeId     INTEGER REFERENCES Recipes (recipeId) MATCH [FULL],
    timePosted   TEXT    NOT NULL
                         DEFAULT (CURRENT_TIMESTAMP),
    cost         INTEGER CHECK (cost >= 1 AND 
                                cost <= 10),
    taste        INTEGER CHECK (taste >= 1 AND 
                                taste <= 10),
    health       INTEGER CHECK (health >= 1 AND 
                                health <= 10),
    creationTime INTEGER CHECK (creationTime >= 1 AND 
                                creationTime <= 10),
    userId       INTEGER REFERENCES Users (UserId) 
                         NOT NULL
);


-- Table: Users
CREATE TABLE Users (
    userId    PRIMARY KEY
              UNIQUE
              NOT NULL
              DEFAULT AUTO_INCREMENT,
    userName  NOT NULL
              UNIQUE
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
