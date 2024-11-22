import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/providers/tourism_provider.dart';
import 'package:tourism_app/screens/detail_screen.dart';
import 'package:tourism_app/screens/home_screen.dart';
import 'package:tourism_app/services/local_service.dart';
import 'package:tourism_app/utils/load_asset.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => LoadAsset(),
        ),
        Provider(
          create: (context) => LocalService(
            context.read<LoadAsset>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => TourismProvider(
            context.read<LocalService>(),
          ),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: "/",
        routes: [
          GoRoute(
            path: "/",
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: "/:id",
            builder: (context, state) {
              final id = state.pathParameters["id"] as String;
              return DetailScreen(
                id: id,
              );
            },
          )
        ],
      ),
    );
  }
}
