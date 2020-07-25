import 'package:test/test.dart';
import './src/event_bus_tester.dart';
import 'package:flutter_event/flutter_event.dart';

void main() { 
  group('Event bus test', () {
    test('Event bus callbacks count', (){
      final tester = EventBusTester();
      expect($eventBus.callbacksCount, tester.offEvents.length);
      tester.dispose();
      expect($eventBus.callbacksCount, 0);
    });

    test('"on" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit();

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on, true);
      expect(tester.v1s.length == 0, true);
      expect(tester.v2s.length == 0, true);
      expect(tester.v3s.length == 0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });

    test('"onInt" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitData(1);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onInt, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 0, true);
      expect(tester.v3s.length == 0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"onDouble" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitData(1.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onDouble, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 0, true);
      expect(tester.v3s.length == 0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });

    test('"on2Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit2Data(1, 2);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on2Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on2Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit2Data(1.0, 2.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on2Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"onIntAndDouble" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit2Data(1, 2.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onIntAndDouble, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });

    test('"on3Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit3Data(1, 2, 3);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on3Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on3Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit3Data(1.0, 2.0, 3.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on3Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on2IntsAndDouble" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit3Data(1, 2, 3.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on2IntsAndDouble, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });

    test('"on4Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit4Data(1, 2, 3, 4);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on4Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on4Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit4Data(1.0, 2.0, 3.0, 4.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on4Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on2IntsAnd2Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit4Data(1, 2, 3.0, 4.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on2IntsAnd2Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });

    test('"on5Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit5Data(1, 2, 3, 4, 5);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on5Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on5Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit5Data(1.0, 2.0, 3.0, 4.0, 5.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on5Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on3IntsAnd2Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit5Data(1, 2, 3, 4.0, 5.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on3IntsAnd2Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });

    test('"on6Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit6Data(1, 2, 3, 4, 5, 6);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on6Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on6Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit6Data(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on6Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on3IntsAnd3Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit6Data(1, 2, 3, 4.0, 5.0, 6.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on3IntsAnd3Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });

    test('"on7Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit7Data(1, 2, 3, 4, 5, 6, 7);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on7Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on7Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit7Data(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on7Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7.0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on4IntsAnd3Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit7Data(1, 2, 3, 4, 5.0, 6.0, 7.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on4IntsAnd3Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7.0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });

    test('"on8Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit8Data(1, 2, 3, 4, 5, 6, 7, 8);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on8Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7, true);
      expect(tester.v8s.length == 1 && tester.v8s[0] == 8, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on8Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit8Data(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on8Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7.0, true);
      expect(tester.v8s.length == 1 && tester.v8s[0] == 8.0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on4IntsAnd4Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit8Data(1, 2, 3, 4, 5.0, 6.0, 7.0, 8.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on4IntsAnd4Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7.0, true);
      expect(tester.v8s.length == 1 && tester.v8s[0] == 8.0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });

    test('"on9Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit9Data(1, 2, 3, 4, 5, 6, 7, 8, 9);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on9Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7, true);
      expect(tester.v8s.length == 1 && tester.v8s[0] == 8, true);
      expect(tester.v9s.length == 1 && tester.v9s[0] == 9, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on9Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit9Data(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on9Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7.0, true);
      expect(tester.v8s.length == 1 && tester.v8s[0] == 8.0, true);
      expect(tester.v9s.length == 1 && tester.v9s[0] == 9.0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });
    test('"on5IntsAnd4Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emit9Data(1, 2, 3, 4, 5, 6.0, 7.0, 8.0, 9.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.on5IntsAnd4Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7.0, true);
      expect(tester.v8s.length == 1 && tester.v8s[0] == 8.0, true);
      expect(tester.v9s.length == 1 && tester.v9s[0] == 9.0, true);
      expect(tester.events.length == 0, true);

      tester.dispose();
    });test('"onEvent" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEvent(EventBusTester.Event);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEvent, true);
      expect(tester.v1s.length == 0, true);
      expect(tester.v2s.length == 0, true);
      expect(tester.v3s.length == 0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event, true);

      tester.dispose();
    });

    test('"onEventWithInt" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWithArg(EventBusTester.Event1, 1);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWithInt, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 0, true);
      expect(tester.v3s.length == 0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event1, true);

      tester.dispose();
    });
    test('"onEventWithDouble" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWithArg(EventBusTester.Event1, 1.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWithDouble, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 0, true);
      expect(tester.v3s.length == 0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event1, true);

      tester.dispose();
    });

    test('"onEventWith2Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith2Args(EventBusTester.Event2, 1, 2);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith2Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event2, true);

      tester.dispose();
    });
    test('"onEventWith2Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith2Args(EventBusTester.Event2, 1.0, 2.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith2Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event2, true);

      tester.dispose();
    });
    test('"onEventWithIntAndDouble" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith2Args(EventBusTester.Event2, 1, 2.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWithIntAndDouble, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event2, true);

      tester.dispose();
    });

    test('"onEventWith3Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith3Args(EventBusTester.Event3, 1, 2, 3);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith3Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event3, true);

      tester.dispose();
    });
    test('"onEventWith3Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith3Args(EventBusTester.Event3, 1.0, 2.0, 3.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith3Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event3, true);

      tester.dispose();
    });
    test('"onEventWith2IntsAndDouble" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith3Args(EventBusTester.Event3, 1, 2, 3.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith2IntsAndDouble, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event3, true);

      tester.dispose();
    });

    test('"onEventWith4Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith4Args(EventBusTester.Event4, 1, 2, 3, 4);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith4Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event4, true);

      tester.dispose();
    });
    test('"onEventWith4Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith4Args(EventBusTester.Event4, 1.0, 2.0, 3.0, 4.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith4Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event4, true);

      tester.dispose();
    });
    test('"onEventWith2IntsAnd2Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith4Args(EventBusTester.Event4, 1, 2, 3.0, 4.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith2IntsAnd2Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event4, true);

      tester.dispose();
    });

    test('"onEventWith5Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith5Args(EventBusTester.Event5, 1, 2, 3, 4, 5);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith5Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event5, true);

      tester.dispose();
    });
    test('"onEventWith5Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith5Args(EventBusTester.Event5, 1.0, 2.0, 3.0, 4.0, 5.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith5Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event5, true);

      tester.dispose();
    });
    test('"onEventWith3IntsAnd2Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith5Args(EventBusTester.Event5, 1, 2, 3, 4.0, 5.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith3IntsAnd2Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event5, true);

      tester.dispose();
    });

    test('"onEventWith6Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith6Args(EventBusTester.Event6, 1, 2, 3, 4, 5, 6);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith6Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event6, true);

      tester.dispose();
    });
    test('"onEventWith6Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith6Args(EventBusTester.Event6, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith6Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event6, true);

      tester.dispose();
    });
    test('"onEventWith3IntsAnd3Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith6Args(EventBusTester.Event6, 1, 2, 3, 4.0, 5.0, 6.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith3IntsAnd3Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event6, true);

      tester.dispose();
    });

    test('"onEventWith7Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith7Args(EventBusTester.Event7, 1, 2, 3, 4, 5, 6, 7);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith7Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event7, true);

      tester.dispose();
    });
    test('"onEventWith7Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith7Args(EventBusTester.Event7, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith7Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7.0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event7, true);

      tester.dispose();
    });
    test('"onEventWith4IntsAnd3Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith7Args(EventBusTester.Event7, 1, 2, 3, 4, 5.0, 6.0, 7.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith4IntsAnd3Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7.0, true);
      expect(tester.v8s.length == 0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event7, true);

      tester.dispose();
    });

    test('"onEventWith8Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith8Args(EventBusTester.Event8, 1, 2, 3, 4, 5, 6, 7, 8);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith8Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7, true);
      expect(tester.v8s.length == 1 && tester.v8s[0] == 8, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event8, true);

      tester.dispose();
    });
    test('"onEventWith8Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith8Args(EventBusTester.Event8, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith8Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7.0, true);
      expect(tester.v8s.length == 1 && tester.v8s[0] == 8.0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event8, true);

      tester.dispose();
    });
    test('"onEventWith4IntsAnd4Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith8Args(EventBusTester.Event8, 1, 2, 3, 4, 5.0, 6.0, 7.0, 8.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith4IntsAnd4Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7.0, true);
      expect(tester.v8s.length == 1 && tester.v8s[0] == 8.0, true);
      expect(tester.v9s.length == 0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event8, true);

      tester.dispose();
    });

    test('"onEventWith9Ints" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith9Args(EventBusTester.Event9, 1, 2, 3, 4, 5, 6, 7, 8, 9);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith9Ints, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7, true);
      expect(tester.v8s.length == 1 && tester.v8s[0] == 8, true);
      expect(tester.v9s.length == 1 && tester.v9s[0] == 9, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event9, true);

      tester.dispose();
    });
    test('"onEventWith9Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith9Args(EventBusTester.Event9, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith9Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1.0, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2.0, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3.0, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4.0, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5.0, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7.0, true);
      expect(tester.v8s.length == 1 && tester.v8s[0] == 8.0, true);
      expect(tester.v9s.length == 1 && tester.v9s[0] == 9.0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event9, true);

      tester.dispose();
    });
    test('"onEventWith5IntsAnd4Doubles" should be called', () {
      final tester = EventBusTester();

      $eventBus.emitEventWith9Args(EventBusTester.Event9, 1, 2, 3, 4, 5, 6.0, 7.0, 8.0, 9.0);

      expect(tester.calleds.length == 1 && tester.calleds[0] == tester.onEventWith5IntsAnd4Doubles, true);
      expect(tester.v1s.length == 1 && tester.v1s[0] == 1, true);
      expect(tester.v2s.length == 1 && tester.v2s[0] == 2, true);
      expect(tester.v3s.length == 1 && tester.v3s[0] == 3, true);
      expect(tester.v4s.length == 1 && tester.v4s[0] == 4, true);
      expect(tester.v5s.length == 1 && tester.v5s[0] == 5, true);
      expect(tester.v6s.length == 1 && tester.v6s[0] == 6.0, true);
      expect(tester.v7s.length == 1 && tester.v7s[0] == 7.0, true);
      expect(tester.v8s.length == 1 && tester.v8s[0] == 8.0, true);
      expect(tester.v9s.length == 1 && tester.v9s[0] == 9.0, true);
      expect(tester.events.length == 1 && tester.events[0] == EventBusTester.Event9, true);

      tester.dispose();
    });
  });
}