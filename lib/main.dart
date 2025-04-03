import 'package:aether/modules/home/home_page.dart';
import 'package:aether/core/network/http_adapter.dart';
import 'package:aether/core/network/htttp_client.dart';
import 'package:aether/repositories/weather_repository.dart';
import 'package:aether/repositories/weather_repository_impl.dart';
import 'package:aether/services/weather_service.dart';
import 'package:aether/services/weather_service_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'modules/home/home_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const MainApp());
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<HttpClient>(
            create: (_) => HttpAdapter(
                language: dotenv.env['LANGUAGE'] ?? 'pt_br',
                apiKey: dotenv.env['API_KEY'] ?? '',
                baseUrl: dotenv.env['BASE_URL'] ?? ''),
            dispose: (context, adapter) => (adapter as HttpAdapter).dispose(),
          ),
          Provider<WeatherRepository>(
            create: (context) => WeatherRepositoryImpl(
              httpClient: context.read<HttpClient>(),
            ),
          ),
          Provider<WeatherService>(
            create: (context) => WeatherServiceImpl(
              weatherRepository: context.read<WeatherRepository>(),
            ),
          ),
          ChangeNotifierProvider(
            create: (context) => HomeController(
              weatherService: context.read<WeatherService>(),
            ),
          ),
        ],
        child: const CupertinoApp(
            debugShowCheckedModeBanner: false, home: HomePage()));
  }
}
