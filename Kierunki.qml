import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.LocalStorage 2.0 as SQLs

Item {
    id: kierunki1
    width: 400
    height: 600

    property var przystanek_var

    Component.onCompleted: znajdz_kierunki()

    ListView {
        id: listView
        y: 67
        height: 376
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        model: ListModel {
            id: listaKierunkow
        }

        ScrollBar.vertical: ScrollBar {
            active: true
        }

        delegate: Item {
            x: 5
            //width: 80
            height: 40
            Row {
                id: row1
                spacing: 10

                Text {
                    width: 200
                    wrapMode: Text.WordWrap
                    text: nazwa_kierunku + " nr" + linia_kierunku
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                Button {

                    width: 90
                    height: 20
                    text: "Wybierz"
                    onClicked: przejdz_dalej(skrot_kierunku, nazwa_kierunku,
                                             linia_kierunku)
                }
            }
        }
    }

    Text {
        id: text1
        y: 24

        font.pixelSize: 12
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Wybierz kierunek dla przystanku " + przystanek_var
    }

    function znajdz_kierunki() {
        var url = "https://www.peka.poznan.pl/vm/method.vm?ts=1656005673781"

        var xhr = new XMLHttpRequest()
        xhr.open("POST", url)

        xhr.setRequestHeader(
                    "User-Agent",
                    "Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101 Firefox/97.0")
        xhr.setRequestHeader(
                    "Accept",
                    "text/javascript, text/html, application/xml, text/xml, */*")
        xhr.setRequestHeader("Accept-Language", "en-US,en;q=0.5")
        xhr.setRequestHeader("Accept-Encoding", "gzip, deflate, br")
        xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest")
        xhr.setRequestHeader("X-Prototype-Version", "1.7")
        xhr.setRequestHeader("Content-type",
                             "application/x-www-form-urlencoded; charset=UTF-8")
        xhr.setRequestHeader("Origin", "https://www.peka.poznan.pl")
        xhr.setRequestHeader("Connection", "keep-alive")
        xhr.setRequestHeader("Referer", "https://www.peka.poznan.pl/vm/")
        xhr.setRequestHeader(
                    "Cookie",
                    "JSESSIONID=BJrAEWkPsS1YWrwCbdkYTts1JK2jhUWdk_PXbIoz.wirtualmonitor")
        xhr.setRequestHeader("Sec-Fetch-Dest", "empty")
        xhr.setRequestHeader("Sec-Fetch-Mode", "cors")
        xhr.setRequestHeader("Sec-Fetch-Site", "same-origin")

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {

                var json1 = JSON.parse(xhr.responseText)
                var dlugosc = Object.keys(json1.success.bollards).length

                for (var i = 0; i < dlugosc; i++) {

                    var dlugosc2 = Object.keys(
                                json1.success.bollards[i].directions).length

                    for (var j = 0; j < dlugosc2; j++) {
                        listaKierunkow.append({
                                                  "skrot_kierunku": json1.success.bollards[i].bollard.tag,
                                                  "nazwa_kierunku": json1.success.bollards[i].directions[j].direction,
                                                  "linia_kierunku": json1.success.bollards[i].directions[j].lineName
                                              })
                    }
                }
            }
        }

        var data = "method=getBollardsByStopPoint&p0=%7B%22name%22%3A%22"
                + przystanek_var + "%22%7D"

        xhr.send(data)
    }

    function przejdz_dalej(skrot, nazwa, linia) {
        stackview.push("Odjazdy.qml", {
                           "skrot": skrot,
                           "nazwa": nazwa,
                           "linia": linia
                       })
    }
}
