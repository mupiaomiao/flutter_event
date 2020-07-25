import 'dart:async';
import './hash.dart';
import './off_event.dart';
import 'package:meta/meta.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';

final $eventBus = EventBus();

/// EventBus can fire events cross pages and components. You can hold the global single 
/// instance by the top level variable `$eventBus` or calling `factory EventBus()`.
/// 
/// * Register: Event callbacks registered through methods such as "on", "onData" and 
/// "on2Data" can receive events with the same number, type, and parameter sequence as
/// the callback function signature. However, sometimes the above methods cannot meet
/// the requirements. We can call "onEvent", "onEventWithArg", "onEventWith2Args" and 
/// other methods to register and mark an event callback, the events that the callback 
/// can receive not only require the same number, type, and parameter sequence as the 
/// callback function signature, and also require the same identifier as the identifier 
/// named event used when registering the callback.
/// 
/// * Unregister: Call the `off` method to unregister a callback without identifier, 
/// and call the `offEvent` method to unregister a callback with identifier.
/// 
/// * Fire events: Call the methods beginning with `emit` to fire events synchronously.
/// Call the `$eventBus.async`'s methods to fire events asynchronously.
/// 
/// {@tool}
/// 
/// ```dart
/// class SomeWidgetState extends State<SomeWidget> {
///   OffEvent offEvent1;
///   OffEvent offEvent2;
/// 
///   @override
///   void initState() {
///     super.initState();
///     offEvent1 = $eventBus.on3Data(on3Data);
///     offEvent2 = $eventBus.onEventWithArg("test", onTestWith3Args);
///   }
/// 
///   void on3Data(int data1, String data2, double data3) {
///     // some codes
///   }
/// 
///   void onTestWith3Args(String event, int arg1, String arg2, double arg3) {
///     // some codes
///   }
/// 
///   @override
///   void dispose() {
///     offEvent1();  // or $eventBus.off(on3Data);
///     offEvent2();  // or $eventBus.offEvent("test", onTestWith3Args);
///     super.dispose();
///   }
/// }
/// ```
/// 
/// {@end-tool}
/// 
/// * The `SomeWidgetState.on3Data` can receive such as the following events:
/// 
/// {@tool}
///   
/// ```dart
///   $eventBus.emit3Data(22, "Hi", 33.0);
///   $eventBus.emit3Data(2, 'Good', 33.9);
///   $eventBus.async.emit3Data(33, 'Wo', 99.0);  // fire an event asynchronously.
/// ```
/// 
/// {@end-tool}
/// 
/// but cannot receive such as the following events:  
/// 
/// {@tool}
/// 
/// ```dart
///   $eventBus.emit3Data(1, 1, 1);
///   $eventBus.async.emit3Data(1, 1, 1);  // fire an event asynchronously.
///   $eventBus.emit3Data('Hi', 1, 23.0);
///   $eventBus.emit3Data(22.0, "Hi", 33);
///   $eventBus.emit4Data(1, 'Hi', 12.0, 44);
///   $eventBus.emitEventWith2Args(2, "Good", 33.9);
/// ```
/// 
/// {@end-tool}
/// 
/// * The `SomeWidgetState.onTestWith3Args` can receive such as the following events:
/// 
/// {@tool}
/// 
/// ```dart
///   $eventBus.emitEventWith3Args("test", 12, "Hi", 33.5);
///   $eventBus.emitEventWith3Args("test", 22, "Good", 102.0);
///   $eventBus.async.emitEventWith3Args("test", 12, "Goods", 44.0);  // fire an event asynchronously.
/// ```
/// 
/// {@end-tool}
/// 
/// but cannot receive such as the following events:  
/// 
/// {@tool}
/// 
/// ```dart
///   $eventBus.emit4Data("test", 12, "Hi", 33.5);
///   $eventBus.emitEventWith3Args("test1", 12, "Hi", 33.5);
///   $eventBus.emitEventWith3Args("test", "Hi", 12, 33.5);
///   $eventBus.emitEventWith3Args("Test", "Hi", 12, 33.5);
///   $eventBus.emitEventWith4Args("test", 12, "Hi", 33.5, 33);
///   $eventBus.async.emit4Data("test", 12, "Hi", 33.9);  // fire an event asynchronously.
/// ```
/// 
/// {@end-tool}
@sealed
class EventBus {
  final async = AsyncEmitter._();

