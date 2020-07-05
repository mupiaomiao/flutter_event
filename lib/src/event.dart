import 'dart:async';
import './off_event.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';

abstract class EventArgs {
  const EventArgs();
}

@sealed
class Event {
  final _handlers = Set<void Function()>();

  OffEvent on(void handler()) {
    _debugCheckRegisteringNullEventHandler(runtimeType, handler);
    if (_handlers.add(handler)) {
      return () { _handlers.remove(handler); };
    }
    return _offEvent;
  }

  void off(void handler()) {
    _debugCheckUnregisteringNullEventHandler(runtimeType, handler);
    _handlers.remove(handler);
  }

  /// 当async = false发布同步事件，默认发布异步事件
  void call({bool async = true}) {
    if (_handlers.isEmpty) return;
    // 防止回调中移除导致报错
    final handlers = _handlers.toList();
    if (async == false) {
      handlers.forEach((handler) => _invoke(this, handler));
    } else {
      scheduleMicrotask((){
        handlers.forEach((handler) => _invoke(this, handler));
      });
    }
  }
}

@sealed
class Event1<A> {
  final _handlers = Set<void Function(A)>();
  
  OffEvent on(void handler(A arg)) {
    _debugCheckRegisteringNullEventHandler(runtimeType, handler);
    if (_handlers.add(handler)) {
      return () { _handlers.remove(handler); };
    }
    return _offEvent;
  }

  void off(void handler(A arg)) {
    _debugCheckUnregisteringNullEventHandler(runtimeType, handler);
    _handlers.remove(handler);
  }

  /// 当async = false发布同步事件，默认发布异步事件
  void call(A arg, {bool async = true}) {
    if (_handlers.isEmpty) return;
    // 防止回调中移除导致报错
    final handlers = _handlers.toList();
    if (async == false) {
      handlers.forEach((handler) => _invoke(this, ()=>handler(arg)));
    } else {
      scheduleMicrotask((){
        handlers.forEach((handler) => _invoke(this, ()=>handler(arg)));
      });
    }
  }
}

@sealed
class Event2<A1,A2> {
  final _handlers = Set<void Function(A1,A2)>();
  
  OffEvent on(void handler(A1 arg1, A2 arg2)) {
    _debugCheckRegisteringNullEventHandler(runtimeType, handler);
    if (_handlers.add(handler)) {
      return () { _handlers.remove(handler); };
    }
    return _offEvent;
  }

  void off(void handler(A1 arg1, A2 arg2)) {
    _debugCheckUnregisteringNullEventHandler(runtimeType, handler);
    _handlers.remove(handler);
  }

  /// 当async = false发布同步事件，默认发布异步事件
  void call(A1 arg1, A2 arg2, {bool async = true}) {
    if (_handlers.isEmpty) return;
    // 防止回调中移除导致报错
    final handlers = _handlers.toList();
    if (async == false) {
      handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2)));
    } else {
      scheduleMicrotask((){
        handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2)));
      });
    }
  }
}

@sealed
class Event3<A1,A2,A3> {
  final _handlers = Set<void Function(A1,A2,A3)>();
  
  OffEvent on(void handler(A1 arg1, A2 arg2, A3 arg3)) {
    _debugCheckRegisteringNullEventHandler(runtimeType, handler);
    if (_handlers.add(handler)) {
      return () { _handlers.remove(handler); };
    }
    return _offEvent;
  }

  void off(void handler(A1 arg1, A2 arg2, A3 arg3)) {
    _debugCheckUnregisteringNullEventHandler(runtimeType, handler);
    _handlers.remove(handler);
  }

  /// 当async = false发布同步事件，默认发布异步事件
  void call(A1 arg1, A2 arg2, A3 arg3, {bool async = true}) {
    if (_handlers.isEmpty) return;
    // 防止回调中移除导致报错
    final handlers = _handlers.toList();
    if (async == false) {
      handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3)));
    } else {
      scheduleMicrotask((){
        handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3)));
      });
    }
  }
}

@sealed
class Event4<A1,A2,A3,A4> {
  final _handlers = Set<void Function(A1,A2,A3,A4)>();
  
  OffEvent on(void handler(A1 arg1, A2 arg2, A3 arg3, A4 arg4)) {
    _debugCheckRegisteringNullEventHandler(runtimeType, handler);
    if (_handlers.add(handler)) {
      return () { _handlers.remove(handler); };
    }
    return _offEvent;
  }

  void off(void handler(A1 arg1, A2 arg2, A3 arg3, A4 arg4)) {
    _debugCheckUnregisteringNullEventHandler(runtimeType, handler);
    _handlers.remove(handler);
  }

  /// 当async = false发布同步事件，默认发布异步事件
  void call(A1 arg1, A2 arg2, A3 arg3, A4 arg4, {bool async = true}) {
    if (_handlers.isEmpty) return;
    // 防止回调中移除导致报错
    final handlers = _handlers.toList();
    if (async == false) {
      handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3, arg4)));
    } else {
      scheduleMicrotask((){
        handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3, arg4)));
      });
    }
  }
}

@sealed
class Event5<A1,A2,A3,A4,A5> {
  final _handlers = Set<void Function(A1,A2,A3,A4,A5)>();
  
