import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.LocalStorage 2.0 as SQLs

Item {
    id: odjazdy1
    width: 400
    height: 600

    property var skrot
    property var nazwa
    property var linia

    //property var wielkoscListy
    Component.onCompleted: szukaj_odjazdy(skrot)

    Bazy {
        id: baza
    }

    function szukaj_odjazdy(skrot_szukany) {
        var url = "https://www.peka.poznan.pl/vm/method.vm?ts=1656009539117"

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

                //console.log(xhr.status)
                //console.log(xhr.responseText)
                var json1 = JSON.parse(xhr.responseText)
                var dlugosc = Object.keys(json1.success.times).length

                for (var i = 0; i < dlugosc; i++) {

                    var numerLinii = json1.success.times[i].line

                    listaOdjazdow.append({
                                             "czas": json1.success.times[i].minutes,
                                             "linia": json1.success.times[i].line
                                         })
                }
            }
        }

        var data = "method=getTimes&p0=%7B%22symbol%22%3A%22" + skrot_szukany + "%22%7D"

        xhr.send(data)
    }

    ListView {
        id: listView
        y: 180
        width: 349
        height: 308
        anchors.horizontalCenterOffset: -6
        anchors.horizontalCenter: parent.horizontalCenter

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
                    text: linia
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                Text {
                    width: 20
                    text: czas
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                Text {
                    width: 10
                    text: "min."
                    anchors.verticalCenter: parent.verticalCenter
                    font.bold: true
                }
                spacing: 10
            }
        }
        model: ListModel {
            id: listaOdjazdow
        }
    }

    Text {
        id: text1
        y: 52
        width: 307
        wrapMode: Text.WordWrap
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
        height: 26
        text: "Oto odjazdy dla przystanku " + nazwa
        font.pixelSize: 21
    }

    Text {
        id: text2
        y: 153
        text: qsTr("numer linii")
        font.pixelSize: 12
        anchors.horizontalCenterOffset: -153
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Text {
        id: text3
        y: 153
        text: qsTr("czas odjazdu")
        font.pixelSize: 12
        anchors.horizontalCenterOffset: 16
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Button {
        id: backButton
        y: 20
        text: qsTr("Wstecz")
        anchors.horizontalCenterOffset: -141
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: stackview.pop()
    }

    Button {
        id: button
        y: 20
        text: qsTr("Do Menu")
        anchors.horizontalCenterOffset: -44
        anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            stackview.pop()
            stackview.pop()
            stackview.pop()
            stackview.pop()
            stackview.push("Przystanki.qml")
        }
    }
}
