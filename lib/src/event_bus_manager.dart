import './hash.dart';
import './event_bus.dart';
import './off_event.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

/// * The callbacks registered on EventBus should be unregistered one by one when they
/// are no needed any more. It is a heavy work if there are many callbacks and will lead 
/// to memory leaks if forgot unregistering any one callback.
/// 
/// * An EventBusManager instance can release all callbacks registered on EventBus 
/// through it when call its `dispose`.
/// 
/// {@tool}
/// 
/// ```dart
/// class _SomeWidgetState extends State<SomeWidget> {
///   final eventBusManager = EventBusManager();  
/// 
///   @override
///   void initState() {
///     super.initState();
///     eventBusManager.onData(onInt);
///     eventBusManager.onEvent("test", onTest);
///     eventBusManager.onEventWithArg("test", onTestWithData);
///   }
/// 
///   void onInt(int value) {
///     // some codes
///   }
/// 
///   void onTest(String event) {
///     // some codes
///   }
/// 
///   void onTestWithData(String event, String data) {
///     // some codes
///   }
/// 
///   @override
///   void dispose() {
///     super.dispose();
///     eventBusManager.dispose();
///   }
/// }
/// ```
/// 
/// {@end-tool}
@sealed
class EventBusManager {
  EventBusManager();
  
  AsyncEmitter get async => $eventBus.async;

  void off(Function callback) 
    => offEvent(_NULL.Event, callback);

  void offEvent(Object event, Function callback) {
    _debugCheckHasDisposed();
    _offEvents[_Key(event, callback)]?.call();
  }

