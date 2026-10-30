import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class TopHeader extends StatelessWidget {
  final VoidCallback? onSearchTap;
  final VoidCallback? onMenuTap;
  final bool isScrolled;

  const TopHeader({
    super.key,
    this.onSearchTap,
    this.onMenuTap,
    this.isScrolled = false,
  });

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: isScrolled
          ? EdgeInsets.only(
              top: topPadding + 8,
              left: 12,
              right: 12,
            )
          : EdgeInsets.zero,
      padding: EdgeInsets.only(
        top: isScrolled ? 10 : topPadding + 8,
        bottom: 10,
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: isScrolled
            ? const Color(0xD90D0D12) // rgba(13, 13, 18, 0.85)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(isScrolled ? 16 : 0),
        border: isScrolled
            ? Border.all(color: Colors.white.withValues(alpha: 0.1), width: 1)
            : null,
        boxShadow: isScrolled
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                )
              ]
            : null,
        gradient: isScrolled
            ? null
            : const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xE6000000), // black/90
                  Color(0x80000000), // black/50
                  Colors.transparent,
                ],
              ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isScrolled ? 16 : 0),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: isScrolled ? 12 : 2,
            sigmaY: isScrolled ? 12 : 2,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              GestureDetector(
                onTap: () {},
                child: Text(
                  'VILIX',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1.2,
                    ),
                  ),
                ),
              ),
              // Action Icons
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.search, size: 22),
                    color: const Color(0xFFD4D4D4),
                    splashRadius: 20,
                    tooltip: 'Search',
                    onPressed: onSearchTap ?? () {},
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: const Icon(Icons.menu, size: 24),
                    color: const Color(0xFFD4D4D4),
                    splashRadius: 20,
                    tooltip: 'Menu',
                    onPressed: onMenuTap ?? () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
