import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/providers/tourism_provider.dart';

class DetailScreen extends StatelessWidget {
  final String id;

  const DetailScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final destinations = context.read<TourismProvider>().destination!;
    final destination = destinations.firstWhere(
      (element) => element.id == int.parse(id),
    );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(destination.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(destination.image),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destination.address,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox.square(dimension: 8),
                  Text(destination.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
