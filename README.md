# 1、事件  
## 1.1 Event  
&emsp;&emsp;用来发布事件。  
### 1.1.1 声明
&emsp;&emsp;通过如下方法声明一个事件：
  ```dart
    final someEvent = Event1<A>();
  ```
&emsp;&emsp;对应的事件接收函数的类型如下：
  ```dart
    void someCallback(A arg);  // A为上一步声明事件时的模版类型
  ```
### 1.1.2 注册  
&emsp;&emsp;通过如下方法注册事件： 
  ```dart
    someEvent.on(someCallback);  
  ```
### 1.1.3 注销  
&emsp;&emsp;调用如下方法或注册时返回的函数注销事件：  
  ```dart
    someEvent.off(someCallback);  
  ```
### 1.1.4 发布  
&emsp;&emsp;*Event*本身为可调用对象，调用其本身即可发布事件，命名参数*async*用来决定发布同步事件还是异步事件，默认为同步事件。  
&emsp;&emsp;- 同步事件：`someEvent(arg);`  
&emsp;&emsp;- 异步事件：`someEvent(arg, async: true);`  

## 1.2 事件总线  
&emsp;&emsp;全局事件总线，用以跨页面事件通知；实现了订阅者模式，包含发布者和订阅者两种角色，可以通过事件总线来触发事件和监听事件；通过顶级变量*$eventBus*或*factory EventBus()*方法获取全局单例。  
&emsp;&emsp;- 事件注册：调用以*on*开头的方法注册事件监听；  
&emsp;&emsp;- 事件注销：调用*off*、*offEvent*或事件注册时返回的函数注销事件监听；  
&emsp;&emsp;- 事件发布：调用以*emit*开头的方法发布事件；调用*eventBus.async*的以*emit*开头的方法，发布异步事件；  
&emsp;&emsp;示例：  
  ```dart
    class _SomeWidgetState extends State<SomeWidget> {
      OffEvent offEvent1;
      OffEvent offEvent2;
      OffEvent offEvent3;

      @override
      void initState() {
        super.initState();
        offEvent1 = $eventBus.onData(onInt);
        offEvent2 = $eventBus.onEvent("test", onTest);
        offEvent3 = $eventBus.onEventWithArg("test", onTestWithData);
      }

      void onInt(int value) {
        ...
      }

      void onTest(String event) {
        ...
      }

      void onTestWithData(String event, String data) {
        ...
      }

      @override
      void dispose() {
        super.dispose();
        offEvent1();
        offEvent2();
        offEvent3();
        // or
        // $eventBus.off(onInt);
        // $eventBus.offEvent("test", onTest);
        // $eventBus.offEvent("test", onTestWithData);
      }
    }
  ```
### 1.2.1 无指定事件  
&emsp;&emsp;通过*on*、*onData*、*on2Data* ... *on9Data*注册的监听函数，只能够接收参数类型、顺序和数量与监听函数的签名相同的事件，例如：  
  ```dart
    void callback(int data1, String data2, double data3) {
      ...
    }
    $eventBus.on3Data(callback);
  ```
&emsp;&emsp;可以接收到如下事件：  
  ```dart
    $eventBus.emit3Data(22, "Hi", 33.0);
    $eventBus.emit3Data(2, 'Good', 33.9);
    $eventBus.async.emit3Data(33, 'Wo', 99.0);
  ```
&emsp;&emsp;但不能接收到以下事件：  
  ```dart
    $eventBus.emit3Data(1, 1, 1);
    $eventBus.async.emit3Data(1, 1, 1);
    $eventBus.emit3Data('Hi', 1, 23.0);
    $eventBus.emit3Data(22.0, "Hi", 33);
    $eventBus.emit4Data(1, 'Hi', 12.0, 44);
    $eventBus.emitEventWith2Args(2, "Good", 33.9);
  ```
### 1.2.2 指定事件  
&emsp;&emsp;通过*onEvent*、*onEventWithArg*、*onEventWith2Args* ... *onEventWith9Args*不仅要求事件的参数类型、顺序和数量与监听函数的签名相同，还要求事件必须为相同事件，例如：  
  ```dart
    void callback(String event, int arg1, String arg2, double arg3) {
      ...
    }
    $eventBus.onEventWith3Args("test", callback);
  ```
&emsp;&emsp;可以接收到如下事件：  
  ```dart
    $eventBus.emitEventWith3Args("test", 12, "Hi", 33.5);
    $eventBus.emitEventWith3Args("test", 22, "Good", 102.0);
    $eventBus.async.emitEventWith3Args("test", 12, "Goods", 44.0);
  ```
&emsp;&emsp;但不能接收到以下事件：  
  ```dart
    $eventBus.emit4Data("test", 12, "Hi", 33.5);
    $eventBus.emitEventWith3Args("test1", 12, "Hi", 33.5);
    $eventBus.emitEventWith3Args("test", "Hi", 12, 33.5);
    $eventBus.emitEventWith3Args("Test", "Hi", 12, 33.5);
    $eventBus.emitEventWith4Args("test", 12, "Hi", 33.5, 33);
    $eventBus.async.emit4Data("test", 12, "Hi", 33.9);
  ```
### 1.2.3 EventBusManager、EventBusState和EventBusStateMixin  
&emsp;&emsp;- *EventBusManager*：对*EventBus*的封装，可以在适当的时机调用其实例的*dispose*方法，注销掉所有通过该实例注册到*EventBus*上的回调函数；例如：  
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
        ...
      }
 
      void onTest(String event) {
        ...
      }
 
      void onTestWithData(String event, String data) {
        ...
      }
 
      @override
      void dispose() {
        super.dispose();
        eventBusManager.dispose();
      }
    }
  ```  
&emsp;&emsp;- *EventBusState*和*EventBusStateMixin*：包含一个*EventBusManager*属性*eventBus*，通过*eventBus*可以向*EventBus*上注册回调；重载了*State*的*dispose*方法，以便在系统调用*State*的*dispose*方法释放资源的时候，自动注销掉所有通过*eventBus*注册到*EventBus*上的回调函数。  