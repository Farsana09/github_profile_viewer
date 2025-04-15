class GitHubRepo {
  final String name;
  final String htmlUrl;
  final String description;

  GitHubRepo({
    required this.name,
    required this.htmlUrl,
    required this.description,
  });

  factory GitHubRepo.fromJson(Map<String, dynamic> json) {
    return GitHubRepo(
      name: json['name'],
      htmlUrl: json['html_url'],
      description: json['description'] ?? '',
    );
  }
}
