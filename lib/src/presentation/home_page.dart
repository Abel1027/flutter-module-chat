import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_module/src/dependency_injection/di.dart';
import 'package:flutter_module/src/presentation/message_input_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    ref.read(messageNotifierProvider.notifier).onMessageChanged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const MessageInputWidget(),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => SystemNavigator.pop(),
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