  int get callbacksCount {
    int count = 0;
    _callbacks?.forEach((_, callbacks) => count += callbacks.length);
    return count;
  }

  factory EventBus() => _singleton;

  /// 注销callback
  void off(Function callback) 
    => offEvent(_NULL.Event, callback);

  /// 注销event下的callback
  void offEvent(Object event, Function callback) 
    => _offEvents[_Key(event, callback)]?.call();

  OffEvent on(void callback()) {
    _debugCheckNullCallback('on', callback);
    const evt = _Event<_NULL>(_NULL.Event);
    return _on(evt, _VoidCallback(callback));
  }

  OffEvent onData<D>(void callback(D data)) {
    _debugCheckNullCallback('onData', callback);
    final evt = _Event1<_NULL,D>(_NULL.Event);
    return _on(evt, _DataCallback<D>(callback));
  }

  OffEvent on2Data<D1,D2>(void callback(D1 data1, D2 data2)) {
    _debugCheckNullCallback('on2Data', callback);
    final evt = _Event2<_NULL,D1,D2>(_NULL.Event);
    return _on(evt, _DataCallback2<D1,D2>(callback));
  }

  OffEvent on3Data<D1,D2,D3>(void callback(D1 data1, D2 data2, D3 data3)) {
    _debugCheckNullCallback('on3Data', callback);
    final evt = _Event3<_NULL,D1,D2,D3>(_NULL.Event);
    return _on(evt, _DataCallback3<D1,D2,D3>(callback));
  }

  OffEvent on4Data<D1,D2,D3,D4>(void callback(D1 data1, D2 data2, D3 data3, D4 data4)) {
    _debugCheckNullCallback('on4Data', callback);
    final evt = _Event4<_NULL,D1,D2,D3,D4>(_NULL.Event);
    return _on(evt, _DataCallback4<D1,D2,D3,D4>(callback));
  }
  
  OffEvent on5Data<D1,D2,D3,D4,D5>(void callback(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5)) {
    _debugCheckNullCallback('on5Data', callback);
    final evt = _Event5<_NULL,D1,D2,D3,D4,D5>(_NULL.Event);
    return _on(evt, _DataCallback5<D1,D2,D3,D4,D5>(callback));
  }

  OffEvent on6Data<D1,D2,D3,D4,D5,D6>(void callback(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6)) {
    _debugCheckNullCallback('on6Data', callback);
    final evt = _Event6<_NULL,D1,D2,D3,D4,D5,D6>(_NULL.Event);
    return _on(evt, _DataCallback6<D1,D2,D3,D4,D5,D6>(callback));
  }

  OffEvent on7Data<D1,D2,D3,D4,D5,D6,D7>(void callback(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7)) {
    _debugCheckNullCallback('on7Data', callback);
    final evt = _Event7<_NULL,D1,D2,D3,D4,D5,D6,D7>(_NULL.Event);
    return _on(evt, _DataCallback7<D1,D2,D3,D4,D5,D6,D7>(callback));
  }

  OffEvent on8Data<D1,D2,D3,D4,D5,D6,D7,D8>(void callback(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7, D8 data8)) {
    _debugCheckNullCallback('on8Data', callback);
    final evt = _Event8<_NULL,D1,D2,D3,D4,D5,D6,D7,D8>(_NULL.Event);
    return _on(evt, _DataCallback8<D1,D2,D3,D4,D5,D6,D7,D8>(callback));
  }

  OffEvent on9Data<D1,D2,D3,D4,D5,D6,D7,D8,D9>(void callback(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7, D8 data8, D9 data9)) {
    _debugCheckNullCallback('on9Data', callback);
    final evt = _Event9<_NULL,D1,D2,D3,D4,D5,D6,D7,D8,D9>(_NULL.Event);
    return _on(evt, _DataCallback9<D1,D2,D3,D4,D5,D6,D7,D8,D9>(callback));
  }

  OffEvent onEvent<E>(E event, void callback(E event)) {
    _debugCheckNullEvent('onEvent', event);
    _debugCheckNullCallback('onEvent', callback);
    final evt = _Event<E>(event);
    return _on(evt, _EventCallback<E>(callback));
  }

