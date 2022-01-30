import 'package:flutter_module/src/application/message_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messageNotifierProvider =
    StateNotifierProvider.autoDispose<MessageNotifier, String>(
  (ref) => MessageNotifier(),
);
