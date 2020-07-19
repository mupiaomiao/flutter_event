 # 1. Event  
&emsp;&emsp;  
## 1.1 Create event handlers  
&emsp;&emsp;You can create an event handler through the following ways:
  ```dart
    final someEvent = Event();  // create an event handler which can take zero argument.
    final someEventWithArg = EventWithArg<A>();  // create an event handler which can take one argument.
    final someEventWith2Args = EventWith2Args<A1,A2>();  // create an event handler which can take two arguments.
    final someEventWith3Args = EventWith3Args<A1,A2,A3>();  // create an event handler which can take three arguments.
    final someEventWith4Args = EventWith4Args<A1,A2,A3,A4>();  // create an event handler which can take four arguments.
    final someEventWith5Args = EventWith5Args<A1,A2,A3,A4,A5>();  // create an event handler which can take five arguments.
    final someEventWith6Args = EventWith6Args<A1,A2,A3,A4,A5,A6>();  // create an event handler which can take six arguments.
    final someEventWith7Args = EventWith7Args<A1,A2,A3,A4,A5,A6,A7>();  // create an event handler which can take seven arguments.
    final someEventWith8Args = EventWith8Args<A1,A2,A3,A4,A5,A6,A7,A8>();  // create an event handler which can take eight arguments.
    final someEventWith9Args = EventWith9Args<A1,A2,A3,A4,A5,A6,A7,A8,A9>();  // create an event handler which can take nine arguments.
  ```
## 1.2 Register callbacks  
&emsp;&emsp;You can register callbacks through the following ways:  
&emsp;&emsp;At first, we define some callbacks:  
  ```dart
    void someCallback() {
      // some codes
    }

    void someCallbackWithArg(A arg) {
      // some codes
    }

    void someCallbackWith2Args(A1 arg1, A2 arg2) {
      // some codes
    }

    void someCallbackWith3Args(A1 arg1, A2 arg2, A3 arg3) {
      // some codes
    }

    void someCallbackWith4Args(A1 arg1, A2 arg2, A3 arg3, A4 arg4) {
      // some codes
    }

    void someCallbackWith5Args(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5) {
      // some codes
    }

    void someCallbackWith6Args(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6) {
      // some codes
    }

    void someCallbackWith7Args(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7) {
      // some codes
    }

    void someCallbackWith8Args(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8) {
      // some codes
    }

    void someCallbackWith9Args(A1 arg1, A2 arg2, A3 arg3, A4 arg4, A5 arg5, A6 arg6, A7 arg7, A8 arg8, A9 arg9) {
      // some codes
    }
  ```
&emsp;&emsp;And then, we can register callbacks through the following ways:  
  ```dart
    final offEvent0 = someEvent.on(someCallback);
    final offEvent1 = someEventWithArg.on(someCallbackWithArg);
    final offEvent2 = someEventWith2Args.on(someCallbackWith2Args);
    final offEvent3 = someEventWith3Args.on(someCallbackWith3Args);
    final offEvent4 = someEventWith4Args.on(someCallbackWith4Args);
    final offEvent5 = someEventWith5Args.on(someCallbackWith5Args);
    final offEvent6 = someEventWith6Args.on(someCallbackWith6Args);
    final offEvent7 = someEventWith7Args.on(someCallbackWith7Args);
    final offEvent8 = someEventWith8Args.on(someCallbackWith8Args);
    final offEvent9 = someEventWith9Args.on(someCallbackWith9Args);
  ```
## 1.3 Fire events  
&emsp;&emsp;You can fire events synchronously or asynchronously.  
&emsp;&emsp;- Fire an event synchronously:  
  ```dart
    someEvent();  // fire an event without argument synchronously.
    someEventWithArg(arg); // fire an event with one argument synchronously.
    someEventWith2Args(arg1, arg2);  // fire an event with two arguments synchronously.
    someEventWith3Args(arg1, arg2, arg3);  // fire an event with three arguments synchronously.
    someEventWith4Args(arg1, arg2, arg3, arg4);  // fire an event with four arguments synchronously.
    someEventWith5Args(arg1, arg2, arg3, arg4, arg5);  // fire an event with five arguments synchronously.
    someEventWith6Args(arg1, arg2, arg3, arg4, arg5, arg6);  // fire an event with six arguments synchronously.
    someEventWith7Args(arg1, arg2, arg3, arg4, arg5, arg6, arg7);  // fire an event with seven arguments synchronously.
    someEventWith8Args(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);  // fire an event with eight arguments synchronously.
    someEventWith9Args(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);  // fire an event with nine arguments synchronously.
  ```
&emsp;&emsp;- Fire an event asynchronously:  
  ```dart
    someEvent.async();  // fire an event without argument asynchronously.
    someEventWithArg.async(arg); // fire an event with one argument asynchronously.
    someEventWith2Args.async(arg1, arg2);  // fire an event with two arguments asynchronously.
    someEventWith3Args.async(arg1, arg2, arg3);  // fire an event with three arguments asynchronously.
    someEventWith4Args.async(arg1, arg2, arg3, arg4);  // fire an event with four arguments asynchronously.
    someEventWith5Args.async(arg1, arg2, arg3, arg4, arg5);  // fire an event with five arguments asynchronously.
    someEventWith6Args.async(arg1, arg2, arg3, arg4, arg5, arg6);  // fire an event with six arguments asynchronously.
    someEventWith7Args.async(arg1, arg2, arg3, arg4, arg5, arg6, arg7);  // fire an event with seven arguments asynchronously.
    someEventWith8Args.async(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);  // fire an event with eight arguments asynchronously.
    someEventWith9Args.async(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9);  // fire an event with nine arguments asynchronously.
  ```
