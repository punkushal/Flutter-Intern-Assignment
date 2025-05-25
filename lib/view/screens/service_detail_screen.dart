import 'package:flutter/material.dart';
import 'package:flutter_intern_assignment/core/constants/app_colors.dart';

class ServiceDetailScreen extends StatelessWidget {
  const ServiceDetailScreen({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navBarInactive,
      appBar: AppBar(backgroundColor: AppColors.navBarInactive),
      body: Center(
        child: Text(
          'You tapped on: $title ',
          style: TextStyle(fontSize: 20, color: AppColors.textPrimary),
        ),
      ),
    );
  }
}
