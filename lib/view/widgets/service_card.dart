import 'package:flutter/material.dart';
import 'package:flutter_intern_assignment/core/constants/app_colors.dart';
import 'package:flutter_intern_assignment/data/models/music_model.dart';

class ServiceCard extends StatelessWidget {
  final MusicModel service;
  final VoidCallback onTap;
  const ServiceCard({super.key, required this.service, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Material(
        color: AppColors.cardbgColor,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(240, 60, 58, 58),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(service.iconPath),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          service.title,
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          service.description,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.play_arrow, color: AppColors.textPrimary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
