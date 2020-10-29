import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.3

Item {
    id: root

    property string name
    property Setting setting

    implicitHeight: item.implicitHeight

    SettingItem {
        id: item

        name: root.name
        subtitle: setting.value
        anchors.fill: parent

        onClicked: dialog.open()

        FileDialog {
            id: dialog

            title: qsTr("Please choose a directory")
            folder: "file:///" + backend.toLocalFile(setting.value)
            selectFolder: true

            onAccepted: setting.setValue(backend.toLocalFile(dialog.fileUrl.toString()))
        }
    }
}