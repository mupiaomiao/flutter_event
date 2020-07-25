import 'package:flutter_event/flutter_event.dart';

class EventBusTester {
  EventBusTester() {
    offEvents.add($eventBus.on(on));

    offEvents.add($eventBus.onData(onInt));
    offEvents.add($eventBus.onData(onDouble));

    offEvents.add($eventBus.on2Data(on2Ints));
    offEvents.add($eventBus.on2Data(on2Doubles));
    offEvents.add($eventBus.on2Data(onIntAndDouble));

    offEvents.add($eventBus.on3Data(on3Ints));
    offEvents.add($eventBus.on3Data(on3Doubles));
    offEvents.add($eventBus.on3Data(on2IntsAndDouble));

    offEvents.add($eventBus.on4Data(on4Ints));
    offEvents.add($eventBus.on4Data(on4Doubles));
    offEvents.add($eventBus.on4Data(on2IntsAnd2Doubles));

    offEvents.add($eventBus.on5Data(on5Ints));
    offEvents.add($eventBus.on5Data(on5Doubles));
    offEvents.add($eventBus.on5Data(on3IntsAnd2Doubles));

    offEvents.add($eventBus.on6Data(on6Ints));
    offEvents.add($eventBus.on6Data(on6Doubles));
    offEvents.add($eventBus.on6Data(on3IntsAnd3Doubles));

    offEvents.add($eventBus.on7Data(on7Ints));
    offEvents.add($eventBus.on7Data(on7Doubles));
    offEvents.add($eventBus.on7Data(on4IntsAnd3Doubles));

    offEvents.add($eventBus.on8Data(on8Ints));
    offEvents.add($eventBus.on8Data(on8Doubles));
    offEvents.add($eventBus.on8Data(on4IntsAnd4Doubles));

    offEvents.add($eventBus.on9Data(on9Ints));
    offEvents.add($eventBus.on9Data(on9Doubles));
    offEvents.add($eventBus.on9Data(on5IntsAnd4Doubles));


    offEvents.add($eventBus.onEvent(Event, onEvent));

    offEvents.add($eventBus.onEventWithArg(Event1, onEventWithInt));
    offEvents.add($eventBus.onEventWithArg(Event1, onEventWithDouble));

    offEvents.add($eventBus.onEventWith2Args(Event2, onEventWith2Ints));
    offEvents.add($eventBus.onEventWith2Args(Event2, onEventWith2Doubles));
    offEvents.add($eventBus.onEventWith2Args(Event2, onEventWithIntAndDouble));

    offEvents.add($eventBus.onEventWith3Args(Event3, onEventWith3Ints));
    offEvents.add($eventBus.onEventWith3Args(Event3, onEventWith3Doubles));
    offEvents.add($eventBus.onEventWith3Args(Event3, onEventWith2IntsAndDouble));

    offEvents.add($eventBus.onEventWith4Args(Event4, onEventWith4Ints));
    offEvents.add($eventBus.onEventWith4Args(Event4, onEventWith4Doubles));
    offEvents.add($eventBus.onEventWith4Args(Event4, onEventWith2IntsAnd2Doubles));

    offEvents.add($eventBus.onEventWith5Args(Event5, onEventWith5Ints));
    offEvents.add($eventBus.onEventWith5Args(Event5, onEventWith5Doubles));
    offEvents.add($eventBus.onEventWith5Args(Event5, onEventWith3IntsAnd2Doubles));

    offEvents.add($eventBus.onEventWith6Args(Event6, onEventWith6Ints));
    offEvents.add($eventBus.onEventWith6Args(Event6, onEventWith6Doubles));
    offEvents.add($eventBus.onEventWith6Args(Event6, onEventWith3IntsAnd3Doubles));

    offEvents.add($eventBus.onEventWith7Args(Event7, onEventWith7Ints));
    offEvents.add($eventBus.onEventWith7Args(Event7, onEventWith7Doubles));
    offEvents.add($eventBus.onEventWith7Args(Event7, onEventWith4IntsAnd3Doubles));

    offEvents.add($eventBus.onEventWith8Args(Event8, onEventWith8Ints));
    offEvents.add($eventBus.onEventWith8Args(Event8, onEventWith8Doubles));
    offEvents.add($eventBus.onEventWith8Args(Event8, onEventWith4IntsAnd4Doubles));

    offEvents.add($eventBus.onEventWith9Args(Event9, onEventWith9Ints));
    offEvents.add($eventBus.onEventWith9Args(Event9, onEventWith9Doubles));
    offEvents.add($eventBus.onEventWith9Args(Event9, onEventWith5IntsAnd4Doubles));
  }

  void dispose() {
    offEvents.forEach((offEvent) => offEvent());
  }

  final offEvents = List<OffEvent>();