  OffEvent onEventWithArg<E,A>(E event, void callback(E event, A arg)) {
    _debugCheckNullEvent('onEventWithArg', event);
    _debugCheckNullCallback('onEventWithArg', callback);
    final evt = _Event1<E,A>(event);
    return _on(evt, _EventWithArgCallback<E,A>(callback));
  }

  OffEvent onEventWith2Args<E,A1,A2>(E event, void callback(E event, A1 arg1, A2 arg2)) {
    _debugCheckNullEvent('onEventWith2Args', event);
    _debugCheckNullCallback('onEventWith2Args', callback);
    final evt = _Event2<E,A1,A2>(event);
    return _on(evt, _EventWith2ArgsCallback<E,A1,A2>(callback));
  }

  OffEvent onEventWith3Args<E,A1,A2,A3>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3)) {
    _debugCheckNullEvent('onEventWith3Args', event);
    _debugCheckNullCallback('onEventWith3Args', callback);
    final evt = _Event3<E,A1,A2,A3>(event);
    return _on(evt, _EventWith3ArgsCallback<E,A1,A2,A3>(callback));
  }

  OffEvent onEventWith4Args<E,A1,A2,A3,A4>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4)) {
    _debugCheckNullEvent('onEventWith4Args', event);
    _debugCheckNullCallback('onEventWith4Args', callback);
    final evt = _Event4<E,A1,A2,A3,A4>(event);
    return _on(evt, _EventWith4ArgsCallback<E,A1,A2,A3,A4>(callback));
  }

  OffEvent onEventWith5Args<E,A1,A2,A3,A4,A5>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5)) {
    _debugCheckNullEvent('onEventWith5Args', event);
    _debugCheckNullCallback('onEventWith5Args', callback);
    final evt = _Event5<E,A1,A2,A3,A4,A5>(event);
    return _on(evt, _EventWith5ArgsCallback<E,A1,A2,A3,A4,A5>(callback));
  }

  OffEvent onEventWith6Args<E,A1,A2,A3,A4,A5,A6>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6)) {
    _debugCheckNullEvent('onEventWith6Args', event);
    _debugCheckNullCallback('onEventWith6Args', callback);
    final evt = _Event6<E,A1,A2,A3,A4,A5,A6>(event);
    return _on(evt, _EventWith6ArgsCallback<E,A1,A2,A3,A4,A5,A6>(callback));
  }

  OffEvent onEventWith7Args<E,A1,A2,A3,A4,A5,A6,A7>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7)) {
    _debugCheckNullEvent('onEventWith7Args', event);
    _debugCheckNullCallback('onEventWith7Args', callback);
    final evt = _Event7<E,A1,A2,A3,A4,A5,A6,A7>(event);
    return _on(evt, _EventWith7ArgsCallback<E,A1,A2,A3,A4,A5,A6,A7>(callback));
  }

  OffEvent onEventWith8Args<E,A1,A2,A3,A4,A5,A6,A7,A8>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8)) {
    _debugCheckNullEvent('onEventWith8Args', event);
    _debugCheckNullCallback('onEventWith8Args', callback);
    final evt = _Event8<E,A1,A2,A3,A4,A5,A6,A7,A8>(event);
    return _on(evt, _EventWith8ArgsCallback<E,A1,A2,A3,A4,A5,A6,A7,A8>(callback));
  }

  OffEvent onEventWith9Args<E,A1,A2,A3,A4,A5,A6,A7,A8,A9>(E event, void callback(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9)) {
    _debugCheckNullEvent('onEventWith9Args', event);
    _debugCheckNullCallback('onEventWith9Args', callback);
    final evt = _Event9<E,A1,A2,A3,A4,A5,A6,A7,A8,A9>(event);
    return _on(evt, _EventWith9ArgsCallback<E,A1,A2,A3,A4,A5,A6,A7,A8,A9>(callback));
  }

  void emit() 
    => _emit<_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(_NULL.Event);

  void emitData<D>(D data) 
    => _emit<_NULL,D,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(_NULL.Event, data);

  void emit2Data<D1,D2>(D1 data1, D2 data2) 
    => _emit<_NULL,D1,D2,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(_NULL.Event, data1, data2);

  void emit3Data<D1,D2,D3>(D1 data1, D2 data2, D3 data3) 
    => _emit<_NULL,D1,D2,D3,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(_NULL.Event, data1, data2, data3);

  void emit4Data<D1,D2,D3,D4>(D1 data1, D2 data2, D3 data3, D4 data4) 
    => _emit<_NULL,D1,D2,D3,D4,_NULL,_NULL,_NULL,_NULL,_NULL>(_NULL.Event, data1, data2, data3, data4);

  void emit5Data<D1,D2,D3,D4,D5>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5) 
    => _emit<_NULL,D1,D2,D3,D4,D5,_NULL,_NULL,_NULL,_NULL>(_NULL.Event, data1, data2, data3, data4, data5);

  void emit6Data<D1,D2,D3,D4,D5,D6>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6) 
    => _emit<_NULL,D1,D2,D3,D4,D5,D6,_NULL,_NULL,_NULL>(_NULL.Event, data1, data2, data3, data4, data5, data6);

  void emit7Data<D1,D2,D3,D4,D5,D6,D7>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7) 
    => _emit<_NULL,D1,D2,D3,D4,D5,D6,D7,_NULL,_NULL>(_NULL.Event, data1, data2, data3, data4, data5, data6, data7);

  void emit8Data<D1,D2,D3,D4,D5,D6,D7,D8>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7, D8 data8) 
    => _emit<_NULL,D1,D2,D3,D4,D5,D6,D7,D8,_NULL>(_NULL.Event, data1, data2, data3, data4, data5, data6, data7, data8);

  void emit9Data<D1,D2,D3,D4,D5,D6,D7,D8,D9>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7, D8 data8, D9 data9) 
    => _emit<_NULL,D1,D2,D3,D4,D5,D6,D7,D8,D9>(_NULL.Event, data1, data2, data3, data4, data5, data6, data7, data8, data9);

  void emitEvent<E>(E event) 
    => _emit<E,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(event);

  void emitEventWithArg<E,A>(E event, A arg) 
    => _emit<E,A,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(event, arg);

  void emitEventWith2Args<E,A1,A2>(E event, A1 arg1, A2 arg2) 
    => _emit<E,A1,A2,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(event, arg1, arg2);

  void emitEventWith3Args<E,A1,A2,A3>(E event, A1 arg1, A2 arg2, A3 arg3) 
    => _emit<E,A1,A2,A3,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(event, arg1, arg2, arg3);

  void emitEventWith4Args<E,A1,A2,A3,A4>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4) 
    => _emit<E,A1,A2,A3,A4,_NULL,_NULL,_NULL,_NULL,_NULL>(event, arg1, arg2, arg3, arg4);

  void emitEventWith5Args<E,A1,A2,A3,A4,A5>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5) 
    => _emit<E,A1,A2,A3,A4,A5,_NULL,_NULL,_NULL,_NULL>(event, arg1, arg2, arg3, arg4, arg5);

  void emitEventWith6Args<E,A1,A2,A3,A4,A5,A6>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6) 
    => _emit<E,A1,A2,A3,A4,A5,A6,_NULL,_NULL,_NULL>(event, arg1, arg2, arg3, arg4, arg5, arg6);

  void emitEventWith7Args<E,A1,A2,A3,A4,A5,A6,A7>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7) 
    => _emit<E,A1,A2,A3,A4,A5,A6,A7,_NULL,_NULL>(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7);

  void emitEventWith8Args<E,A1,A2,A3,A4,A5,A6,A7,A8>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8) 
    => _emit<E,A1,A2,A3,A4,A5,A6,A7,A8,_NULL>(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);

  void emitEventWith9Args<E,A1,A2,A3,A4,A5,A6,A7,A8,A9>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9) 
    => _emit<E,A1,A2,A3,A4,A5,A6,A7,A8,A9>(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);

  EventBus._();

  static final _singleton = new EventBus._();
  final _offEvents = new Map<_Key, OffEvent>();
  final _callbacks = new Map<_IEvent, Set<_ICallback>>();

  OffEvent _on(_IEvent event, _ICallback callback) {
    final key = _Key(event.event, callback.callback);
    if (_offEvents.containsKey(key)) return _offEvent;
    var callbacks = _callbacks[event];
    if (callbacks == null) {
      callbacks = new Set<_ICallback>();
      _callbacks[event] = callbacks;
    }
    callbacks.add(callback);
    // assert((){
    //   var log = 'EventBus: register ${callback.callback}';
    //   log += event.event == _NULL.Event ? '.' : ' listens to event "${event.event}".';
    //   print(log);
    //   return true;
    // }());
    return _offEvents.putIfAbsent(key, () => () {
      callbacks.remove(callback);
      if (callbacks.isEmpty) {
        _callbacks.remove(event);
      }
      _offEvents.remove(key);
      // assert((){
      //   var log = 'EventBus: unregister ${callback.callback}';
      //   log += event.event == _NULL.Event ? '.' : ' listens to event "${event.event}".';
      //   print(log);
      //   return true;
      // }());
    });
  }

  void _emit<E,A1,A2,A3,A4,A5,A6,A7,A8,A9>([E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9]) {
    final evt = _Event9<E,A1,A2,A3,A4,A5,A6,A7,A8,A9>(event);
    // Avoid errors when some callbacks are removed from _callbacks by themselves.
    final callbacks = _callbacks[evt]?.toList();
    if (callbacks?.isEmpty ?? true) return;
    callbacks.forEach((callback) => _invoke(callback, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9));
  }

  void _invoke(_ICallback callback, event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) {
    try {
      callback(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
    } catch (exception, stack) {
      FlutterError.reportError(FlutterErrorDetails(
        exception: exception,
        stack: stack,
        library: 'mpm library',
        context: ErrorDescription('while dispatching events for $runtimeType'),
        informationCollector: () sync* {
          yield DiagnosticsProperty<EventBus>(
            'The $runtimeType dispatching event was',
            this,
            style: DiagnosticsTreeStyle.errorProperty,
          );
        }
      ));
    }
  }

  static void _debugCheckNullCallback(String methodName, Function callback) {
    assert((){
      if (callback == null) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary('''EventBus.$methodName tried to register a null callback.''')
        ]);
      }
      return true;
    }());
  }

  static void _debugCheckNullEvent(String methodName, dynamic event) {
    assert((){
      if (event == null) {
        throw FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary('''EventBus.$methodName tried to register a null event.''')
        ]);
      }
      return true;
    }());
  }
}

