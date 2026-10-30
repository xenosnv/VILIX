import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_colors.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/nav_modal.dart';
import '../widgets/top_header.dart';

class MainShell extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainShell({
    super.key,
    required this.navigationShell,
  });

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  bool _isScrolled = false;

  void _onTabSelected(int index) {
    if (index == 4) {
      // "More" tab triggers the full popup Navigation Modal
      NavModal.show(
        context,
        onNavigateTab: (tabIndex) {
          widget.navigationShell.goBranch(
            tabIndex,
            initialLocation: tabIndex == widget.navigationShell.currentIndex,
          );
        },
      );
    } else {
      widget.navigationShell.goBranch(
        index,
        initialLocation: index == widget.navigationShell.currentIndex,
      );
    }
  }

  void _openNavModal() {
    NavModal.show(
      context,
      onNavigateTab: (tabIndex) {
        widget.navigationShell.goBranch(
          tabIndex,
          initialLocation: tabIndex == widget.navigationShell.currentIndex,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification.depth == 0) {
            final scrolled = notification.metrics.pixels > 20;
            if (scrolled != _isScrolled) {
              setState(() {
                _isScrolled = scrolled;
              });
            }
          }
          return false;
        },
        child: Stack(
          children: [
            // Center content area: IndexedStack prevents re-render and keeps scroll state
            Positioned.fill(
              child: widget.navigationShell,
            ),

            // Top Floating Header
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: TopHeader(
                isScrolled: _isScrolled,
                onSearchTap: () {},
                onMenuTap: _openNavModal,
              ),
            ),

            // Bottom Navigation Bar
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: VilixBottomNavBar(
                currentIndex: widget.navigationShell.currentIndex,
                onTap: _onTabSelected,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