  final v1s = List();
  final v2s = List();
  final v3s = List();
  final v4s = List();
  final v5s = List();
  final v6s = List();
  final v7s = List();
  final v8s = List();
  final v9s = List();
  final events = List();

  static const Event = 'event';
  static const Event1 = 'event1';
  static const Event2 = 'event2';
  static const Event3 = 'event3';
  static const Event4 = 'event4';
  static const Event5 = 'event5';
  static const Event6 = 'event6';
  static const Event7 = 'event7';
  static const Event8 = 'event8';
  static const Event9 = 'event9';

  final calleds = List<Function>();

  void on() 
    => calleds.add(on);

  void onInt(int v) {
    v1s.add(v);
    calleds.add(onInt);
  }
  void onDouble(double v) {
    v1s.add(v);
    calleds.add(onDouble);
  }

  void on2Ints(int v1, int v2) {
    v1s.add(v1);
    v2s.add(v2);
    calleds.add(on2Ints);
  }
  void on2Doubles(double v1, double v2) {
    v1s.add(v1);
    v2s.add(v2);
    calleds.add(on2Doubles);
  }
  void onIntAndDouble(int v1, double v2) {
    v1s.add(v1);
    v2s.add(v2);
    calleds.add(onIntAndDouble);
  }

  void on3Ints(int v1, int v2, int v3) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    calleds.add(on3Ints);
  }
  void on3Doubles(double v1, double v2, double v3) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    calleds.add(on3Doubles);
  }
  void on2IntsAndDouble(int v1, int v2, double v3) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    calleds.add(on2IntsAndDouble);
  }

  void on4Ints(int v1, int v2, int v3, int v4) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    calleds.add(on4Ints);
  }
  void on4Doubles(double v1, double v2, double v3, double v4) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    calleds.add(on4Doubles);
  }
  void on2IntsAnd2Doubles(int v1, int v2, double v3, double v4) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    calleds.add(on2IntsAnd2Doubles);
  }

  void on5Ints(int v1, int v2, int v3, int v4, int v5) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    calleds.add(on5Ints);
  }
  void on5Doubles(double v1, double v2, double v3, double v4, double v5) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    calleds.add(on5Doubles);
  }
  void on3IntsAnd2Doubles(int v1, int v2, int v3, double v4, double v5) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    calleds.add(on3IntsAnd2Doubles);
  }

  void on6Ints(int v1, int v2, int v3, int v4, int v5, int v6) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    calleds.add(on6Ints);
  }
  void on6Doubles(double v1, double v2, double v3, double v4, double v5, double v6) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    calleds.add(on6Doubles);
  }
  void on3IntsAnd3Doubles(int v1, int v2, int v3, double v4, double v5, double v6) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    calleds.add(on3IntsAnd3Doubles);
  }

  void on7Ints(int v1, int v2, int v3, int v4, int v5, int v6, int v7) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    calleds.add(on7Ints);
  }
  void on7Doubles(double v1, double v2, double v3, double v4, double v5, double v6, double v7) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    calleds.add(on7Doubles);
  }
  void on4IntsAnd3Doubles(int v1, int v2, int v3, int v4, double v5, double v6, double v7) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    calleds.add(on4IntsAnd3Doubles);
  }

  void on8Ints(int v1, int v2, int v3, int v4, int v5, int v6, int v7, int v8) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    v8s.add(v8);
    calleds.add(on8Ints);
  }
  void on8Doubles(double v1, double v2, double v3, double v4, double v5, double v6, double v7, double v8) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    v8s.add(v8);
    calleds.add(on8Doubles);
  }
  void on4IntsAnd4Doubles(int v1, int v2, int v3, int v4, double v5, double v6, double v7, double v8) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    v8s.add(v8);
    calleds.add(on4IntsAnd4Doubles);
  }

  void on9Ints(int v1, int v2, int v3, int v4, int v5, int v6, int v7, int v8, int v9) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    v8s.add(v8);
    v9s.add(v9);
    calleds.add(on9Ints);
  }
  void on9Doubles(double v1, double v2, double v3, double v4, double v5, double v6, double v7, double v8, double v9) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    v8s.add(v8);
    v9s.add(v9);
    calleds.add(on9Doubles);
  }
  void on5IntsAnd4Doubles(int v1, int v2, int v3, int v4, int v5, double v6, double v7, double v8, double v9) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    v8s.add(v8);
    v9s.add(v9);
    calleds.add(on5IntsAnd4Doubles);
  }

  void onEvent(String event) {
    events.add(event);
    calleds.add(onEvent);
  }

  void onEventWithInt(String event, int v) {
    v1s.add(v);
    events.add(event);
    calleds.add(onEventWithInt);
  }
  void onEventWithDouble(String event, double v) {
    v1s.add(v);
    events.add(event);
    calleds.add(onEventWithDouble);
  }

  void onEventWith2Ints(String event, int v1, int v2) {
    v1s.add(v1);
    v2s.add(v2);
    events.add(event);
    calleds.add(onEventWith2Ints);
  }
  void onEventWith2Doubles(String event, double v1, double v2) {
    v1s.add(v1);
    v2s.add(v2);
    events.add(event);
    calleds.add(onEventWith2Doubles);
  }
  void onEventWithIntAndDouble(String event, int v1, double v2) {
    v1s.add(v1);
    v2s.add(v2);
    events.add(event);
    calleds.add(onEventWithIntAndDouble);
  }

  void onEventWith3Ints(String event, int v1, int v2, int v3) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    events.add(event);
    calleds.add(onEventWith3Ints);
  }
  void onEventWith3Doubles(String event, double v1, double v2, double v3) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    events.add(event);
    calleds.add(onEventWith3Doubles);
  }
  void onEventWith2IntsAndDouble(String event, int v1, int v2, double v3) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    events.add(event);
    calleds.add(onEventWith2IntsAndDouble);
  }

  void onEventWith4Ints(String event, int v1, int v2, int v3, int v4) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    events.add(event);
    calleds.add(onEventWith4Ints);
  }
  void onEventWith4Doubles(String event, double v1, double v2, double v3, double v4) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    events.add(event);
    calleds.add(onEventWith4Doubles);
  }
  void onEventWith2IntsAnd2Doubles(String event, int v1, int v2, double v3, double v4) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    events.add(event);
    calleds.add(onEventWith2IntsAnd2Doubles);
  }

  void onEventWith5Ints(String event, int v1, int v2, int v3, int v4, int v5) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    events.add(event);
    calleds.add(onEventWith5Ints);
  }
  void onEventWith5Doubles(String event, double v1, double v2, double v3, double v4, double v5) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    events.add(event);
    calleds.add(onEventWith5Doubles);
  }
  void onEventWith3IntsAnd2Doubles(String event, int v1, int v2, int v3, double v4, double v5) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    events.add(event);
    calleds.add(onEventWith3IntsAnd2Doubles);
  }

  void onEventWith6Ints(String event, int v1, int v2, int v3, int v4, int v5, int v6) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    events.add(event);
    calleds.add(onEventWith6Ints);
  }
  void onEventWith6Doubles(String event, double v1, double v2, double v3, double v4, double v5, double v6) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    events.add(event);
    calleds.add(onEventWith6Doubles);
  }
  void onEventWith3IntsAnd3Doubles(String event, int v1, int v2, int v3, double v4, double v5, double v6) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    events.add(event);
    calleds.add(onEventWith3IntsAnd3Doubles);
  }

  void onEventWith7Ints(String event, int v1, int v2, int v3, int v4, int v5, int v6, int v7) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    events.add(event);
    calleds.add(onEventWith7Ints);
  }
  void onEventWith7Doubles(String event, double v1, double v2, double v3, double v4, double v5, double v6, double v7) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    events.add(event);
    calleds.add(onEventWith7Doubles);
  }
  void onEventWith4IntsAnd3Doubles(String event, int v1, int v2, int v3, int v4, double v5, double v6, double v7) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    events.add(event);
    calleds.add(onEventWith4IntsAnd3Doubles);
  }

  void onEventWith8Ints(String event, int v1, int v2, int v3, int v4, int v5, int v6, int v7, int v8) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    v8s.add(v8);
    events.add(event);
    calleds.add(onEventWith8Ints);
  }
  void onEventWith8Doubles(String event, double v1, double v2, double v3, double v4, double v5, double v6, double v7, double v8) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    v8s.add(v8);
    events.add(event);
    calleds.add(onEventWith8Doubles);
  }
  void onEventWith4IntsAnd4Doubles(String event, int v1, int v2, int v3, int v4, double v5, double v6, double v7, double v8) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    v8s.add(v8);
    events.add(event);
    calleds.add(onEventWith4IntsAnd4Doubles);
  }

  void onEventWith9Ints(String event, int v1, int v2, int v3, int v4, int v5, int v6, int v7, int v8, int v9) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    v8s.add(v8);
    v9s.add(v9);
    events.add(event);
    calleds.add(onEventWith9Ints);
  }
  void onEventWith9Doubles(String event, double v1, double v2, double v3, double v4, double v5, double v6, double v7, double v8, double v9) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    v8s.add(v8);
    v9s.add(v9);
    events.add(event);
    calleds.add(onEventWith9Doubles);
  }
  void onEventWith5IntsAnd4Doubles(String event, int v1, int v2, int v3, int v4, int v5, double v6, double v7, double v8, double v9) {
    v1s.add(v1);
    v2s.add(v2);
    v3s.add(v3);
    v4s.add(v4);
    v5s.add(v5);
    v6s.add(v6);
    v7s.add(v7);
    v8s.add(v8);
    v9s.add(v9);
    events.add(event);
    calleds.add(onEventWith5IntsAnd4Doubles);
  }
}