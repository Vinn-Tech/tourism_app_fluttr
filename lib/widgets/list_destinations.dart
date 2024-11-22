import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/providers/tourism_provider.dart';

class ListDestinations extends StatelessWidget {
  const ListDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfDestinations = context.read<TourismProvider>().destination!;
    return ListView.builder(
      itemCount: listOfDestinations.length,
      itemBuilder: (context, index) {
        final item = listOfDestinations[index];

        return ListTile(
          title: Text(item.name),
          onTap: () {
            GoRouter.of(context).push("/${item.id}");
          },
        );
      },
    );
  }
}
