import 'dart:developer' as developer;

log(String message, {String? name, dynamic error, StackTrace? stackTrace}) {
  developer.log(message, name: name ?? '', error: error, stackTrace: stackTrace);
  // print('$name');
  // print('$message');
  // print('$error');
}