class AsyncEmitter {
  const AsyncEmitter._();

  Future<void> emit() async 
    => _emit<_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(_NULL.Event);

  Future<void> emitData<D>(D data) async
    => _emit<_NULL,D,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(_NULL.Event, data);

  Future<void> emit2Data<D1,D2>(D1 data1, D2 data2) async
    => _emit<_NULL,D1,D2,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(_NULL.Event, data1, data2);

  Future<void> emit3Data<D1,D2,D3>(D1 data1, D2 data2, D3 data3) async
    => _emit<_NULL,D1,D2,D3,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(_NULL.Event, data1, data2, data3);

  Future<void> emit4Data<D1,D2,D3,D4>(D1 data1, D2 data2, D3 data3, D4 data4) async
    => _emit<_NULL,D1,D2,D3,D4,_NULL,_NULL,_NULL,_NULL,_NULL>(_NULL.Event, data1, data2, data3, data4);

  Future<void> emit5Data<D1,D2,D3,D4,D5>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5) async
    => _emit<_NULL,D1,D2,D3,D4,D5,_NULL,_NULL,_NULL,_NULL>(_NULL.Event, data1, data2, data3, data4, data5);

  Future<void> emit6Data<D1,D2,D3,D4,D5,D6>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6) async
    => _emit<_NULL,D1,D2,D3,D4,D5,D6,_NULL,_NULL,_NULL>(_NULL.Event, data1, data2, data3, data4, data5, data6);

  Future<void> emit7Data<D1,D2,D3,D4,D5,D6,D7>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7) async
    => _emit<_NULL,D1,D2,D3,D4,D5,D6,D7,_NULL,_NULL>(_NULL.Event, data1, data2, data3, data4, data5, data6, data7);

  Future<void> emit8Data<D1,D2,D3,D4,D5,D6,D7,D8>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7, D8 data8) async
    => _emit<_NULL,D1,D2,D3,D4,D5,D6,D7,D8,_NULL>(_NULL.Event, data1, data2, data3, data4, data5, data6, data7, data8);

  Future<void> emit9Data<D1,D2,D3,D4,D5,D6,D7,D8,D9>(D1 data1, D2 data2, D3 data3, D4 data4, D5 data5, D6 data6, D7 data7, D8 data8, D9 data9) async
    => _emit<_NULL,D1,D2,D3,D4,D5,D6,D7,D8,D9>(_NULL.Event, data1, data2, data3, data4, data5, data6, data7, data8, data9);

  Future<void> emitEvent<E>(E event) async
    => _emit<E,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(event);

  Future<void> emitEventWithArg<E,A>(E event, A arg) async
    => _emit<E,A,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(event, arg);

  Future<void> emitEventWith2Args<E,A1,A2>(E event, A1 arg1, A2 arg2) async
    => _emit<E,A1,A2,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(event, arg1, arg2);

  Future<void> emitEventWith3Args<E,A1,A2,A3>(E event, A1 arg1, A2 arg2, A3 arg3) async
    => _emit<E,A1,A2,A3,_NULL,_NULL,_NULL,_NULL,_NULL,_NULL>(event, arg1, arg2, arg3);

  Future<void> emitEventWith4Args<E,A1,A2,A3,A4>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4) async
    => _emit<E,A1,A2,A3,A4,_NULL,_NULL,_NULL,_NULL,_NULL>(event, arg1, arg2, arg3, arg4);

  Future<void> emitEventWith5Args<E,A1,A2,A3,A4,A5>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5) async
    => _emit<E,A1,A2,A3,A4,A5,_NULL,_NULL,_NULL,_NULL>(event, arg1, arg2, arg3, arg4, arg5);

  Future<void> emitEventWith6Args<E,A1,A2,A3,A4,A5,A6>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6) async
    => _emit<E,A1,A2,A3,A4,A5,A6,_NULL,_NULL,_NULL>(event, arg1, arg2, arg3, arg4, arg5, arg6);

  Future<void> emitEventWith7Args<E,A1,A2,A3,A4,A5,A6,A7>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7) async
    => _emit<E,A1,A2,A3,A4,A5,A6,A7,_NULL,_NULL>(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7);

  Future<void> emitEventWith8Args<E,A1,A2,A3,A4,A5,A6,A7,A8>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8) async
    => _emit<E,A1,A2,A3,A4,A5,A6,A7,A8,_NULL>(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);

  Future<void> emitEventWith9Args<E,A1,A2,A3,A4,A5,A6,A7,A8,A9>(E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9) async
    => _emit<E,A1,A2,A3,A4,A5,A6,A7,A8,A9>(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);

  void _emit<E,A1,A2,A3,A4,A5,A6,A7,A8,A9>([E event, A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9]) 
    => EventBus._singleton._emit<E,A1,A2,A3,A4,A5,A6,A7,A8,A9>(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
}

