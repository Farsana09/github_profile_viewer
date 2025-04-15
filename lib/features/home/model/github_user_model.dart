
class GitHubUser {
  final String login;
  final String avatarUrl;
  final String bio;
  final int publicRepos;

  GitHubUser({
    required this.login,
    required this.avatarUrl,
    required this.bio,
    required this.publicRepos,
  });

  factory GitHubUser.fromJson(Map<String, dynamic> json) {
    return GitHubUser(
      login: json['login'],
      avatarUrl: json['avatar_url'],
      bio: json['bio'] ?? '',
      publicRepos: json['public_repos'],
    );
  }
}
