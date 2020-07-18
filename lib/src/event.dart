import 'dart:async';
import './off_event.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

abstract class EventArgs {
  const EventArgs();
}

/// An event handler which can take zero argument.
@sealed
class Event {
  final _callbacks = Set<void Function()>();

  OffEvent on(void callback()) {
    _debugCheckNullEventCallback(runtimeType, callback);
    return _callbacks.add(callback) ? () { _callbacks.remove(callback); } : _offEvent;
  }

  void off(void callback()) {
    _debugCheckNullEventCallback(runtimeType, callback);
    _callbacks.remove(callback);
  }

  void call() {
    if (_callbacks.isEmpty) return;
    // 防止回调中移除导致报错
    final callbacks = _callbacks.toList();
    callbacks.forEach((callback) => _invoke(this, callback));
  }

  void async() {
    if (_callbacks.isEmpty) return;
    // 防止稍后发布事件时回调不一致和回调中移除报错
    final callbacks = _callbacks.toList();
    Future((){
      callbacks.forEach((callback) => _invoke(this, callback));
    });
  }
}

/// An event handler which can take one argument.
@sealed
class EventWithArg<A> {
  final _callbacks = Set<void Function(A)>();
  
  OffEvent on(void callback(A arg)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    return _callbacks.add(callback) ? () { _callbacks.remove(callback); } : _offEvent;
  }

  void off(void callback(A arg)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    _callbacks.remove(callback);
  }

  void call(A arg) {
    if (_callbacks.isEmpty) return;
    // 防止回调中移除导致报错
    final callbacks = _callbacks.toList();
    callbacks.forEach((callback) => _invoke(this, ()=>callback(arg)));
  }

  void async(A arg) {
    if (_callbacks.isEmpty) return;
    // 防止稍后发布事件时回调不一致和回调中移除报错
    final callbacks = _callbacks.toList();
    Future((){
      callbacks.forEach((callback) => _invoke(this, ()=>callback(arg)));
    });
  }
}

/// An event handler which can take two arguments.
@sealed
class EventWith2Args<A1,A2> {
  final _callbacks = Set<void Function(A1,A2)>();
  
  OffEvent on(void callback(A1 arg1, A2 arg2)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    return _callbacks.add(callback) ? () { _callbacks.remove(callback); } : _offEvent;
  }

  void off(void callback(A1 arg1, A2 arg2)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    _callbacks.remove(callback);
  }

  void call(A1 arg1, A2 arg2) {
    if (_callbacks.isEmpty) return;
    // 防止回调中移除导致报错
    final callbacks = _callbacks.toList();
    callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2)));
  }

  void async(A1 arg1, A2 arg2) {
    if (_callbacks.isEmpty) return;
    // 防止稍后发布事件时回调不一致和回调中移除报错
    final callbacks = _callbacks.toList();
    Future((){
      callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2)));
    });
  }
}

/// An event handler which can take three arguments.
@sealed
class EventWit3Args<A1,A2,A3> {
  final _callbacks = Set<void Function(A1,A2,A3)>();
  
  OffEvent on(void callback(A1 arg1, A2 arg2, A3 arg3)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    return _callbacks.add(callback) ? () { _callbacks.remove(callback); } : _offEvent;
  }

  void off(void callback(A1 arg1, A2 arg2, A3 arg3)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    _callbacks.remove(callback);
  }

  void call(A1 arg1, A2 arg2, A3 arg3) {
    if (_callbacks.isEmpty) return;
    // 防止回调中移除导致报错
    final callbacks = _callbacks.toList();
    callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3)));
  }

  void async(A1 arg1, A2 arg2, A3 arg3) {
    if (_callbacks.isEmpty) return;
    // 防止稍后发布事件时回调不一致和回调中移除报错
    final callbacks = _callbacks.toList();
    Future((){
      callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3)));
    });
  }
}

/// An event handler which can take four arguments.
@sealed
class EventWith4Args<A1,A2,A3,A4> {
  final _callbacks = Set<void Function(A1,A2,A3,A4)>();
  
  OffEvent on(void callback(A1 arg1, A2 arg2, A3 arg3, A4 arg4)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    return _callbacks.add(callback) ? () { _callbacks.remove(callback); } : _offEvent;
  }

  void off(void callback(A1 arg1, A2 arg2, A3 arg3, A4 arg4)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    _callbacks.remove(callback);
  }

  void call(A1 arg1, A2 arg2, A3 arg3, A4 arg4) {
    if (_callbacks.isEmpty) return;
    // 防止回调中移除导致报错
    final callbacks = _callbacks.toList();
    callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3, arg4)));
  }

  void async(A1 arg1, A2 arg2, A3 arg3, A4 arg4) {
    if (_callbacks.isEmpty) return;
    // 防止稍后发布事件时回调不一致和回调中移除报错
    final callbacks = _callbacks.toList();
    Future((){
      callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3, arg4)));
    });
  }
}

/// An event handler which can take five arguments.
@sealed
class EventWith5Args<A1,A2,A3,A4,A5> {
  final _callbacks = Set<void Function(A1,A2,A3,A4,A5)>();
  
