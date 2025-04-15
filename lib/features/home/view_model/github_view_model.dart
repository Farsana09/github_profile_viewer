import 'package:flutter/material.dart';
import 'package:my_books/features/home/model/github_repo_model.dart';
import 'package:my_books/features/home/model/github_user_model.dart';
import 'package:my_books/features/home/repo/repo.dart';


class GitHubViewModel extends ChangeNotifier {
  final GitHubService _service = GitHubService();

  GitHubUser? user;
  List<GitHubRepo> repos = [];
  List<GitHubRepo> filteredRepos = [];
  bool isLoading = false;
  String error = '';

  Future<void> search(String username) async {
    try {
      isLoading = true;
      notifyListeners();

      user = await _service.fetchUser(username);
      repos = await _service.fetchRepos(username);
      filteredRepos = repos;
      error = '';
    } catch (e) {
      error = 'Error: ${e.toString()}';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void filterRepos(String query) {
    filteredRepos = repos
        .where((r) => r.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
