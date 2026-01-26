/****************************************************************************
** Meta object code from reading C++ file 'hyprlandmonitor.hpp'
**
** Created by: The Qt Meta Object Compiler version 69 (Qt 6.10.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../hyprlandmonitor.hpp"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'hyprlandmonitor.hpp' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 69
#error "This file was generated using the moc from 6.10.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN15HyprlandMonitorE_t {};
} // unnamed namespace

template <> constexpr inline auto HyprlandMonitor::qt_create_metaobjectdata<qt_meta_tag_ZN15HyprlandMonitorE_t>()
{
    namespace QMC = QtMocConstants;
    QtMocHelpers::StringRefStorage qt_stringData {
        "HyprlandMonitor",
        "QML.Element",
        "auto",
        "windowListChanged",
        "",
        "workspacesChanged",
        "monitorsChanged",
        "activeWorkspaceChanged",
        "focusedMonitorChanged",
        "connectedChanged",
        "hyprlandEvent",
        "event",
        "QJsonObject",
        "data",
        "onEventSocketReadyRead",
        "connectToHyprland",
        "requestData",
        "refresh",
        "windowByAddress",
        "address",
        "workspaceById",
        "id",
        "biggestWindowForWorkspace",
        "workspaceId",
        "dispatch",
        "command",
        "windowList",
        "QJsonArray",
        "workspaces",
        "monitors",
        "activeWorkspace",
        "focusedMonitor",
        "activeWorkspaceId",
        "connected",
        "windowByAddressMap",
        "QVariantMap",
        "workspaceByIdMap",
        "workspaceIds",
        "QVariantList",
        "addresses"
    };

    QtMocHelpers::UintData qt_methods {
        // Signal 'windowListChanged'
        QtMocHelpers::SignalData<void()>(3, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'workspacesChanged'
        QtMocHelpers::SignalData<void()>(5, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'monitorsChanged'
        QtMocHelpers::SignalData<void()>(6, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'activeWorkspaceChanged'
        QtMocHelpers::SignalData<void()>(7, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'focusedMonitorChanged'
        QtMocHelpers::SignalData<void()>(8, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'connectedChanged'
        QtMocHelpers::SignalData<void()>(9, 4, QMC::AccessPublic, QMetaType::Void),
        // Signal 'hyprlandEvent'
        QtMocHelpers::SignalData<void(const QString &, const QJsonObject &)>(10, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 11 }, { 0x80000000 | 12, 13 },
        }}),
        // Slot 'onEventSocketReadyRead'
        QtMocHelpers::SlotData<void()>(14, 4, QMC::AccessPrivate, QMetaType::Void),
        // Slot 'connectToHyprland'
        QtMocHelpers::SlotData<void()>(15, 4, QMC::AccessPrivate, QMetaType::Void),
        // Slot 'requestData'
        QtMocHelpers::SlotData<void()>(16, 4, QMC::AccessPrivate, QMetaType::Void),
        // Method 'refresh'
        QtMocHelpers::MethodData<void()>(17, 4, QMC::AccessPublic, QMetaType::Void),
        // Method 'windowByAddress'
        QtMocHelpers::MethodData<QJsonObject(const QString &)>(18, 4, QMC::AccessPublic, 0x80000000 | 12, {{
            { QMetaType::QString, 19 },
        }}),
        // Method 'workspaceById'
        QtMocHelpers::MethodData<QJsonObject(int)>(20, 4, QMC::AccessPublic, 0x80000000 | 12, {{
            { QMetaType::Int, 21 },
        }}),
        // Method 'biggestWindowForWorkspace'
        QtMocHelpers::MethodData<QJsonObject(int)>(22, 4, QMC::AccessPublic, 0x80000000 | 12, {{
            { QMetaType::Int, 23 },
        }}),
        // Method 'dispatch'
        QtMocHelpers::MethodData<void(const QString &)>(24, 4, QMC::AccessPublic, QMetaType::Void, {{
            { QMetaType::QString, 25 },
        }}),
    };
    QtMocHelpers::UintData qt_properties {
        // property 'windowList'
        QtMocHelpers::PropertyData<QJsonArray>(26, 0x80000000 | 27, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 0),
        // property 'workspaces'
        QtMocHelpers::PropertyData<QJsonArray>(28, 0x80000000 | 27, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 1),
        // property 'monitors'
        QtMocHelpers::PropertyData<QJsonArray>(29, 0x80000000 | 27, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 2),
        // property 'activeWorkspace'
        QtMocHelpers::PropertyData<QJsonObject>(30, 0x80000000 | 12, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 3),
        // property 'focusedMonitor'
        QtMocHelpers::PropertyData<QJsonObject>(31, 0x80000000 | 12, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 4),
        // property 'activeWorkspaceId'
        QtMocHelpers::PropertyData<int>(32, QMetaType::Int, QMC::DefaultPropertyFlags, 3),
        // property 'connected'
        QtMocHelpers::PropertyData<bool>(33, QMetaType::Bool, QMC::DefaultPropertyFlags, 5),
        // property 'windowByAddressMap'
        QtMocHelpers::PropertyData<QVariantMap>(34, 0x80000000 | 35, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 0),
        // property 'workspaceByIdMap'
        QtMocHelpers::PropertyData<QVariantMap>(36, 0x80000000 | 35, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 1),
        // property 'workspaceIds'
        QtMocHelpers::PropertyData<QVariantList>(37, 0x80000000 | 38, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 1),
        // property 'addresses'
        QtMocHelpers::PropertyData<QVariantList>(39, 0x80000000 | 38, QMC::DefaultPropertyFlags | QMC::EnumOrFlag, 0),
    };
    QtMocHelpers::UintData qt_enums {
    };
    QtMocHelpers::UintData qt_constructors {};
    QtMocHelpers::ClassInfos qt_classinfo({
            {    1,    2 },
    });
    return QtMocHelpers::metaObjectData<HyprlandMonitor, void>(QMC::MetaObjectFlag{}, qt_stringData,
            qt_methods, qt_properties, qt_enums, qt_constructors, qt_classinfo);
}
Q_CONSTINIT const QMetaObject HyprlandMonitor::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN15HyprlandMonitorE_t>.stringdata,
    qt_staticMetaObjectStaticContent<qt_meta_tag_ZN15HyprlandMonitorE_t>.data,
    qt_static_metacall,
    nullptr,
    qt_staticMetaObjectRelocatingContent<qt_meta_tag_ZN15HyprlandMonitorE_t>.metaTypes,
    nullptr
} };

void HyprlandMonitor::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<HyprlandMonitor *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->windowListChanged(); break;
        case 1: _t->workspacesChanged(); break;
        case 2: _t->monitorsChanged(); break;
        case 3: _t->activeWorkspaceChanged(); break;
        case 4: _t->focusedMonitorChanged(); break;
        case 5: _t->connectedChanged(); break;
        case 6: _t->hyprlandEvent((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast<std::add_pointer_t<QJsonObject>>(_a[2]))); break;
        case 7: _t->onEventSocketReadyRead(); break;
        case 8: _t->connectToHyprland(); break;
        case 9: _t->requestData(); break;
        case 10: _t->refresh(); break;
        case 11: { QJsonObject _r = _t->windowByAddress((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QJsonObject*>(_a[0]) = std::move(_r); }  break;
        case 12: { QJsonObject _r = _t->workspaceById((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QJsonObject*>(_a[0]) = std::move(_r); }  break;
        case 13: { QJsonObject _r = _t->biggestWindowForWorkspace((*reinterpret_cast<std::add_pointer_t<int>>(_a[1])));
            if (_a[0]) *reinterpret_cast<QJsonObject*>(_a[0]) = std::move(_r); }  break;
        case 14: _t->dispatch((*reinterpret_cast<std::add_pointer_t<QString>>(_a[1]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        if (QtMocHelpers::indexOfMethod<void (HyprlandMonitor::*)()>(_a, &HyprlandMonitor::windowListChanged, 0))
            return;
        if (QtMocHelpers::indexOfMethod<void (HyprlandMonitor::*)()>(_a, &HyprlandMonitor::workspacesChanged, 1))
            return;
        if (QtMocHelpers::indexOfMethod<void (HyprlandMonitor::*)()>(_a, &HyprlandMonitor::monitorsChanged, 2))
            return;
        if (QtMocHelpers::indexOfMethod<void (HyprlandMonitor::*)()>(_a, &HyprlandMonitor::activeWorkspaceChanged, 3))
            return;
        if (QtMocHelpers::indexOfMethod<void (HyprlandMonitor::*)()>(_a, &HyprlandMonitor::focusedMonitorChanged, 4))
            return;
        if (QtMocHelpers::indexOfMethod<void (HyprlandMonitor::*)()>(_a, &HyprlandMonitor::connectedChanged, 5))
            return;
        if (QtMocHelpers::indexOfMethod<void (HyprlandMonitor::*)(const QString & , const QJsonObject & )>(_a, &HyprlandMonitor::hyprlandEvent, 6))
            return;
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast<QJsonArray*>(_v) = _t->windowList(); break;
        case 1: *reinterpret_cast<QJsonArray*>(_v) = _t->workspaces(); break;
        case 2: *reinterpret_cast<QJsonArray*>(_v) = _t->monitors(); break;
        case 3: *reinterpret_cast<QJsonObject*>(_v) = _t->activeWorkspace(); break;
        case 4: *reinterpret_cast<QJsonObject*>(_v) = _t->focusedMonitor(); break;
        case 5: *reinterpret_cast<int*>(_v) = _t->activeWorkspaceId(); break;
        case 6: *reinterpret_cast<bool*>(_v) = _t->connected(); break;
        case 7: *reinterpret_cast<QVariantMap*>(_v) = _t->windowByAddressMap(); break;
        case 8: *reinterpret_cast<QVariantMap*>(_v) = _t->workspaceByIdMap(); break;
        case 9: *reinterpret_cast<QVariantList*>(_v) = _t->workspaceIds(); break;
        case 10: *reinterpret_cast<QVariantList*>(_v) = _t->addresses(); break;
        default: break;
        }
    }
}

const QMetaObject *HyprlandMonitor::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *HyprlandMonitor::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_staticMetaObjectStaticContent<qt_meta_tag_ZN15HyprlandMonitorE_t>.strings))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int HyprlandMonitor::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 15)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 15;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 15)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 15;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    }
    return _id;
}

// SIGNAL 0
void HyprlandMonitor::windowListChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void HyprlandMonitor::workspacesChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void HyprlandMonitor::monitorsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void HyprlandMonitor::activeWorkspaceChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void HyprlandMonitor::focusedMonitorChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void HyprlandMonitor::connectedChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void HyprlandMonitor::hyprlandEvent(const QString & _t1, const QJsonObject & _t2)
{
    QMetaObject::activate<void>(this, &staticMetaObject, 6, nullptr, _t1, _t2);
}
QT_WARNING_POP