// An OffEvent doing nothing.
void _offEvent() {}

/// Avoid wrongs when the types of arguments include `dynamic` or `Object`.
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

// Event
abstract class _IEvent {
  Object get event;
}

class _Event<E> extends _Event1<E,_NULL> {
  const _Event(E event): super(event);
}

class _Event1<E,T> extends _Event2<E,T,_NULL> {
  const _Event1(E event): super(event);
}

class _Event2<E,T1,T2> extends _Event3<E,T1,T2,_NULL> {
  const _Event2(E event): super(event);
}

class _Event3<E,T1,T2,T3> extends _Event4<E,T1,T2,T3,_NULL> {
  const _Event3(E event): super(event);
}

class _Event4<E,T1,T2,T3,T4> extends _Event5<E,T1,T2,T3,T4,_NULL> {
  const _Event4(E event): super(event);
}

class _Event5<E,T1,T2,T3,T4,T5> extends _Event6<E,T1,T2,T3,T4,T5,_NULL> {
  const _Event5(E event): super(event);
}

class _Event6<E,T1,T2,T3,T4,T5,T6> extends _Event7<E,T1,T2,T3,T4,T5,T6,_NULL> {
  const _Event6(E event): super(event);
}

class _Event7<E,T1,T2,T3,T4,T5,T6,T7> extends _Event8<E,T1,T2,T3,T4,T5,T6,T7,_NULL> {
  const _Event7(E event): super(event);
}

