class HeroSlide {
  final String title;
  final bool isCursive;
  final String rating;
  final String year;
  final String duration;
  final String genres;
  final String image;

  const HeroSlide({
    required this.title,
    required this.isCursive,
    required this.rating,
    required this.year,
    required this.duration,
    required this.genres,
    required this.image,
  });
}

class MediaItem {
  final String title;
  final String image;
  final String rating;
  final int views;
  final int? rank;
  final String tag;
  final String? typeTag; // e.g. "TV", "MOVIE"
  final bool isGreenTag;
  final String type; // 'movie' or 'tv'

  const MediaItem({
    required this.title,
    required this.image,
    required this.rating,
    required this.views,
    this.rank,
    required this.tag,
    this.typeTag,
    this.isGreenTag = false,
    required this.type,
  });
}

class EpisodeItem {
  final String episodeCode;
  final String title;
  final String seriesName;
  final String image;
  final int views;

  const EpisodeItem({
    required this.episodeCode,
    required this.title,
    required this.seriesName,
    required this.image,
    required this.views,
  });
}

class MockData {
  static const List<HeroSlide> movieHeroSlides = [
    HeroSlide(
      title: "Spider-Man: No Way Home",
      isCursive: false,
      rating: "9.4",
      year: "2021",
      duration: "2h 28m",
      genres: "Action, Sci-Fi",
      image: "https://image.tmdb.org/t/p/original/3fxf7OTYZRx6Rm3u7oWTbnlLB06.jpg",
    ),
    HeroSlide(
      title: "Deadpool & Wolverine",
      isCursive: false,
      rating: "8.9",
      year: "2024",
      duration: "2h 08m",
      genres: "Action, Comedy",
      image: "https://lumiere-a.akamaihd.net/v1/images/deadpool_wolverine_fcda3d51.png?region=0%2C0%2C540%2C810",
    ),
    HeroSlide(
      title: "Verity",
      isCursive: true,
      rating: "6.4",
      year: "2026",
      duration: "1h 54m",
      genres: "Mystery, Thriller",
      image: "https://www.miconcinemas.com/media/3781/vrty_2026_payoff_social_fb_twitter_1080x1600.jpg",
    ),
  ];

  static const List<HeroSlide> tvSeriesHeroSlides = [
    HeroSlide(
      title: "Doctor X: Mafia in White",
      isCursive: false,
      rating: "10.0",
      year: "2025",
      duration: "S1 10 Eps",
      genres: "Drama, Medical",
      image: "https://cdn.bingebase.com/tv_shows/124751/posters/nDDVzQfv95PGwj9nV2fJvUrkcvU.webp",
    ),
    HeroSlide(
      title: "Loki",
      isCursive: false,
      rating: "9.1",
      year: "2023",
      duration: "S2 6 Eps",
      genres: "Action, Sci-Fi",
      image: "https://storage.evrimagaci.org/old/mi_media/74ec030d75fe19dae8c9b1b018cbc640.jpeg",
    ),
    HeroSlide(
      title: "VisionQuest",
      isCursive: false,
      rating: "9.3",
      year: "2026",
      duration: "S1 8 Eps",
      genres: "Action, Sci-Fi",
      image: "https://i.headtopics.com/images/2026/9/17/screenrant/visionquest-marvel-studios-revives-vision-on-disne-visionquest-marvel-studios-revives-vision-on-disne-B5A3CF0FA92190A03CCF13EDDE8C864E.webp",
    ),
  ];

  static const List<MediaItem> catalogMovies = [
    MediaItem(
      title: "Deadpool & Wolverine",
      image: "https://lumiere-a.akamaihd.net/v1/images/deadpool_wolverine_fcda3d51.png?region=0%2C0%2C540%2C810",
      rating: "8.9",
      views: 182,
      tag: "WEB-DL",
      typeTag: "MOVIE",
      type: "movie",
    ),
    MediaItem(
      title: "Spider-Man: No Way Home",
      image: "https://image.tmdb.org/t/p/original/3fxf7OTYZRx6Rm3u7oWTbnlLB06.jpg",
      rating: "9.4",
      views: 215,
      tag: "WEB-DL",
      typeTag: "MOVIE",
      type: "movie",
    ),
    MediaItem(
      title: "Spider-Man: Across the Spider-Verse",
      image: "https://image.tmdb.org/t/p/w500/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
      rating: "9.5",
      views: 198,
      tag: "WEB-DL",
      typeTag: "MOVIE",
      type: "movie",
    ),
    MediaItem(
      title: "Avengers: Doomsday",
      image: "https://media.indulgexpress.com/indulgexpress/2025-10-21/fd73ksu9/Doomsday-by-VISCOM-1-1.jpg",
      rating: "9.8",
      views: 240,
      tag: "WEB-DL",
      typeTag: "MOVIE",
      type: "movie",
    ),
    MediaItem(
      title: "Avengers: Infinity War",
      image: "https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg",
      rating: "9.6",
      views: 310,
      tag: "WEB-DL",
      typeTag: "MOVIE",
      type: "movie",
    ),
    MediaItem(
      title: "Verity (2026)",
      image: "https://www.miconcinemas.com/media/3781/vrty_2026_payoff_social_fb_twitter_1080x1600.jpg",
      rating: "6.4",
      views: 40,
      tag: "WEB-DL",
      typeTag: "MOVIE",
      type: "movie",
    ),
    MediaItem(
      title: "The Instigators",
      image: "https://resizing.flixster.com/ZhmRvZrgtAANxIAlTYxHRt_0Gfw%3D/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzZmOGNhZTljLTM2MDItNDY0MC05ZDE1LTM2ZDM4OGNjZjA5ZC5wbmc%3D",
      rating: "6.2",
      views: 0,
      tag: "WEB-DL",
      typeTag: "MOVIE",
      type: "movie",
    ),
  ];

