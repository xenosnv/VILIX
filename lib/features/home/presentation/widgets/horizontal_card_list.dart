import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/section_header.dart';
import '../../data/mock_data.dart';
import 'media_card.dart';

class HorizontalCardList extends StatefulWidget {
  final String title;
  final List<MediaItem> items;
  final bool showCategoryFilter;
  final bool showViewAll;
  final VoidCallback? onViewAllTap;

  const HorizontalCardList({
    super.key,
    required this.title,
    required this.items,
    this.showCategoryFilter = false,
    this.showViewAll = false,
    this.onViewAllTap,
  });

  @override
  State<HorizontalCardList> createState() => _HorizontalCardListState();
}

class _HorizontalCardListState extends State<HorizontalCardList> {
  String _selectedFilter = 'all'; // 'all', 'movie', 'tv'

  @override
  Widget build(BuildContext context) {
    // Filter items based on active tab
    final filteredItems = widget.showCategoryFilter
        ? widget.items.where((item) {
            if (_selectedFilter == 'all') return true;
            return item.type == _selectedFilter;
          }).toList()
        : widget.items;

    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          SectionHeader(
            title: widget.title,
            hasChevron: widget.showViewAll,
            trailing: widget.showCategoryFilter
                ? Container(
                    decoration: BoxDecoration(
                      color: AppColors.surfaceCardLight,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AppColors.borderDark),
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildFilterButton('All', 'all'),
                        _buildFilterButton('Movies', 'movie'),
                        _buildFilterButton('TV Series', 'tv'),
                      ],
                    ),
                  )
                : widget.showViewAll
                    ? InkWell(
                        onTap: widget.onViewAllTap ?? () {},
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View all',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.textMuted,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 2),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 14,
                              color: AppColors.textMuted,
                            ),
                          ],
                        ),
                      )
                    : null,
          ),
          const SizedBox(height: 10),

          // Horizontal Cards List
          SizedBox(
            height: 236,
            child: filteredItems.isEmpty
                ? const Center(
                    child: Text(
                      'No items available in this category',
                      style: TextStyle(color: AppColors.textDim, fontSize: 11),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: filteredItems.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 128,
                        child: MediaCard(item: filteredItems[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(String label, String value) {
    final isSelected = _selectedFilter == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedFilter = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 9.5,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
            color: isSelected ? Colors.white : AppColors.textMuted,
          ),
        ),
      ),
    );
  }
}
