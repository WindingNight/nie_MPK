import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.LocalStorage 2.0 as SQLs

Item {
    id: przystanki1
    width: 400
    height: 600

    Button {
        id: enterButton
        x: 160
        y: 150
        text: qsTr("Wprowadz")
        onClicked: {
            szukaj_przystankow()
        }
    }

    Label {
        id: label
        y: 80
        text: qsTr("Wprowadz nazwe lub fragment nazwy przystanku")
        wrapMode: Text.WordWrap
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 40
        anchors.rightMargin: 31
    }

    ListView {
        id: listView
        y: 217
        height: 331
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.rightMargin: 39
        anchors.leftMargin: 40

        ScrollBar.vertical: ScrollBar {
            active: true
        }

        delegate: Item {
            x: 5
            width: 80
            height: 40
            Row {
                id: row1

                Text {
                    width: 150
                    wrapMode: Text.WordWrap
                    text: nazwa_przystanku
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }

                Button {
                    width: 70
                    height: 20
                    text: "Wybierz"
                    onClicked: przejdz_dalej(nazwa_przystanku)
                }

                spacing: 10
            }
        }
        model: ListModel {
            id: listaPrzystankow
        }
    }

    TextField {
        id: textField
        x: 140
        y: 118
        placeholderText: qsTr("Text Field")
    }

    function szukaj_przystankow() {
        listaPrzystankow.clear()

        var url = "https://www.peka.poznan.pl/vm/method.vm?ts=1649843180931"

        var xhr = new XMLHttpRequest()

        xhr.open("POST", url)

        xhr.setRequestHeader(
                    "User-Agent",
                    "Mozilla/5.0 (X11; Linux x86_64; rv:98.0) Gecko/20100101 Firefox/98.0")
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
        xhr.setRequestHeader("Cookie",
                             "JSESSIONID=I-5JtzdtbLmsVpmA9uB8FYT3.undefined")
        xhr.setRequestHeader("Sec-Fetch-Dest", "empty")
        xhr.setRequestHeader("Sec-Fetch-Mode", "cors")
        xhr.setRequestHeader("Sec-Fetch-Site", "same-origin")

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {

                var json1 = JSON.parse(xhr.responseText)
                var dlugosc = Object.keys(json1.success).length

                for (var i = 0; i < dlugosc; i++) {
                    listaPrzystankow.append({
                                                "nazwa_przystanku": json1.success[i].name
                                            })
                }
            }
        }

        var data = "method=getStopPoints&p0=%7B%22pattern%22%3A%22" + textField.text + "%22%7D"

        xhr.send(data)
    }

    function przejdz_dalej(czego_szukasz) {

        stackview.push("Kierunki.qml", {
                           "przystanek_var": czego_szukasz
                       })
    }
}