  OffEvent on(void callback(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    return _callbacks.add(callback) ? () { _callbacks.remove(callback); } : _offEvent;
  }

  void off(void callback(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    _callbacks.remove(callback);
  }

  void call(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5) {
    if (_callbacks.isEmpty) return;
    // 防止回调中移除导致报错
    final callbacks = _callbacks.toList();
    callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3, arg4, arg5)));
  }

  void async(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5) {
    if (_callbacks.isEmpty) return;
    // 防止稍后发布事件时回调不一致和回调中移除报错
    final callbacks = _callbacks.toList();
    Future((){
      callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3, arg4, arg5)));
    });
  }
}

/// An event handler which can take six arguments.
@sealed
class EventWith6Args<A1,A2,A3,A4,A5,A6> {
  final _callbacks = Set<void Function(A1,A2,A3,A4,A5,A6)>();
  
  OffEvent on(void callback(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    return _callbacks.add(callback) ? () { _callbacks.remove(callback); } : _offEvent;
  }

  void off(void callback(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    _callbacks.remove(callback);
  }

  void call(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6) {
    if (_callbacks.isEmpty) return;
    // 防止回调中移除导致报错
    final callbacks = _callbacks.toList();
    callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3, arg4, arg5, arg6)));
  }

  void async(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6) {
    if (_callbacks.isEmpty) return;
    // 防止稍后发布事件时回调不一致和回调中移除报错
    final callbacks = _callbacks.toList();
    Future((){
      callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3, arg4, arg5, arg6)));
    });
  }
}

/// An event handler which can take seven arguments.
@sealed
class EventWith7Args<A1,A2,A3,A4,A5,A6,A7> {
  final _callbacks = Set<void Function(A1,A2,A3,A4,A5,A6,A7)>();
  
  OffEvent on(void callback(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    return _callbacks.add(callback) ? () { _callbacks.remove(callback); } : _offEvent;
  }

  void off(void callback(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    _callbacks.remove(callback);
  }

  void call(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7) {
    if (_callbacks.isEmpty) return;
    // 防止回调中移除导致报错
    final callbacks = _callbacks.toList();
    callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3, arg4, arg5, arg6, arg7)));
  }

  void async(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7) {
    if (_callbacks.isEmpty) return;
    // 防止稍后发布事件时回调不一致和回调中移除报错
    final callbacks = _callbacks.toList();
    Future((){
      callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3, arg4, arg5, arg6, arg7)));
    });
  }
}

/// An event handler which can take eight arguments.
@sealed
class EventWith8Args<A1,A2,A3,A4,A5,A6,A7,A8> {
  final _callbacks = Set<void Function(A1,A2,A3,A4,A5,A6,A7,A8)>();
  
  OffEvent on(void callback(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    return _callbacks.add(callback) ? () { _callbacks.remove(callback); } : _offEvent;
  }

  void off(void callback(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    _callbacks.remove(callback);
  }

  void call(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8) {
    if (_callbacks.isEmpty) return;
    // 防止回调中移除导致报错
    final callbacks = _callbacks.toList();
    callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)));
  }

  void async(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8) {
    if (_callbacks.isEmpty) return;
    // 防止稍后发布事件时回调不一致和回调中移除报错
    final callbacks = _callbacks.toList();
    Future((){
      callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)));
    });
  }
}

/// An event handler which can take nine arguments.
@sealed
class EventWith9Args<A1,A2,A3,A4,A5,A6,A7,A8, A9> {
  final _callbacks = Set<void Function(A1,A2,A3,A4,A5,A6,A7,A8,A9)>();

  OffEvent on(void callback(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    return _callbacks.add(callback) ? () { _callbacks.remove(callback); } : _offEvent;
  }

  void off(void callback(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9)) {
    _debugCheckNullEventCallback(runtimeType, callback);
    _callbacks.remove(callback);
  }

  void call(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9) {
    if (_callbacks.isEmpty) return;
    // 防止回调中移除导致报错
    final callbacks = _callbacks.toList();
    callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)));
  }

  void async(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9) {
    if (_callbacks.isEmpty) return;
    // 防止稍后发布事件时回调不一致和回调中移除报错
    final callbacks = _callbacks.toList();
    Future((){
      callbacks.forEach((callback) => _invoke(this, ()=>callback(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)));
    });
  }
}

void _offEvent() {}

void _invoke<T>(T caller, void callback()) {
  try {
    callback();
  } catch (exception, stack) {
    FlutterError.reportError(FlutterErrorDetails(
      exception: exception,
      stack: stack,
      library: 'flutter_event library',
      context: ErrorDescription('while dispatching events for ${caller.runtimeType}'),
      informationCollector: () sync* {
        yield DiagnosticsProperty<T>(
          'The ${caller.runtimeType} dispatching event was',
          caller,
          style: DiagnosticsTreeStyle.errorProperty,
        );
      },
    ));
  }
}

void _debugCheckNullEventCallback(Type eventType, Function callback) {
  assert((){
    if (callback == null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('''$eventType tried to register or unregister a null callback.''')
      ]);
    }
    return true;
  }());
}