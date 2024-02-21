import 'package:tiktok/domain/datasources/video_posts_datasource.dart';
import 'package:tiktok/domain/entities/video_post.dart';
import 'package:tiktok/domain/repositories/video_posts_repository.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {
  final VideoPostDatasource videosDatasource;

  VideoPostsRepositoryImpl({required this.videosDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }
}