  static const List<MediaItem> catalogTvSeries = [
    MediaItem(
      title: "Doctor X: Mafia in White",
      image: "https://cdn.bingebase.com/tv_shows/124751/posters/nDDVzQfv95PGwj9nV2fJvUrkcvU.webp",
      rating: "10.0",
      views: 101,
      tag: "S1",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "VisionQuest (2026)",
      image: "https://i.headtopics.com/images/2026/9/17/screenrant/visionquest-marvel-studios-revives-vision-on-disne-visionquest-marvel-studios-revives-vision-on-disne-B5A3CF0FA92190A03CCF13EDDE8C864E.webp",
      rating: "9.3",
      views: 105,
      tag: "S1",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "The Mentalist",
      image: "https://image.tmdb.org/t/p/w500/pIqZDcC6QbQcB20VdmVu6WxCrG7.jpg",
      rating: "8.8",
      views: 94,
      tag: "S7",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "Loki",
      image: "https://storage.evrimagaci.org/old/mi_media/74ec030d75fe19dae8c9b1b018cbc640.jpeg",
      rating: "9.1",
      views: 120,
      tag: "S2",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "Driving Mom Crazy",
      image: "https://pavilion.taicca.tw/wp-content/uploads/2026/09/DRIVING-MOM-CRAZY_1.jpg",
      rating: "8.5",
      views: 0,
      tag: "S1",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "Fired Up! (2026)",
      image: "https://ryttvfcfwsizlsywokpt.supabase.co/storage/v1/object/public/article-images/featured/eric-chou-fired-up-hbo-max-taiwan-itaewon-class-remake-july-31.webp",
      rating: "8.2",
      views: 0,
      tag: "S1",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "Call My Manager",
      image: "https://artworks.thetvdb.com/banners/v4/series/479377/posters/6a369475b23d3.jpg",
      rating: "8.0",
      views: 0,
      tag: "S1",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "Merry Berry Love (2026)",
      image: "https://thetv.jp/i/nw/1437654/18404595.jpg?w=1284",
      rating: "7.9",
      views: 7,
      tag: "S1",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "R.J. Decker (2026)",
      image: "https://static.tvmaze.com/uploads/images/original_untouched/638/1597467.jpg",
      rating: "8.1",
      views: 0,
      tag: "S2",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "Dragon Ball Super",
      image: "https://image.tmdb.org/t/p/w500/trFogXO1TuNYByqGb17RPNTURzt.jpg",
      rating: "9.8",
      views: 24,
      tag: "S1",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "My Hero Academia",
      image: "https://static.zerochan.net/Boku.no.Hero.Academia.1024.2688847.webp",
      rating: "8.6",
      views: 18,
      tag: "S6",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "The Seven Deadly Sins",
      image: "https://dnm.nflximg.net/api/v6/mAcAr9TxZIVbINe88xb3Teg5_OA/AAAABXXrFouJ1BDfydqSRjjZg45I7THjFqb0iQStC0v0ZfB7-45qO9id3sHhBgAcCpjUhJOahHMpIfR2Y7kBFcOV7E6aHEZk1Woeu5pg.jpg?r=062",
      rating: "8.4",
      views: 15,
      tag: "S5",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "Shrinking (2023)",
      image: "https://assets.gadgets360cdn.com/pricee/assets/product/202601/shrinking_S3_p1_1767770348.jpg",
      rating: "7.8",
      views: 0,
      tag: "S3",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "Real Madrid: Until The End",
      image: "https://resizing.flixster.com/b0M0HHjTnkAzoD5O26fy-vjckUM%3D/ems.cHJkLWVtcy1hc3NldHMvdHZzZWFzb24vNjljZjk0MDktNmU5ZC00ZWRkLTk0MmYtY2E0YmZiMGJiZTU5LnBuZw%3D%3D",
      rating: "8.0",
      views: 2,
      tag: "S1",
      typeTag: "TV",
      type: "tv",
    ),
  ];

