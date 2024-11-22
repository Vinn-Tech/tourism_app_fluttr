import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/providers/tourism_provider.dart';
import 'package:tourism_app/widgets/list_destinations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    final tourismProvider = context.read<TourismProvider>();
    Future.microtask(() => tourismProvider.getTourismData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home Screen'),
      ),
      body: Consumer<TourismProvider>(
        builder: (_, value, __) {
          final state = value.state;

          if (state == null) {
            return const SizedBox();
          }

          return switch (state) {
            LoadingState.loading => const CircularProgressIndicator(),
            LoadingState.error => const Text("error guys"),
            LoadingState.loaded => const ListDestinations(),
          };
        },
      ),
    );
  }
}