## 1.4 Unregister callbacks  
&emsp;&emsp;You can unregister callbacks through the following ways:  
  ```dart
    someEvent.off(someCallback); // or call offEvent0
    someEventWithArg.off(someCallbackWithArg); // or call offEvent1
    someEventWith2Args.off(someCallbackWith2Args); // or call offEvent2
    someEventWith3Args.off(someCallbackWith3Args); // or call offEvent3
    someEventWith4Args.off(someCallbackWith4Args); // or call offEvent4
    someEventWith5Args.off(someCallbackWith5Args); // or call offEvent5
    someEventWith6Args.off(someCallbackWith6Args); // or call offEvent6
    someEventWith7Args.off(someCallbackWith7Args); // or call offEvent7
    someEventWith8Args.off(someCallbackWith8Args); // or call offEvent8
    someEventWith9Args.off(someCallbackWith9Args); // or call offEvent9
  ```

# 2. EventBus  
&emsp;&emsp;EventBus can fire events cross pages and components. You can hold the global single instance by the top level variable `$eventBus` or calling `factory EventBus()`.  
&emsp;&emsp;- Register: Event callbacks registered through methods such as "on", "onData" and "on2Data" can receive events with the same number, type, and parameter sequence as the callback function signature. However, sometimes the above methods cannot meet the requirements. We can call "onEvent", "onEventWithArg", "onEventWith2Args" and other methods to register and mark an event callback, the events that the callback can receive not only require the same number, type, and parameter sequence as the callback function signature, and also require the same identifier as the identifier named event used when registering the callback.  
&emsp;&emsp;- Unregister: Call the `off` method to unregister a callback without identifier, and call the `offEvent` method to unregister a callback with identifier.  
&emsp;&emsp;- Fire events: Call the methods beginning with `emit` to fire events synchronously. Call the `$eventBus.async`'s methods to fire events asynchronously.  
&emsp;&emsp;example：  
  ```dart
    class SomeWidgetState extends State<SomeWidget> {
      OffEvent offEvent1;
      OffEvent offEvent2;

      @override
      void initState() {
        super.initState();
        offEvent1 = $eventBus.on3Data(on3Data);
        offEvent2 = $eventBus.onEventWithArg("test", onTestWith3Args);
      }

      void on3Data(int data1, String data2, double data3) {
        // some codes
      }

      void onTestWith3Args(String event, int arg1, String arg2, double arg3) {
        // some codes
      }

      @override
      void dispose() {
        offEvent1();  // or $eventBus.off(on3Data);
        offEvent2();  // or $eventBus.offEvent("test", onTestWith3Args);
        super.dispose();
      }
    }
  ```
&emsp;&emsp;- The `SomeWidgetState.on3Data` can receive such as the following events:  
  ```dart
    $eventBus.emit3Data(22, "Hi", 33.0);
    $eventBus.emit3Data(2, 'Good', 33.9);
    $eventBus.async.emit3Data(33, 'Wo', 99.0);
  ```
&emsp;&emsp;but cannot receive such as the following events:  
  ```dart
    $eventBus.emit3Data(1, 1, 1);
    $eventBus.async.emit3Data(1, 1, 1);
    $eventBus.emit3Data('Hi', 1, 23.0);
    $eventBus.emit3Data(22.0, "Hi", 33);
    $eventBus.emit4Data(1, 'Hi', 12.0, 44);
    $eventBus.emitEventWith2Args(2, "Good", 33.9);
  ```
&emsp;&emsp;- The `SomeWidgetState.onTestWith3Args` can receive such as the following events:  
  ```dart
    $eventBus.emitEventWith3Args("test", 12, "Hi", 33.5);
    $eventBus.emitEventWith3Args("test", 22, "Good", 102.0);
    $eventBus.async.emitEventWith3Args("test", 12, "Goods", 44.0);
  ```
&emsp;&emsp;but cannot receive the following events:  
  ```dart
    $eventBus.emit4Data("test", 12, "Hi", 33.5);
    $eventBus.emitEventWith3Args("test1", 12, "Hi", 33.5);
    $eventBus.emitEventWith3Args("test", "Hi", 12, 33.5);
    $eventBus.emitEventWith3Args("Test", "Hi", 12, 33.5);
    $eventBus.emitEventWith4Args("test", 12, "Hi", 33.5, 33);
    $eventBus.async.emit4Data("test", 12, "Hi", 33.9);
  ```
# 3. EventBusManager  
&emsp;&emsp; The callbacks registered on EventBus should be unregistered one by one when they are no needed any more. It is a heavy work if there are many callbacks and will lead to memory leaks if forgot unregistering any one callback.  
&emsp;&emsp; An EventBusManager instance can release all callbacks registered on EventBus through it when call its `dispose`.  
  ```dart
    class _SomeWidgetState extends State<SomeWidget> {
      final eventBusManager = EventBusManager();  

      @override
      void initState() {
        super.initState();
        eventBusManager.onData(onInt);
        eventBusManager.onEvent("test", onTest);
        eventBusManager.onEventWithArg("test", onTestWithData);
      }

      void onInt(int value) {
        // some codes
      }

      void onTest(String event) {
        // some codes
      }

      void onTestWithData(String event, String data) {
        // some codes
      }

      @override
      void dispose() {
        super.dispose();
        // Never need to release callbacks one by one.
        eventBusManager.dispose();
      }
    }
  ```