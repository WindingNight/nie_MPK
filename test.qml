import QtQuick 2.0

Item {
    id: testowy_item


    /*
    {
        "success": {
            "bollards": [{
                "directions": [{
                    "returnVariant": false,
                    "lineName": "5",
                    "direction": "Górczyn PKM"
                }, {
                    "returnVariant": false,
                    "lineName": "6",
                    "direction": "Junikowo"
                }, {
                    "returnVariant": false,
                    "lineName": "6",
                    "direction": "Głogowska/Hetmańska"
                }, {
                    "returnVariant": false,
                    "lineName": "9",
                    "direction": "Piątkowska"
                }, {
                    "returnVariant": false,
                    "lineName": "10",
                    "direction": "Dębiec PKM"
                }, {
                    "returnVariant": false,
                    "lineName": "10",
                    "direction": "Błażeja"
                }, {
                    "returnVariant": false,
                    "lineName": "12",
                    "direction": "Os. Sobieskiego"
                }, {
                    "returnVariant": false,
                    "lineName": "14",
                    "direction": "Górczyn PKM"
                }, {
                    "returnVariant": false,
                    "lineName": "15",
                    "direction": "Os. Sobieskiego"
                }, {
                    "returnVariant": false,
                    "lineName": "18",
                    "direction": "Ogrody"
                }, {
                    "returnVariant": false,
                    "lineName": "18",
                    "direction": "Głogowska/Hetmańska"
                }],
                "bollard": {
                    "symbol": "AWF01",
                    "name": "AWF",
                    "tag": "AWF41",
                    "mainBollard": false
                }
            }, {
                "directions": [{
                    "returnVariant": false,
                    "lineName": "5",
                    "direction": "Unii Lubelskiej"
                }, {
                    "returnVariant": false,
                    "lineName": "5",
                    "direction": "Franowo"
                }, {
                    "returnVariant": false,
                    "lineName": "9",
                    "direction": "Starołęka Mała"
                }, {
                    "returnVariant": false,
                    "lineName": "9",
                    "direction": "Franowo"
                }, {
                    "returnVariant": false,
                    "lineName": "9",
                    "direction": "Starołęka PKM"
                }],
                "bollard": {
                    "symbol": "AWF02",
                    "name": "AWF",
                    "tag": "AWF42",
                    "mainBollard": false
                }
            }, {
                "directions": [{
                    "returnVariant": false,
                    "lineName": "6",
                    "direction": "Miłostowo"
                }, {
                    "returnVariant": false,
                    "lineName": "6",
                    "direction": "Franowo"
                }, {
                    "returnVariant": false,
                    "lineName": "6",
                    "direction": "Starołęka PKM"
                }, {
                    "returnVariant": false,
                    "lineName": "10",
                    "direction": "Franowo"
                }, {
                    "returnVariant": false,
                    "lineName": "12",
                    "direction": "Franowo"
                }, {
                    "returnVariant": false,
                    "lineName": "12",
                    "direction": "Starołęka PKM"
                }, {
                    "returnVariant": false,
                    "lineName": "14",
                    "direction": "Franowo"
                }, {
                    "returnVariant": false,
                    "lineName": "15",
                    "direction": "Franowo"
                }, {
                    "returnVariant": false,
                    "lineName": "18",
                    "direction": "Franowo"
                }, {
                    "returnVariant": false,
                    "lineName": "18",
                    "direction": "Starołęka PKM"
                }, {
                    "returnVariant": false,
                    "lineName": "174",
                    "direction": "Unii Lubelskiej"
                }],
                "bollard": {
                    "symbol": "AWF03",
                    "name": "AWF",
                    "tag": "AWF73",
                    "mainBollard": false
                }
            }, {
                "directions": [{
                    "returnVariant": false,
                    "lineName": "174",
                    "direction": "Os. Sobieskiego"
                }, {
                    "returnVariant": false,
                    "lineName": "176",
                    "direction": "Garbary PKM"
                }, {
                    "returnVariant": false,
                    "lineName": "603",
                    "direction": "Garbary PKM"
                }],
                "bollard": {
                    "symbol": "AWF24",
                    "name": "AWF",
                    "tag": "AWF02",
                    "mainBollard": false
                }
            }, {
                "directions": [{
                    "returnVariant": false,
                    "lineName": "176",
                    "direction": "Os. Dębina"
                }, {
                    "returnVariant": false,
                    "lineName": "603",
                    "direction": "Łęczyca/Dworcowa"
                }],
                "bollard": {
                    "symbol": "AWF23",
                    "name": "AWF",
                    "tag": "AWF01",
                    "mainBollard": false
                }
            }, {
                "directions": [{
                    "returnVariant": false,
                    "lineName": "212",
                    "direction": "Szwajcarska Szpital"
                }, {
                    "returnVariant": false,
                    "lineName": "222",
                    "direction": "Mogileńska"
                }],
                "bollard": {
                    "symbol": "AWF21",
                    "name": "AWF",
                    "tag": "AWF03",
                    "mainBollard": false
                }
            }, {
                "directions": [{
                    "returnVariant": false,
                    "lineName": "190",
                    "direction": "Os. Sobieskiego"
                }, {
                    "returnVariant": false,
                    "lineName": "190",
                    "direction": "AWF"
                }, {
                    "returnVariant": false,
                    "lineName": "211",
                    "direction": "Starołęka PKM"
                }, {
                    "returnVariant": false,
                    "lineName": "220",
                    "direction": "Garbary PKM"
                }, {
                    "returnVariant": false,
                    "lineName": "221",
                    "direction": "Sypniewo"
                }, {
                    "returnVariant": false,
                    "lineName": "221",
                    "direction": "Starołęka PKM"
                }],
                "bollard": {
                    "symbol": "KAWI22",
                    "name": "AWF",
                    "tag": "AWF05",
                    "mainBollard": false
                }
            }, {
                "directions": [{
                    "returnVariant": false,
                    "lineName": "212",
                    "direction": "Kacza"
                }, {
                    "returnVariant": false,
                    "lineName": "212",
                    "direction": "Rondo Kaponiera"
                }, {
                    "returnVariant": false,
                    "lineName": "222",
                    "direction": "Port Lotniczy Ławica"
                }],
                "bollard": {
                    "symbol": "AWF22",
                    "name": "AWF",
                    "tag": "AWF04",
                    "mainBollard": false
                }
            }]
        }
    }
    */
}
