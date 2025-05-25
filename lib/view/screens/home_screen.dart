import 'package:flutter/material.dart';
import 'package:flutter_intern_assignment/core/constants/app_colors.dart';
import 'package:flutter_intern_assignment/view/widgets/bottom_nav_bar.dart';
import 'package:flutter_intern_assignment/view/widgets/hero_section.dart';
import 'package:flutter_intern_assignment/view/widgets/services_list.dart';
import 'package:flutter_intern_assignment/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      context.read<HomeViewModel>().loadServices();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: Column(
        children: [
          Stack(
            children: [
              HeroSection(),

              //search bar
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.only(top: 24),
                child: Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.cardbgColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          spacing: 12,
                          children: [
                            Icon(Icons.search, color: AppColors.textPrimary),
                            Text(
                              'Search "Punjabi Lyrics"',
                              style: TextStyle(
                                color: AppColors.searchHintColor,
                                fontSize: 16,
                              ),
                            ),
                            Spacer(),
                            Icon(Icons.mic, color: AppColors.textPrimary),
                          ],
                        ),
                      ),
                    ),
                    CircleAvatar(radius: 20, child: Icon(Icons.person_outline)),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            child: Text(
              'Hire hand-picked Pros for popular music services',
              style: TextStyle(color: AppColors.textPrimary, fontSize: 15),
            ),
          ),
          Flexible(
            child: Consumer<HomeViewModel>(
              builder: (context, viewModel, child) {
                switch (viewModel.state) {
                  case HomeViewState.loading:
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primaryRed,
                        ),
                      ),
                    );
                  case HomeViewState.error:
                    return Center(
                      child: Column(
                        spacing: 16,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Error:${viewModel.errorMessage}',
                            style: TextStyle(color: AppColors.textSecondary),
                            textAlign: TextAlign.center,
                          ),
                          ElevatedButton(
                            onPressed: () => viewModel.loadServices(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryRed,
                            ),
                            child: Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  case HomeViewState.loaded:
                    return ServicesList();
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
