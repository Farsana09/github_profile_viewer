import 'package:flutter/material.dart';
import 'package:my_books/features/home/view/profile_tab_screen.dart';
import 'package:my_books/features/home/view/repo_tab_screen.dart';
import 'package:my_books/features/home/view_model/github_view_model.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
        backgroundColor: Colors.white,

      appBar: AppBar(title: const Text('GitHub Search')),
      body: Consumer<GitHubViewModel>(
        builder: (context, vm, _) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'Enter GitHub username',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => vm.search(controller.text),
                  ),
                ),
              ),
            ),
         
          if (vm.isLoading)
  const Expanded(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  )
            else if (vm.error.isNotEmpty)
              Text('Something went wrong')
            else if (vm.user != null)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: const [
                        TabBar(
                          tabs: [
                            Tab(text: 'Profile'),
                            Tab(text: 'Repositories'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [ProfileTab(), RepoTab()],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