class _Event8<E,T1,T2,T3,T4,T5,T6,T7,T8> extends _Event9<E,T1,T2,T3,T4,T5,T6,T7,T8,_NULL> {
  const _Event8(E event): super(event);
}

class _Event9<E,T1,T2,T3,T4,T5,T6,T7,T8,T9> implements _IEvent{
  final E event;

  const _Event9(this.event): assert(event != null);

  @override
  int get hashCode => hash(<int>[event.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _Event9<E,T1,T2,T3,T4,T5,T6,T7,T8,T9> &&
           event == other.event;
  }
}

// Callbacks
abstract class _ICallback {
  Function get callback;
  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);
}

class _VoidCallback implements _ICallback {
  final void Function() callback;

  const _VoidCallback(this.callback)
    : assert(callback != null);
  
  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback();

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _VoidCallback &&
           callback == other.callback;
  }
}

// Data callbacks
class _DataCallback<D> implements _ICallback {
  final void Function(D) callback;

  const _DataCallback(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(arg1 as D);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _DataCallback<D> &&
           callback == other.callback;
  }
}

class _DataCallback2<D1,D2> implements _ICallback {
  final void Function(D1, D2) callback;

  const _DataCallback2(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(arg1 as D1, arg2 as D2);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _DataCallback2<D1,D2> &&
           callback == other.callback;
  }
}

