import 'package:flutter/material.dart';
import 'package:my_books/features/home/view_model/github_view_model.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<GitHubViewModel>(context).user!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
            radius: 40,
          ),
          const SizedBox(height: 10),
          Text(user.login,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Text(user.bio),
          const SizedBox(height: 10),
          Text('Public Repositories: ${user.publicRepos}'),
        ],
      ),
    );
  }
}
