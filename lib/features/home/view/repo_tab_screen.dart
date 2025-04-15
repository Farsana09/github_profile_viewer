import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_books/features/home/view_model/github_view_model.dart';

class RepoTab extends StatelessWidget {
  const RepoTab({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<GitHubViewModel>(context);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Filter repositories',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: vm.filterRepos,
          ),
        ),
        Expanded(
          child: vm.filteredRepos.isEmpty
              ? const Center(child: Text('No repositories found.'))
              : ListView.separated(
                  itemCount: vm.filteredRepos.length,
                  itemBuilder: (_, index) {
                    final repo = vm.filteredRepos[index];
                    return ListTile(
                      title: Text(repo.name),
                      subtitle: Text(repo.description),
                      onTap: () => _launchURL(context, repo.htmlUrl),
                    );
                  }, separatorBuilder: (BuildContext context, int index) => SizedBox(height: 8,),
                ),
        ),
      ],
    );
  }
}


void _launchURL(BuildContext context, String url) async {
  try {
    final uri = Uri.parse(url); // Convert String to Uri
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // or .inAppWebView
    )) {
      throw 'Could not launch $url';
    }
  } catch (e) {
    Fluttertoast.showToast(msg: 'Could not launch URL: $e');
   
  }
}