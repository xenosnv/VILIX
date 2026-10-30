import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/filter_modal.dart';
import '../../../core/widgets/vilix_footer.dart';
import '../../home/data/mock_data.dart';
import '../../home/presentation/widgets/hero_slider.dart';
import '../../home/presentation/widgets/media_card.dart';

class MoviesScreen extends StatefulWidget {
  final ValueChanged<bool>? onScrollChanged;

  const MoviesScreen({
    super.key,
    this.onScrollChanged,
  });

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen>
    with AutomaticKeepAliveClientMixin {
  late final ScrollController _scrollController;
  bool _isScrolled = false;
  String _currentFilter = 'Latest';

  // Movie list state supporting "Load More"
  late List<MediaItem> _displayMovies;
  bool _isLoadingMore = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _displayMovies = MockData.catalogMovies.take(6).toList();
  }

  void _onScroll() {
    // 1. Notifikasi scroll ke parent (tanpa setState yang tidak perlu)
    final scrolled = _scrollController.offset > 20;
    if (scrolled != _isScrolled) {
      _isScrolled = scrolled;
      widget.onScrollChanged?.call(scrolled);
    }

    // 2. Optional: Auto load more saat mendekati bottom (80% scroll)
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        _displayMovies.length < MockData.catalogMovies.length) {
      _loadMoreMovies();
    }
  }

  void _loadMoreMovies() {
    if (_isLoadingMore) return;

    // Cek apakah data yang ditampilkan sudah mencapai total data di katalog
    if (_displayMovies.length >= MockData.catalogMovies.length) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Semua film sudah ditampilkan'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    setState(() => _isLoadingMore = true);

    Future.delayed(const Duration(milliseconds: 600), () {
      if (!mounted) return;
      setState(() {
        // Ambil sisa data berikutnya agar tidak duplikat
        final nextIndex = _displayMovies.length;
        final nextItems = MockData.catalogMovies.skip(nextIndex).take(6);
        _displayMovies.addAll(nextItems);
        _isLoadingMore = false;
      });
    });
  }

  void _openFilterModal() {
    FilterModal.show(
      context,
      currentSort: _currentFilter,
      onSortApplied: (selectedSort) {
        setState(() {
          _currentFilter = selectedSort;
          // TODO: Terapkan logika sorting/filtering aktual pada _displayMovies di sini
        });
      },
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: AppColors.surfaceDark,
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Hero Slider Autoplay khusus Movies
            const HeroSlider(slides: MockData.movieHeroSlides),

            // 2. Section Title & Filter Pill Button
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Movies',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),

                  // Filter Pill Button
                  InkWell(
                    onTap: _openFilterModal,
                    borderRadius: BorderRadius.circular(5.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3.5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF17171F),
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: AppColors.borderDark),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.filter_alt_outlined,
                            size: 11,
                            color: Color(0xFFD4D4D4),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _currentFilter,
                            style: GoogleFonts.inter(
                              textStyle: const TextStyle(
                                fontSize: 10.5,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFE5E5E5),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 3. 3-Column Movies Grid
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _displayMovies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.52,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return MediaCard(item: _displayMovies[index]);
                },
              ),
            ),

            const SizedBox(height: 20),

            // 4. Load More Movies Button
            Center(
              child: InkWell(
                onTap: _isLoadingMore ? null : _loadMoreMovies,
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF131722),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.borderDark),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (_isLoadingMore)
                        const SizedBox(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: AppColors.primaryBlue,
                          ),
                        )
                      else
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 16,
                          color: AppColors.primaryBlue,
                        ),
                      const SizedBox(width: 8),
                      Text(
                        _isLoadingMore ? 'Loading...' : 'Load more movies',
                        style: GoogleFonts.inter(
                          textStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 5. Footer VILIX
            const VilixFooter(),
          ],
        ),
      ),
    );
  }
}
