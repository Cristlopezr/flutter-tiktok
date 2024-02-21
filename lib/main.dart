import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok/config/theme/app_theme.dart';
import 'package:tiktok/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tiktok/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:tiktok/presentation/providers/discover_provider.dart';
import 'package:tiktok/presentation/screens/discover/discover_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasourceImpl());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                DiscoverProvider(videosRepository: videoPostRepository)
                  ..loadNextPage())
      ],
      child: MaterialApp(
          theme: AppTheme().getTheme(),
          debugShowCheckedModeBanner: false,
          title: 'TikTok',
          home: const DiscoverScreen()),
    );
  }
}
