import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../data/mock_data.dart';

class MediaCard extends StatelessWidget {
  final MediaItem item;
  final VoidCallback? onTap;

  const MediaCard({
    super.key,
    required this.item,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster Container
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.borderDark, width: 1),
                color: AppColors.surfaceCard,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // Poster Image
                    CachedNetworkImage(
                      imageUrl: item.image,
                      fit: BoxFit.cover,
                      memCacheWidth: 300,
                      fadeInDuration: Duration.zero,
                      placeholder: (context, url) => Container(
                        color: const Color(0xFF181820),
                        alignment: Alignment.center,
                        child: const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color(0xFF2563EB),
                            ),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: const Color(0xFF181820),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.movie_outlined,
                          color: AppColors.textDim,
                          size: 32,
                        ),
                      ),
                    ),

                    // Rank Badge (Stroke Text)
                    if (item.rank != null)
                      Positioned(
                        top: 4,
                        left: 8,
                        child: _buildRankBadge(item.rank!),
                      ),

                      // Quality / Episode / Type Tag
                      Positioned(
                        top: 6,
                        right: 6,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (item.typeTag != null) ...[
                              _buildTag(
                                text: item.typeTag!,
                                isGreen: false,
                              ),
                              const SizedBox(width: 4),
                            ],
                            if (item.tag.isNotEmpty)
                              _buildTag(
                                text: item.tag,
                                isGreen: item.isGreenTag,
                              ),
                          ],
                        ),
                      ),

                      // Bottom Gradient Overlay for Rating & Views
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 5,
                          ),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black,
                                Color(0x66000000),
                                Colors.transparent,
                              ],
                              stops: [0.0, 0.7, 1.0],
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Rating
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star_rounded,
                                    size: 13,
                                    color: AppColors.ratingAmber,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    item.rating,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.ratingAmber,
                                    ),
                                  ),
                                ],
                              ),
                              // Views
                              Row(
                                children: [
                                  const Icon(
                                    Icons.visibility_outlined,
                                    size: 12,
                                    color: AppColors.textMuted,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    '${item.views}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),

            // Title
            Text(
              item.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: Color(0xFFE5E5E5),
                height: 1.25,
              ),
            ),
          ],
        ),
      );
  }

  Widget _buildRankBadge(int rank) {
    return Stack(
      children: [
        // Stroke
        Text(
          '$rank',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Colors.black.withValues(alpha: 0.9),
          ),
        ),
        // Fill
        Text(
          '$rank',
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 8,
                offset: Offset(0, 3),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTag({required String text, required bool isGreen}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
        color: isGreen ? AppColors.badgeGreenBg : const Color(0xB3000000),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isGreen ? AppColors.badgeGreenBorder : Colors.white.withValues(alpha: 0.15),
          width: 0.8,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 8.5,
          fontWeight: FontWeight.bold,
          color: isGreen ? AppColors.badgeGreenText : AppColors.textWhite,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