  OffEvent on(void handler(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5)) {
    _debugCheckRegisteringNullEventHandler(runtimeType, handler);
    if (_handlers.add(handler)) {
      return () { _handlers.remove(handler); };
    }
    return _offEvent;
  }

  void off(void handler(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5)) {
    _debugCheckUnregisteringNullEventHandler(runtimeType, handler);
    _handlers.remove(handler);
  }

  /// 当async = false发布同步事件，默认发布异步事件
  void call(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, {bool async = true}) {
    if (_handlers.isEmpty) return;
    // 防止回调中移除导致报错
    final handlers = _handlers.toList();
    if (async == false) {
      handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3, arg4, arg5)));
    } else {
      scheduleMicrotask((){
        handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3, arg4, arg5)));
      });
    }
  }
}

@sealed
class Event6<A1,A2,A3,A4,A5,A6> {
  final _handlers = Set<void Function(A1,A2,A3,A4,A5,A6)>();
  
  OffEvent on(void handler(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6)) {
    _debugCheckRegisteringNullEventHandler(runtimeType, handler);
    if (_handlers.add(handler)) {
      return () { _handlers.remove(handler); };
    }
    return _offEvent;
  }

  void off(void handler(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6)) {
    _debugCheckUnregisteringNullEventHandler(runtimeType, handler);
    _handlers.remove(handler);
  }

  /// 当async = false发布同步事件，默认发布异步事件
  void call(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, {bool async = true}) {
    if (_handlers.isEmpty) return;
    // 防止回调中移除导致报错
    final handlers = _handlers.toList();
    if (async == false) {
      handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3, arg4, arg5, arg6)));
    } else {
      scheduleMicrotask((){
        handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3, arg4, arg5, arg6)));
      });
    }
  }
}

@sealed
class Event7<A1,A2,A3,A4,A5,A6,A7> {
  final _handlers = Set<void Function(A1,A2,A3,A4,A5,A6,A7)>();
  
  OffEvent on(void handler(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7)) {
    _debugCheckRegisteringNullEventHandler(runtimeType, handler);
    if (_handlers.add(handler)) {
      return () { _handlers.remove(handler); };
    }
    return _offEvent;
  }

  void off(void handler(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7)) {
    _debugCheckUnregisteringNullEventHandler(runtimeType, handler);
    _handlers.remove(handler);
  }

  /// 当async = false发布同步事件，默认发布异步事件
  void call(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, {bool async = true}) {
    if (_handlers.isEmpty) return;
    // 防止回调中移除导致报错
    final handlers = _handlers.toList();
    if (async == false) {
      handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3, arg4, arg5, arg6, arg7)));
    } else {
      scheduleMicrotask((){
        handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3, arg4, arg5, arg6, arg7)));
      });
    }
  }
}

@sealed
class Event8<A1,A2,A3,A4,A5,A6,A7,A8> {
  final _handlers = Set<void Function(A1,A2,A3,A4,A5,A6,A7,A8)>();
  
  OffEvent on(void handler(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8)) {
    _debugCheckRegisteringNullEventHandler(runtimeType, handler);
    if (_handlers.add(handler)) {
      return () { _handlers.remove(handler); };
    }
    return _offEvent;
  }

  void off(void handler(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8)) {
    _debugCheckUnregisteringNullEventHandler(runtimeType, handler);
    _handlers.remove(handler);
  }

  /// 当async = false发布同步事件，默认发布异步事件
  void call(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, {bool async = true}) {
    if (_handlers.isEmpty) return;
    // 防止回调中移除导致报错
    final handlers = _handlers.toList();
    if (async == false) {
      handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)));
    } else {
      scheduleMicrotask((){
        handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8)));
      });
    }
  }
}

@sealed
class Event9<A1,A2,A3,A4,A5,A6,A7,A8, A9> {
  final _handlers = Set<void Function(A1,A2,A3,A4,A5,A6,A7,A8,A9)>();
  
  OffEvent on(void handler(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9)) {
    _debugCheckRegisteringNullEventHandler(runtimeType, handler);
    if (_handlers.add(handler)) {
      return () { _handlers.remove(handler); };
    }
    return _offEvent;
  }

  void off(void handler(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9)) {
    _debugCheckUnregisteringNullEventHandler(runtimeType, handler);
    _handlers.remove(handler);
  }

  /// 当async = false发布同步事件，默认发布异步事件
  void call(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9, {bool async = true}) {
    if (_handlers.isEmpty) return;
    // 防止回调中移除导致报错
    final handlers = _handlers.toList();
    if (async == false) {
      handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)));
    } else {
      scheduleMicrotask((){
        handlers.forEach((handler) => _invoke(this, ()=>handler(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9)));
      });
    }
  }
}

void _offEvent() {}

void _invoke<T>(T caller, void handler()) {
  try {
    handler();
  } catch (exception, stack) {
    FlutterError.reportError(FlutterErrorDetails(
      exception: exception,
      stack: stack,
      library: 'mpm library',
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

void _debugCheckRegisteringNullEventHandler(Type eventType, Function handler) {
  assert((){
    if (handler == null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('''$eventType tried to register null handler.''')
      ]);
    }
    return true;
  }());
}

void _debugCheckUnregisteringNullEventHandler(Type eventType, Function handler) {
  assert((){
    if (handler == null) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('''$eventType tried to unregister null handler.''')
      ]);
    }
    return true;
  }());
}