  static const List<HeroSlide> heroSlides = [
    HeroSlide(
      title: "Verity",
      isCursive: true,
      rating: "6.4",
      year: "2026",
      duration: "1h 54m",
      genres: "Mystery, Thriller",
      image: "https://www.miconcinemas.com/media/3781/vrty_2026_payoff_social_fb_twitter_1080x1600.jpg",
    ),
    HeroSlide(
      title: "Doctor X: Mafia in White",
      isCursive: false,
      rating: "10.0",
      year: "2025",
      duration: "S1 10 Eps",
      genres: "Drama, Medical",
      image: "https://cdn.bingebase.com/tv_shows/124751/posters/nDDVzQfv95PGwj9nV2fJvUrkcvU.webp",
    ),
    HeroSlide(
      title: "Deadpool & Wolverine",
      isCursive: false,
      rating: "8.9",
      year: "2024",
      duration: "2h 08m",
      genres: "Action, Comedy",
      image: "https://lumiere-a.akamaihd.net/v1/images/deadpool_wolverine_fcda3d51.png?region=0%2C0%2C540%2C810",
    ),
    HeroSlide(
      title: "Spider-Man: No Way Home",
      isCursive: false,
      rating: "9.4",
      year: "2021",
      duration: "2h 28m",
      genres: "Action, Adventure",
      image: "https://image.tmdb.org/t/p/original/3fxf7OTYZRx6Rm3u7oWTbnlLB06.jpg",
    ),
  ];

  static const List<MediaItem> trendingNow = [
    MediaItem(
      title: "Doctor X: Mafia in White",
      image: "https://cdn.bingebase.com/tv_shows/124751/posters/nDDVzQfv95PGwj9nV2fJvUrkcvU.webp",
      rating: "10.0",
      views: 101,
      rank: 1,
      tag: "S1",
      type: "tv",
    ),
    MediaItem(
      title: "VisionQuest (2026)",
      image: "https://i.headtopics.com/images/2026/9/17/screenrant/visionquest-marvel-studios-revives-vision-on-disne-visionquest-marvel-studios-revives-vision-on-disne-B5A3CF0FA92190A03CCF13EDDE8C864E.webp",
      rating: "9.3",
      views: 105,
      rank: 2,
      tag: "S1",
      type: "tv",
    ),
    MediaItem(
      title: "The Mentalist",
      image: "https://image.tmdb.org/t/p/w500/pIqZDcC6QbQcB20VdmVu6WxCrG7.jpg",
      rating: "8.8",
      views: 94,
      rank: 3,
      tag: "S7",
      type: "tv",
    ),
    MediaItem(
      title: "Deadpool & Wolverine",
      image: "https://lumiere-a.akamaihd.net/v1/images/deadpool_wolverine_fcda3d51.png?region=0%2C0%2C540%2C810",
      rating: "8.9",
      views: 182,
      rank: 4,
      tag: "HD",
      type: "movie",
    ),
    MediaItem(
      title: "Loki",
      image: "https://storage.evrimagaci.org/old/mi_media/74ec030d75fe19dae8c9b1b018cbc640.jpeg",
      rating: "9.1",
      views: 120,
      rank: 5,
      tag: "S2",
      type: "tv",
    ),
  ];

  static const List<MediaItem> trendingIndonesia = [
    MediaItem(
      title: "Spider-Man: No Way Home",
      image: "https://image.tmdb.org/t/p/original/3fxf7OTYZRx6Rm3u7oWTbnlLB06.jpg",
      rating: "9.4",
      views: 215,
      rank: 1,
      tag: "HD",
      type: "movie",
    ),
    MediaItem(
      title: "Spider-Man: Across the Spider-Verse",
      image: "https://image.tmdb.org/t/p/w500/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
      rating: "9.5",
      views: 198,
      rank: 2,
      tag: "HD",
      type: "movie",
    ),
    MediaItem(
      title: "Avengers: Doomsday",
      image: "https://media.indulgexpress.com/indulgexpress/2025-10-21/fd73ksu9/Doomsday-by-VISCOM-1-1.jpg",
      rating: "9.8",
      views: 240,
      tag: "4K",
      type: "movie",
    ),
    MediaItem(
      title: "Avengers: Infinity War",
      image: "https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg",
      rating: "9.6",
      views: 310,
      rank: 4,
      tag: "4K",
      type: "movie",
    ),
  ];

