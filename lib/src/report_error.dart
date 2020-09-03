void debugReportError({
  String context,
  StackTrace stack,
  dynamic exception
}) {
  bool isDebug = true;
  assert((){
    isDebug = false;
    return true;
  }());
  if (!isDebug) return;
  
  var msg = '===| EXCEPTION CAUGHT BY FLUTTER_EVENT |=================================================\r\n';
  msg += 'The following ${exception.runtimeType} was thrown';
  if (context?.isNotEmpty ?? false) msg += ' $context'; 
  msg += ':\r\n';

  String longMessage;
  if (exception is AssertionError) {
    final Object message = exception.message;
    final String fullMessage = exception.toString();
    if (message is String && message != fullMessage) {
      if (fullMessage.length > message.length) {
        final int position = fullMessage.lastIndexOf(message);
        if (position == fullMessage.length - message.length &&
            position > 2 &&
            fullMessage.substring(position - 2, position) == ': ') {
          String body = fullMessage.substring(0, position - 2);
          final int splitPoint = body.indexOf(' Failed assertion:');
          if (splitPoint >= 0) {
            body = '${body.substring(0, splitPoint)}\n${body.substring(splitPoint + 1)}';
          }
          longMessage = '${message.trimRight()}\n$body';
        }
      }
    }
    longMessage ??= fullMessage;
  } else if (exception is String) {
    longMessage = exception as String;
  } else if (exception is Error || exception is Exception) {
    longMessage = exception.toString();
  } else {
    longMessage = '  ${exception.toString()}';
  }
  longMessage = longMessage.trimRight();
  if (longMessage.isEmpty) {
    longMessage = '  <no message available>';
  }
  
  msg += longMessage;
  msg += '\r\n\r\nWhen the exception was thrown, this was the stack:\r\n${stack.toString()}';
  print(msg);
}