import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class FilterModal extends StatefulWidget {
  final String currentSort;
  final ValueChanged<String>? onSortApplied;

  const FilterModal({
    super.key,
    this.currentSort = 'Latest',
    this.onSortApplied,
  });

  static Future<void> show(
    BuildContext context, {
    String currentSort = 'Latest',
    ValueChanged<String>? onSortApplied,
  }) {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true, // Render di root navigator di atas shell header
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterModal(
        currentSort: currentSort,
        onSortApplied: onSortApplied,
      ),
    );
  }

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  late String _selectedSort;
  String _selectedGenre = 'All Genres';
  String _selectedCountry = 'All Countries';
  String _selectedYear = 'All';
  String _selectedQuality = 'All Quality';

  final TextEditingController _genreSearchController = TextEditingController();
  final TextEditingController _countrySearchController = TextEditingController();

  String _genreSearchQuery = '';
  String _countrySearchQuery = '';

  final List<String> _sortOptions = [
    'Latest',
    'Newest Release',
    'Popular',
    'Most Viewed',
    'Top Rated',
  ];

  final List<String> _allGenres = [
    'All Genres',
    'Action',
    'Adventure',
    'Animation',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'History',
    'Horror',
    'Kids',
    'Music',
    'Mystery',
    'Reality',
    'Romance',
    'Science Fiction',
    'Soap',
    'Talk',
    'Thriller',
    'TV Movie',
    'War',
    'Western',
  ];

  final List<String> _allCountries = [
    'All Countries',
    'Argentina',
    'Australia',
    'Austria',
    'Belgium',
    'Brazil',
    'Canada',
    'China',
    'France',
    'Germany',
    'Hong Kong',
    'India',
    'Indonesia',
    'Japan',
    'South Korea',
    'Spain',
    'United Kingdom',
    'United States',
  ];

  final List<String> _allYears = [
    'All',
    '2026',
    '2025',
    '2024',
    '2023',
    '2022',
    '2021',
    '2020',
    '2019',
    '2018',
  ];

  final List<String> _allQualities = [
    'All Quality',
    '4K',
    'BLU-RAY',
    'CAM',
    'HD',
    'WEB-DL',
  ];

  @override
  void initState() {
    super.initState();
    _selectedSort = widget.currentSort;
  }

  @override
  void dispose() {
    _genreSearchController.dispose();
    _countrySearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredGenres = _allGenres.where((g) {
      if (_genreSearchQuery.isEmpty) return true;
      return g.toLowerCase().contains(_genreSearchQuery.toLowerCase());
    }).toList();

    final filteredCountries = _allCountries.where((c) {
      if (_countrySearchQuery.isEmpty) return true;
      return c.toLowerCase().contains(_countrySearchQuery.toLowerCase());
    }).toList();

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.85,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surfaceModal,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 1. Fixed Header (Non-scrollable)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: const BoxDecoration(
              color: AppColors.surfaceModal,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              border: Border(bottom: BorderSide(color: AppColors.borderDark)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filters & Sort',
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textWhite,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFF262626),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 18,
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 2. Scrollable Body
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SORT BY
                  _buildSectionHeader(
                    icon: Icons.sort_rounded,
                    title: 'SORT BY',
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _sortOptions.map((opt) {
                      return _buildPill(
                        label: opt,
                        isSelected: _selectedSort == opt,
                        onTap: () => setState(() => _selectedSort = opt),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  // GENRES
                  _buildSectionHeader(title: 'GENRES'),
                  const SizedBox(height: 8),
                  _buildSearchBox(
                    controller: _genreSearchController,
                    hint: 'Search genres...',
                    onChanged: (q) => setState(() => _genreSearchQuery = q),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: filteredGenres.map((g) {
                      return _buildPill(
                        label: g,
                        isSelected: _selectedGenre == g,
                        onTap: () => setState(() => _selectedGenre = g),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  // COUNTRY
                  _buildSectionHeader(title: 'COUNTRY'),
                  const SizedBox(height: 8),
                  _buildSearchBox(
                    controller: _countrySearchController,
                    hint: 'Search countries...',
                    onChanged: (q) => setState(() => _countrySearchQuery = q),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: filteredCountries.map((c) {
                      return _buildPill(
                        label: c,
                        isSelected: _selectedCountry == c,
                        onTap: () => setState(() => _selectedCountry = c),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  // YEAR
                  _buildSectionHeader(title: 'YEAR'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: _allYears.map((y) {
                      return _buildPill(
                        label: y,
                        isSelected: _selectedYear == y,
                        onTap: () => setState(() => _selectedYear = y),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),

                  // QUALITY
                  _buildSectionHeader(title: 'QUALITY'),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: _allQualities.map((q) {
                      return _buildPill(
                        label: q,
                        isSelected: _selectedQuality == q,
                        onTap: () => setState(() => _selectedQuality = q),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),

          // 3. Fixed Footer Actions (Cancel & Done)
          SafeArea(
            top: false,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: AppColors.surfaceModal,
                border: Border(top: BorderSide(color: AppColors.borderDark)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xFF17171D),
                        side: const BorderSide(color: Color(0xFF404040)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                      ),
                      child: Text(
                        'Cancel',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        widget.onSortApplied?.call(_selectedSort);
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.check, size: 16),
                      label: Text(
                        'Done',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        foregroundColor: Colors.white,
                        elevation: 6,
                        shadowColor: AppColors.primaryBlue.withValues(alpha: 0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 13),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader({IconData? icon, required String title}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) ...[
          Icon(icon, size: 14, color: AppColors.textDim),
          const SizedBox(width: 4),
        ],
        Text(
          title,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.1,
              color: AppColors.textDim,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBox({
    required TextEditingController controller,
    required String hint,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF15151C),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderDark),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: const TextStyle(fontSize: 12, color: Colors.white),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search, size: 16, color: AppColors.textDim),
          prefixIconConstraints: const BoxConstraints(minWidth: 36, minHeight: 16),
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 12, color: AppColors.textDim),
        ),
      ),
    );
  }

  Widget _buildPill({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryBlue : const Color(0xFF181820),
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primaryBlue.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              fontSize: 11,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
              color: isSelected ? Colors.white : const Color(0xFFD4D4D4),
            ),
          ),
        ),
      ),
    );
  }
}