  static const List<MediaItem> appleTvOriginals = [
    MediaItem(
      title: "Real Madrid: Until The End",
      image: "https://resizing.flixster.com/b0M0HHjTnkAzoD5O26fy-vjckUM%3D/ems.cHJkLWVtcy1hc3NldHMvdHZzZWFzb24vNjljZjk0MDktNmU5ZC00ZWRkLTk0MmYtY2E0YmZiMGJiZTU5LnBuZw%3D%3D",
      rating: "8.0",
      views: 2,
      tag: "S1",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "Shrinking (2023)",
      image: "https://assets.gadgets360cdn.com/pricee/assets/product/202601/shrinking_S3_p1_1767770348.jpg",
      rating: "7.8",
      views: 0,
      tag: "S3",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "The Instigators",
      image: "https://resizing.flixster.com/ZhmRvZrgtAANxIAlTYxHRt_0Gfw%3D/ems.cHJkLWVtcy1hc3NldHMvbW92aWVzLzZmOGNhZTljLTM2MDItNDY0MC05ZDE1LTM2ZDM4OGNjZjA5ZC5wbmc%3D",
      rating: "6.2",
      views: 0,
      tag: "",
      typeTag: "MOVIE",
      type: "movie",
    ),
  ];

  static const List<MediaItem> animeList = [
    MediaItem(
      title: "Dragon Ball Super",
      image: "https://image.tmdb.org/t/p/w500/trFogXO1TuNYByqGb17RPNTURzt.jpg",
      rating: "9.8",
      views: 24,
      tag: "S1",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "My Hero Academia",
      image: "https://static.zerochan.net/Boku.no.Hero.Academia.1024.2688847.webp",
      rating: "8.6",
      views: 18,
      tag: "S6",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "The Seven Deadly Sins",
      image: "https://dnm.nflximg.net/api/v6/mAcAr9TxZIVbINe88xb3Teg5_OA/AAAABXXrFouJ1BDfydqSRjjZg45I7THjFqb0iQStC0v0ZfB7-45qO9id3sHhBgAcCpjUhJOahHMpIfR2Y7kBFcOV7E6aHEZk1Woeu5pg.jpg?r=062",
      rating: "8.4",
      views: 15,
      tag: "S5",
      typeTag: "TV",
      type: "tv",
    ),
  ];

  static const List<MediaItem> recentlyAddedMovies = [
    MediaItem(
      title: "Deadpool & Wolverine",
      image: "https://lumiere-a.akamaihd.net/v1/images/deadpool_wolverine_fcda3d51.png?region=0%2C0%2C540%2C810",
      rating: "8.9",
      views: 182,
      tag: "WEB-DL",
      typeTag: "MOVIE",
      isGreenTag: true,
      type: "movie",
    ),
    MediaItem(
      title: "Avengers: Infinity War",
      image: "https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg",
      rating: "9.6",
      views: 310,
      tag: "WEB-DL",
      typeTag: "MOVIE",
      isGreenTag: true,
      type: "movie",
    ),
    MediaItem(
      title: "Spider-Man: No Way Home",
      image: "https://image.tmdb.org/t/p/original/3fxf7OTYZRx6Rm3u7oWTbnlLB06.jpg",
      rating: "9.4",
      views: 215,
      tag: "WEB-DL",
      typeTag: "MOVIE",
      isGreenTag: true,
      type: "movie",
    ),
  ];

  static const List<MediaItem> recentlyAddedSeries = [
    MediaItem(
      title: "Driving Mom Crazy",
      image: "https://pavilion.taicca.tw/wp-content/uploads/2026/09/DRIVING-MOM-CRAZY_1.jpg",
      rating: "8.5",
      views: 0,
      tag: "S1",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "Fired Up! (2026)",
      image: "https://ryttvfcfwsizlsywokpt.supabase.co/storage/v1/object/public/article-images/featured/eric-chou-fired-up-hbo-max-taiwan-itaewon-class-remake-july-31.webp",
      rating: "-",
      views: 0,
      tag: "S1",
      typeTag: "TV",
      type: "tv",
    ),
    MediaItem(
      title: "Call My Manager",
      image: "https://artworks.thetvdb.com/banners/v4/series/479377/posters/6a369475b23d3.jpg",
      rating: "-",
      views: 0,
      tag: "",
      typeTag: "TV",
      type: "tv",
    ),
  ];

  static const List<EpisodeItem> recentlyAddedEpisodes = [
    EpisodeItem(
      episodeCode: "S01 E04",
      title: "S01 E04: Episode 4",
      seriesName: "Merry Berry Love (2026)",
      image: "https://thetv.jp/i/nw/1437654/18404595.jpg?w=1284",
      views: 7,
    ),
    EpisodeItem(
      episodeCode: "S02 E07",
      title: "S02 E07: Before You Awake",
      seriesName: "R.J. Decker (2026)",
      image: "https://static.tvmaze.com/uploads/images/original_untouched/638/1597467.jpg",
      views: 0,
    ),
  ];
}