class _DataCallback3<D1,D2,D3> implements _ICallback {
  final void Function(D1, D2, D3) callback;

  const _DataCallback3(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(arg1 as D1, arg2 as D2, arg3 as D3);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _DataCallback3<D1,D2,D3> &&
           callback == other.callback;
  }
}

class _DataCallback4<D1,D2,D3,D4> implements _ICallback {
  final void Function(D1, D2, D3, D4) callback;

  const _DataCallback4(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(arg1 as D1, arg2 as D2, arg3 as D3, arg4 as D4);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _DataCallback4<D1,D2,D3,D4> &&
           callback == other.callback;
  }
}

class _DataCallback5<D1,D2,D3,D4,D5> implements _ICallback {
  final void Function(D1, D2, D3, D4, D5) callback;

  const _DataCallback5(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(arg1 as D1, arg2 as D2, arg3 as D3, arg4 as D4, arg5 as D5);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _DataCallback5<D1,D2,D3,D4,D5> &&
           callback == other.callback;
  }
}

class _DataCallback6<D1,D2,D3,D4,D5,D6> implements _ICallback {
  final void Function(D1, D2, D3, D4, D5, D6) callback;

  const _DataCallback6(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(arg1 as D1, arg2 as D2, arg3 as D3, arg4 as D4, arg5 as D5, arg6 as D6);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _DataCallback6<D1,D2,D3,D4,D5,D6> &&
           callback == other.callback;
  }
}

class _DataCallback7<D1,D2,D3,D4,D5,D6,D7> implements _ICallback {
  final void Function(D1, D2, D3, D4, D5, D6, D7) callback;

  const _DataCallback7(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(arg1 as D1, arg2 as D2, arg3 as D3, arg4 as D4, arg5 as D5, arg6 as D6, arg7 as D7);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _DataCallback7<D1,D2,D3,D4,D5,D6,D7> &&
           callback == other.callback;
  }
}

class _DataCallback8<D1,D2,D3,D4,D5,D6,D7,D8> implements _ICallback {
  final void Function(D1, D2, D3, D4, D5, D6, D7, D8) callback;

  const _DataCallback8(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(arg1 as D1, arg2 as D2, arg3 as D3, arg4 as D4, arg5 as D5, arg6 as D6, arg7 as D7, arg8 as D8);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _DataCallback8<D1,D2,D3,D4,D5,D6,D7,D8> &&
           callback == other.callback;
  }
}

class _DataCallback9<D1,D2,D3,D4,D5,D6,D7,D8,D9> implements _ICallback {
  final void Function(D1, D2, D3, D4, D5, D6, D7, D8, D9) callback;

  const _DataCallback9(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(arg1 as D1, arg2 as D2, arg3 as D3, arg4 as D4, arg5 as D5, arg6 as D6, arg7 as D7, arg8 as D8, arg9 as D9);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _DataCallback9<D1,D2,D3,D4,D5,D6,D7,D8,D9> &&
           callback == other.callback;
  }
}

// Event callbacks
class _EventCallback<E> implements _ICallback {
  final void Function(E event) callback;

