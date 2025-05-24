import 'package:flutter/material.dart';
import 'package:flutter_intern_assignment/view/screens/service_detail_screen.dart';
import 'package:flutter_intern_assignment/view/widgets/service_card.dart';
import 'package:flutter_intern_assignment/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: viewModel.services.length,
            itemBuilder: (ctx, index) {
              final service = viewModel.services[index];
              return ServiceCard(
                service: service,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ServiceDetailScreen(title: service.title),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
