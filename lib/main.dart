import 'package:aether/home_page.dart';
import 'package:aether/core/network/http_adapter.dart';
import 'package:aether/core/network/htttp_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<HttpClient>(
          create: (_) => HttpAdapter(),
          dispose: (context, adapter) => (adapter as HttpAdapter).dispose()),
    ], child: const HomePage());
  }
}
