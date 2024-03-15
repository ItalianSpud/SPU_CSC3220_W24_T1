function dbInit() {
    let db = LocalStorage.openDatabaseSync("LunchboxdDatabase", "", "LunchBoxd", 1000000)
    try {
        db.transaction(function (tx) {
            tx.executeSql('CREATE TABLE IF NOT EXISTS Recipes (recipeId INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT AUTO_INCREMENT,creationDate TEXT NOT NULL DEFAULT (CURRENT_DATE),title TEXT NOT NULL,description TEXT,ingredients TEXT NOT NULL,instructions TEXT NOT NULL,type TEXT CHECK (type = "Breakfast" OR type = "Lunch" OR type = "Dinner" OR type = "Snack" OR type = NULL),userId INTEGER REFERENCES Users (UserId) NOT NULL)')
            tx.executeSql('CREATE TABLE IF NOT EXISTS Reviews (reviewId INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT AUTO_INCREMENT,recipeId INTEGER REFERENCES Recipes (recipeId) MATCH [FULL],timePosted TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP),cost INTEGER CHECK (cost >= 1 AND cost <= 10),taste INTEGER CHECK (taste >= 1 AND taste <= 10),health INTEGER CHECK (health >= 1 AND health <= 10),creationTime INTEGER CHECK (creationTime >= 1 AND creationTime <= 10),userId INTEGER REFERENCES Users (UserId) NOT NULL)')
            tx.executeSql('CREATE TABLE IF NOT EXISTS Users (userId PRIMARY KEY UNIQUE NOT NULL DEFAULT AUTO_INCREMENT,userName NOT NULL UNIQUE)')
        })
    } catch (err) {
        console.log("Error creating table in database: " + err)
    };
}

function dbGetHandle() {
    try {
        var db = LocalStorage.openDatabaseSync("LunchboxdDatabase", "", "LunchBoxd", 1000000)
    } catch (err) {
        console.log("Error opening database: " + err)
    }
    return db
}

function dbInsertRecipe(creationDate, title, description, ingredients, instructions, type, cost, taste, health, creationTime) {
    let db = dbGetHandle()
    let rowid = 0;
    db.transaction(function (tx) {
        tx.executeSql('INSERT INTO Recipes (creationDate, title, description, ingredients, instructions, type, userId) VALUES(?, ?, ?, ?, ?, ?, ?)',
                      [creationDate, title, description, ingredients, instructions, type, 1])
        let result = tx.executeSql('SELECT last_insert_rowid()')
        rowid = result.insertId
        tx.executeSql('INSERT INTO Reviews (recipeId, cost, taste, health, creationTime, userId) VALUES(?, ?, ?, ?, ?, ?)',
                      [rowid, cost, taste, health, creationTime, 1])
    })
    console.log(creationDate + ", " + title + ", " + description + ", " + ingredients + ", " + instructions + ", " + type)
    return rowid;
}

function dbReadRecipes() {
    let db = dbGetHandle()
    db.transaction(function (tx) {
        let results = tx.executeSql(
                'SELECT rowid,creationDate,title,description,ingredients,instructions,type FROM Recipes order by rowid desc')
        let reviews = tx.executeSql(
                'SELECT creationTime,taste,cost,health FROM Reviews order by rowid desc')
        for (let i = 0; i < results.rows.length; i++) {
            let recipeIndex = results.rows.item(i).rowid
            console.log(i + ": " + reviews.rows.item(i).creationTime)

            listModel.append({
                id: results.rows.item(i).rowid,
                date: results.rows.item(i).creationDate,
                title: results.rows.item(i).title,
                description: results.rows.item(i).description,
                ingredients: results.rows.item(i).ingredients,
                instructions: results.rows.item(i).instructions,
                type: results.rows.item(i).type,
                creationTime: reviews.rows.item(i).creationTime,
                taste: reviews.rows.item(i).taste,
                cost: reviews.rows.item(i).cost,
                health: reviews.rows.item(i).health
            })
            /*let recipe = {
                "id": results.rows.item(i).rowid,
                "creationDate": results.rows.item(i).creationDate,
                "title": results.rows.item(i).title,
                "description": results.rows.item(i).description
            }*/
            console.log(results.rows.item(i).description)
        }
    })
}

/*function dbReadAll()
{
    let db = dbGetHandle()
    db.transaction(function (tx) {
        let results = tx.executeSql(
                'SELECT rowid,date,trip_desc,distance FROM trip_log order by rowid desc')
        for (let i = 0; i < results.rows.length; i++) {
            listModel.append({
                                 id: results.rows.item(i).rowid,
                                 checked: " ",
                                 date: results.rows.item(i).date,
                                 trip_desc: results.rows.item(i).trip_desc,
                                 distance: results.rows.item(i).distance
                             })
        }
    })
}

function dbUpdate(Pdate, Pdesc, Pdistance, Prowid)
{
    let db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql(
                    'update trip_log set date=?, trip_desc=?, distance=? where rowid = ?', [Pdate, Pdesc, Pdistance, Prowid])
    })
}*/

function dbDeleteAll()
{
    let db = dbGetHandle()
    db.transaction(function (tx) {
        tx.executeSql('delete from Recipes')
    })
}
