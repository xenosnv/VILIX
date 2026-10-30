import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/vilix_footer.dart';
import '../data/mock_data.dart';
import 'widgets/episode_card_list.dart';
import 'widgets/hero_slider.dart';
import 'widgets/horizontal_card_list.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool>? onScrollChanged;

  const HomeScreen({
    super.key,
    this.onScrollChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  late final ScrollController _scrollController;
  bool _isScrolled = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final scrolled = _scrollController.offset > 20;
    if (scrolled != _isScrolled) {
      setState(() {
        _isScrolled = scrolled;
      });
      widget.onScrollChanged?.call(scrolled);
    }
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
            // Hero Slider with dynamic autoplay & cursive/sans titles
            const HeroSlider(slides: MockData.heroSlides),

            // Trending Now (with All, Movies, TV Series filter)
            const HorizontalCardList(
              title: 'Trending Now',
              items: MockData.trendingNow,
              showCategoryFilter: true,
            ),

            // Trending in Indonesia (with All, Movies, TV Series filter)
            const HorizontalCardList(
              title: 'Trending in Indonesia',
              items: MockData.trendingIndonesia,
              showCategoryFilter: true,
            ),

            // Apple TV+ Originals
            const HorizontalCardList(
              title: 'Apple TV+ Originals',
              items: MockData.appleTvOriginals,
              showViewAll: true,
            ),

            // Anime
            const HorizontalCardList(
              title: 'Anime',
              items: MockData.animeList,
              showViewAll: true,
            ),

            // Recently Added Movies
            const HorizontalCardList(
              title: 'Recently Added Movies',
              items: MockData.recentlyAddedMovies,
              showViewAll: true,
            ),

            // Recently Added Series
            const HorizontalCardList(
              title: 'Recently Added Series',
              items: MockData.recentlyAddedSeries,
              showViewAll: true,
            ),

            // Recently Added Episodes (16:9 thumbnails)
            const EpisodeCardList(
              episodes: MockData.recentlyAddedEpisodes,
            ),

            // Footer
            const VilixFooter(),
          ],
        ),
      ),
    );
  }
}
