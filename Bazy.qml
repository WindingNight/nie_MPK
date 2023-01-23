import QtQuick 2.0
import QtQuick.LocalStorage 2.0 as SQLs

Item {

    property var db
    ListModel {
        id: wynikiWyszukiwan
    }

    function zapisz_ulubione() {
        db = SQL.LocalStorage.openDatabaseSync("MPK_BAZA", "1.0",
                                               "Baza danych MPK", 1000000)

        db.transaction(function (tx) {
            // Create the database if it doesn't already exist
            tx.executeSql(
                        'CREATE TABLE IF NOT EXISTS Ulubione(nazwa TEXT, skrot TEXT)')

            tx.executeSql('INSERT INTO Ulubione VALUES(?, ?)', [nazwa, skrot])


            /*
            tx.executeSql('INSERT INTO Animals VALUES(?, ?)', ['reksio', 'dog'])


            var rs = tx.executeSql('SELECT * FROM Animals')

            var r = ""
            for (var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).name + ", " + rs.rows.item(i).type + "\n"
            }
            text = r
            */
        })
    }

    function wybierz_ulubione() {

        wynikiWyszukiwan.clear()

        db = SQL.LocalStorage.openDatabaseSync("MPK_BAZA", "1.0",
                                               "Baza danych MPK", 1000000)
        db.transaction(function (tx) {
            // Create the database if it doesn't already exist
            tx.executeSql(
                        'CREATE TABLE IF NOT EXISTS Ulubione(nazwa TEXT, skrot TEXT)')

            var rs = tx.executeSql('SELECT * FROM Ulubione')

            var r = ""
            for (var i = 0; i < rs.rows.length; i++) {
                r += rs.rows.item(i).nazwa + ", " + rs.rows.item(i).skrot

                wynikiWyszukiwan.append({
                                            "nazwa": rs.rows.item(i).nazwa,
                                            "skrot": rs.rows.item(i).skrot
                                        })
            }
            text = r
        })
    }

    function usun_ulubione(co_usunac) {
        db = SQL.LocalStorage.openDatabaseSync("MPK_BAZA", "1.0",
                                               "Baza danych MPK", 1000000)

        db.transaction(function (tx) {
            tx.executeSql(
                        'DELETE FROM Ulubione WHERE skrot =' + co_usunac.toString(
                            ))
        })
    }
}
