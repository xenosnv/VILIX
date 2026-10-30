import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/mock_data.dart';

class HeroSlider extends StatefulWidget {
  final List<HeroSlide> slides;

  const HeroSlider({
    super.key,
    required this.slides,
  });

  @override
  State<HeroSlider> createState() => _HeroSliderState();
}

class _HeroSliderState extends State<HeroSlider> {
  late final PageController _pageController;
  int _currentIndex = 0;
  Timer? _autoplayTimer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoplay();
  }

  void _startAutoplay() {
    _autoplayTimer?.cancel();
    _autoplayTimer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (!mounted || widget.slides.isEmpty) return;
      final nextIndex = (_currentIndex + 1) % widget.slides.length;
      _pageController.animateToPage(
        nextIndex,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    });
  }

  @override
  void dispose() {
    _autoplayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.slides.isEmpty) return const SizedBox.shrink();

    return SizedBox(
      height: 480,
      width: double.infinity,
      child: Stack(
        children: [
          // Background PageView Slider
          PageView.builder(
            controller: _pageController,
            itemCount: widget.slides.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              _startAutoplay();
            },
            itemBuilder: (context, index) {
              final slide = widget.slides[index];
              return Stack(
                fit: StackFit.expand,
                children: [
                  // Image
                  Image.network(
                    slide.image,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.surfaceCard,
                      child: const Center(
                        child: Icon(Icons.broken_image, color: AppColors.textDim),
                      ),
                    ),
                  ),

                  // Gradients
                  // Top Gradient
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [
                          Color(0xCC000000), // black/80
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),

                  // Bottom Gradient
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.surfaceDark,
                          Color(0x99000000),
                          Colors.transparent,
                        ],
                        stops: [0.0, 0.45, 1.0],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // Slide Content Info at Bottom
          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Title
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: KeyedSubtree(
                    key: ValueKey<int>(_currentIndex),
                    child: _buildTitle(widget.slides[_currentIndex]),
                  ),
                ),
                const SizedBox(height: 6),

                // Metadata Row
                _buildMetadata(widget.slides[_currentIndex]),
                const SizedBox(height: 16),

                // Call to actions (Watch Now + Mute Button)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow_rounded, size: 20),
                      label: const Text(
                        'Watch Now',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.4,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        foregroundColor: Colors.white,
                        elevation: 6,
                        shadowColor: AppColors.primaryBlue.withValues(alpha: 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xCC1E3A8A), // blue-900 / 80
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.volume_up_rounded, size: 20),
                        color: Colors.white,
                        splashRadius: 22,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),

                // Dot Pagination Indicator
                _buildDots(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(HeroSlide slide) {
    if (slide.isCursive) {
      return Text(
        slide.title,
        textAlign: TextAlign.center,
        style: GoogleFonts.greatVibes(
          textStyle: const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.normal,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Color(0x99FFFFFF), // rgba(255, 255, 255, 0.6)
                blurRadius: 20,
              ),
              Shadow(
                color: Color(0x4DFFFFFF), // rgba(255, 255, 255, 0.3)
                blurRadius: 40,
              ),
            ],
          ),
        ),
      );
    } else {
      return Text(
        slide.title.toUpperCase(),
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            letterSpacing: -0.8,
            height: 1.15,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 16,
                offset: Offset(0, 3),
              ),
              Shadow(
                color: Color(0xCC000000),
                blurRadius: 24,
                offset: Offset(0, 6),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget _buildMetadata(HeroSlide slide) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Star Rating
        const Icon(Icons.star_rounded, size: 16, color: AppColors.ratingAmber),
        const SizedBox(width: 3),
        Text(
          slide.rating,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.ratingAmber,
          ),
        ),
        _buildBullet(),
        Text(
          slide.year,
          style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
        ),
        _buildBullet(),
        Text(
          slide.duration,
          style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
        ),
        _buildBullet(),
        Flexible(
          child: Text(
            slide.genres,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
          ),
        ),
      ],
    );
  }

  Widget _buildBullet() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Text(
        '•',
        style: TextStyle(color: AppColors.textDim, fontSize: 10),
      ),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.slides.length, (index) {
        final isActive = index == _currentIndex;
        return GestureDetector(
          onTap: () {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 3),
            width: isActive ? 24 : 6,
            height: 6,
            decoration: BoxDecoration(
              color: isActive ? AppColors.primaryBlue : const Color(0xFF525252),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        );
      }),
    );
  }
}
