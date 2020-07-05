import './event_bus_manager.dart';
import 'package:flutter/widgets.dart';

abstract class EventBusState<T extends StatefulWidget> = State<T> with EventBusStateMixin<T>;

mixin EventBusStateMixin<T extends StatefulWidget> on State<T> {
  EventBusManager _eventBus;
  EventBusManager get eventBus => _eventBus ??= EventBusManager();

  @override
  @protected
  @mustCallSuper
  void dispose() {
    super.dispose();
    _eventBus?.dispose();
  }
}