  const _EventCallback(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(event as E);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _EventCallback<E> &&
           callback == other.callback;
  }
}

class _EventWithArgCallback<E,A> implements _ICallback {
  final void Function(E, A) callback;

  const _EventWithArgCallback(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(event as E, arg1 as A);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _EventWithArgCallback<E,A> &&
           callback == other.callback;
  }
}

class _EventWith2ArgsCallback<E,A1,A2> implements _ICallback {
  final void Function(E, A1, A2) callback;

  const _EventWith2ArgsCallback(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(event as E, arg1 as A1, arg2 as A2);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _EventWith2ArgsCallback<E,A1,A2> &&
           callback == other.callback;
  }
}

class _EventWith3ArgsCallback<E,A1,A2,A3> implements _ICallback {
  final void Function(E, A1, A2, A3) callback;

  const _EventWith3ArgsCallback(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(event as E, arg1 as A1, arg2 as A2, arg3 as A3);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _EventWith3ArgsCallback<E,A1,A2,A3> &&
           callback == other.callback;
  }
}

class _EventWith4ArgsCallback<E,A1,A2,A3,A4> implements _ICallback {
  final void Function(E, A1, A2, A3, A4) callback;

  const _EventWith4ArgsCallback(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(event as E, arg1 as A1, arg2 as A2, arg3 as A3, arg4 as A4);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _EventWith4ArgsCallback<E,A1,A2,A3,A4> &&
           callback == other.callback;
  }
}

class _EventWith5ArgsCallback<E,A1,A2,A3,A4,A5> implements _ICallback {
  final void Function(E, A1, A2, A3, A4, A5) callback;

  const _EventWith5ArgsCallback(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(event as E, arg1 as A1, arg2 as A2, arg3 as A3, arg4 as A4, arg5 as A5);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _EventWith5ArgsCallback<E,A1,A2,A3,A4,A5> &&
           callback == other.callback;
  }
}

class _EventWith6ArgsCallback<E,A1,A2,A3,A4,A5,A6> implements _ICallback {
  final void Function(E, A1, A2, A3, A4, A5, A6) callback;

  const _EventWith6ArgsCallback(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(event as E, arg1 as A1, arg2 as A2, arg3 as A3, arg4 as A4, arg5 as A5, arg6 as A6);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _EventWith6ArgsCallback<E,A1,A2,A3,A4,A5,A6> &&
           callback == other.callback;
  }
}

class _EventWith7ArgsCallback<E,A1,A2,A3,A4,A5,A6,A7> implements _ICallback {
  final void Function(E, A1, A2, A3, A4, A5, A6, A7) callback;

  const _EventWith7ArgsCallback(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(event as E, arg1 as A1, arg2 as A2, arg3 as A3, arg4 as A4, arg5 as A5, arg6 as A6, arg7 as A7);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _EventWith7ArgsCallback<E,A1,A2,A3,A4,A5,A6,A7> &&
           callback == other.callback;
  }
}

class _EventWith8ArgsCallback<E,A1,A2,A3,A4,A5,A6,A7,A8> implements _ICallback {
  final void Function(E, A1, A2, A3, A4, A5, A6, A7, A8) callback;

  const _EventWith8ArgsCallback(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(event as E, arg1 as A1, arg2 as A2, arg3 as A3, arg4 as A4, arg5 as A5, arg6 as A6, arg7 as A7, arg8 as A8);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _EventWith8ArgsCallback<E,A1,A2,A3,A4,A5,A6,A7,A8> &&
           callback == other.callback;
  }
}

class _EventWith9ArgsCallback<E,A1,A2,A3,A4,A5,A6,A7,A8,A9> implements _ICallback {
  final void Function(E, A1, A2, A3, A4, A5, A6, A7, A8, A9) callback;

  const _EventWith9ArgsCallback(this.callback)
    : assert(callback != null);

  void call(event, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) 
    => callback(event as E, arg1 as A1, arg2 as A2, arg3 as A3, arg4 as A4, arg5 as A5, arg6 as A6, arg7 as A7, arg8 as A8, arg9 as A9);

  @override
  int get hashCode => hash(<int>[callback.hashCode]);

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    return other is _EventWith9ArgsCallback<E,A1,A2,A3,A4,A5,A6,A7,A8,A9> &&
           callback == other.callback;
  }
}