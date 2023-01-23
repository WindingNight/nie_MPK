import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.LocalStorage 2.0 as SQLs

Window {
    width: 400
    height: 600
    minimumWidth: 330
    minimumHeight: 330
    visible: true
    title: qsTr("Witaj w nie-MPK")

    StackView {
        id: stackview

        initialItem: Qt.createComponent("Przystanki.qml")
        anchors.fill: parent
    }
}
