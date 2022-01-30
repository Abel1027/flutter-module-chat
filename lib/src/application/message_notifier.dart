import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageNotifier extends StateNotifier<String> {
  MessageNotifier() : super('');

  StreamSubscription? textStreamSubscription;

  void onMessageChanged() {
    textStreamSubscription?.cancel();

    const eventChannel = EventChannel('com.example.flutter/event');
    textStreamSubscription =
        eventChannel.receiveBroadcastStream().listen((event) {
      state = event as String;
    });
  }

  void sendMessage(String value) {
    const methodChannel = MethodChannel('com.example.flutter/method');
    methodChannel.invokeMethod(
      'sendMessage',
      value,
    );
  }
}