  OffEvent on(void callback()) {
    _debugCheckHasDisposed();
    final key = _Key(_NULL.Event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.on(callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent onData<D>(void callback(D data)) {
    _debugCheckHasDisposed();
    final key = _Key(_NULL.Event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.onData(callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent on2Data<D1,D2>(void callback(D1 data1, D2 data2)) {
    _debugCheckHasDisposed();
    final key = _Key(_NULL.Event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.on2Data(callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent on3Data<D1,D2,D3>(void callback(D1 data1, D2 data2, D3 data3)) {
    _debugCheckHasDisposed();
    final key = _Key(_NULL.Event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.on3Data(callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent on4Data<D1,D2,D3,D4>(void callback(D1 data1, D2 data2, D3 data3, D4 data4)) {
    _debugCheckHasDisposed();
    final key = _Key(_NULL.Event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.on4Data(callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent on5Data<D1,D2,D3,D4,D5>(void callback(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5)) {
    _debugCheckHasDisposed();
    final key = _Key(_NULL.Event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.on5Data(callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent on6Data<D1,D2,D3,D4,D5,D6>(void callback(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6)) {
    _debugCheckHasDisposed();
    final key = _Key(_NULL.Event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.on6Data(callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent on7Data<D1,D2,D3,D4,D5,D6,D7>(void callback(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7)) {
    _debugCheckHasDisposed();
    final key = _Key(_NULL.Event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.on7Data(callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent on8Data<D1,D2,D3,D4,D5,D6,D7,D8>(void callback(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7, D8 data8)) {
    _debugCheckHasDisposed();
    final key = _Key(_NULL.Event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.on8Data(callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent on9Data<D1,D2,D3,D4,D5,D6,D7,D8,D9>(void callback(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7, D8 data8, D9 data9)) {
    _debugCheckHasDisposed();
    final key = _Key(_NULL.Event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.on9Data(callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent onEvent<E>(E event, void callback(E event)) {
    _debugCheckHasDisposed();
    final key = _Key(event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.onEvent(event, callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent onEventWithArg<E,A>(E event, void callback(E event, A arg)) {
    _debugCheckHasDisposed();
    final key = _Key(event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.onEventWithArg(event, callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent onEventWith2Args<E,A1,A2>(E event, void callback(E event, A1 arg1, A2 arg2)) {
    _debugCheckHasDisposed();
    final key = _Key(event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.onEventWith2Args(event, callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent onEventWith3Args<E,A1,A2,A3>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3)) {
    _debugCheckHasDisposed();
    final key = _Key(event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.onEventWith3Args(event, callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent onEventWith4Args<E,A1,A2,A3,A4>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4)) {
    _debugCheckHasDisposed();
    final key = _Key(event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.onEventWith4Args(event, callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent onEventWith5Args<E,A1,A2,A3,A4,A5>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5)) {
    _debugCheckHasDisposed();
    final key = _Key(event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.onEventWith5Args(event, callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent onEventWith6Args<E,A1,A2,A3,A4,A5,A6>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6)) {
    _debugCheckHasDisposed();
    final key = _Key(event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.onEventWith6Args(event, callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent onEventWith7Args<E,A1,A2,A3,A4,A5,A6,A7>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7)) {
    _debugCheckHasDisposed();
    final key = _Key(event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.onEventWith7Args(event, callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent onEventWith8Args<E,A1,A2,A3,A4,A5,A6,A7,A8>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8)) {
    _debugCheckHasDisposed();
    final key = _Key(event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.onEventWith8Args(event, callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  OffEvent onEventWith9Args<E,A1,A2,A3,A4,A5,A6,A7,A8,A9>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9)) {
    _debugCheckHasDisposed();
    final key = _Key(event, callback);
    if (_offEvents.containsKey(key)) {
      return _offEvent;
    }
    final remove = $eventBus.onEventWith9Args(event, callback);
    return _offEvents.putIfAbsent(key, () => () {
      remove();
      _offEvents.remove(key);
    });
  }

  void emit() {
    _debugCheckHasDisposed();
    $eventBus.emit();
  }

  void emitData<D>(D data) {
    _debugCheckHasDisposed();
    $eventBus.emitData(data);
  }

  void emit2Data<D1,D2>(D1 data1, D2 data2) {
    _debugCheckHasDisposed();
    $eventBus.emit2Data(data1, data2);
  }

  void emit3Data<D1,D2,D3>(D1 data1, D2 data2, D3 data3) { 
    _debugCheckHasDisposed();
    $eventBus.emit3Data(data1, data2, data3);
  }

  void emit4Data<D1,D2,D3,D4>(D1 data1, D2 data2, D3 data3, D4 data4) {
    _debugCheckHasDisposed();
    $eventBus.emit4Data(data1, data2, data3, data4);
  }

  void emit5Data<D1,D2,D3,D4,D5>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5) {
    _debugCheckHasDisposed();
    $eventBus.emit5Data(data1, data2, data3, data4, data5);
  }

  void emit6Data<D1,D2,D3,D4,D5,D6>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6) {
    _debugCheckHasDisposed();
    $eventBus.emit6Data(data1, data2, data3, data4, data5, data6);
  }

  void emit7Data<D1,D2,D3,D4,D5,D6,D7>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7) {
    _debugCheckHasDisposed();
    $eventBus.emit7Data(data1, data2, data3, data4, data5, data6, data7);
  }

  void emit8Data<D1,D2,D3,D4,D5,D6,D7,D8>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7, D8 data8) {
    _debugCheckHasDisposed();
    $eventBus.emit8Data(data1, data2, data3, data4, data5, data6, data7, data8);
  }

  void emit9Data<D1,D2,D3,D4,D5,D6,D7,D8,D9>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7, D8 data8, D9 data9) {
    _debugCheckHasDisposed();
    $eventBus.emit9Data(data1, data2, data3, data4, data5, data6, data7, data8, data9);
  }

  void emitEvent<E>(E event) {
    _debugCheckHasDisposed();
    $eventBus.emitEvent(event);
  }

  void emitEventWithArg<E,A>(E event, A arg) {
    _debugCheckHasDisposed();
    $eventBus.emitEventWithArg(event, arg);
  }

  void emitEventWith2Args<E,A1,A2>(E event, A1 arg1, A2 arg2) {
    _debugCheckHasDisposed();
    $eventBus.emitEventWith2Args(event, arg1, arg2);
  }

  void emitEventWith3Args<E,A1,A2,A3>(E event, A1 arg1, A2 arg2, A3 arg3) {
    _debugCheckHasDisposed();
    $eventBus.emitEventWith3Args(event, arg1, arg2, arg3);
  }

  void emitEventWith4Args<E,A1,A2,A3,A4>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4) {
    _debugCheckHasDisposed();
    $eventBus.emitEventWith4Args(event, arg1, arg2, arg3, arg4);
  }

  void emitEventWith5Args<E,A1,A2,A3,A4,A5>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5) {
    _debugCheckHasDisposed();
    $eventBus.emitEventWith5Args(event, arg1, arg2, arg3, arg4, arg5);
  }

  void emitEventWith6Args<E,A1,A2,A3,A4,A5,A6>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6) {
    _debugCheckHasDisposed();
    $eventBus.emitEventWith6Args(event, arg1, arg2, arg3, arg4, arg5, arg6);
  }

  void emitEventWith7Args<E,A1,A2,A3,A4,A5,A6,A7>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7) {
    _debugCheckHasDisposed();
    $eventBus.emitEventWith7Args(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
  }

  void emitEventWith8Args<E,A1,A2,A3,A4,A5,A6,A7,A8>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8) {
    _debugCheckHasDisposed();
    $eventBus.emitEventWith8Args(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
  }

  void emitEventWith9Args<E,A1,A2,A3,A4,A5,A6,A7,A8,A9>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9) {
    _debugCheckHasDisposed();
    $eventBus.emitEventWith9Args(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
  }

  void dispose() {
    if (_disposed) return;
    // 防止移除报错
    final offEvents = _offEvents.values.toList();
    offEvents?.forEach((remove) => remove());
    _disposed = true;
  }

  void _debugCheckHasDisposed() {
    assert((){
      if (_disposed) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary('''$this has disposed.''')
        ]);
      }
      return true;
    }());
  }

  bool _disposed = false;
  final _offEvents = Map<_Key, OffEvent>();
}

void _offEvent() {}

class _NULL {
  const _NULL();
  static const Event = _NULL();
}

class _Key {
  final Object event;
  final Function callback;

  const _Key(this.event, this.callback);

  @override
  int get hashCode => hash(<int>[event.hashCode, callback.hashCode]);

  @override
  bool operator==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _Key &&
           event == other.event &&
           callback == other.callback;
  }
}