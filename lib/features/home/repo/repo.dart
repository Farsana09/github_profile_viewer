import 'package:dio/dio.dart';
import 'package:my_books/features/home/model/github_repo_model.dart';
import 'package:my_books/features/home/model/github_user_model.dart';


class GitHubService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://api.github.com/'));

  Future<GitHubUser> fetchUser(String username) async {
    final response = await _dio.get('/users/$username');
    return GitHubUser.fromJson(response.data);
  }

  Future<List<GitHubRepo>> fetchRepos(String username) async {
    final response = await _dio.get('/users/$username/repos');
    return (response.data as List)
        .map((e) => GitHubRepo.fromJson(e))
        .toList();
  }
}
