import 'package:flutter/material.dart';
import 'package:flutter_module/src/dependency_injection/di.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessageInputWidget extends ConsumerStatefulWidget {
  const MessageInputWidget({Key? key}) : super(key: key);

  @override
  _MessageInputWidgetState createState() => _MessageInputWidgetState();
}

class _MessageInputWidgetState extends ConsumerState<MessageInputWidget> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(
      text: ref.read(messageNotifierProvider),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _messageState = ref.watch(messageNotifierProvider);
    _textEditingController.text = _messageState;

    return TextFormField(
      controller: _textEditingController,
      minLines: 4,
      maxLines: 8,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onChanged: (value) =>
          ref.read(messageNotifierProvider.notifier).sendMessage(value),
    );
  }
}
