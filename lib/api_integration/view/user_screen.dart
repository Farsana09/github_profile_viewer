import 'package:flutter/material.dart';
import 'package:task_project/api_integration/view_model/view_model.dart';
import 'package:provider/provider.dart';
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late ApiViewModel _apiViewModel;
  @override
  void initState() {
    _apiViewModel = ApiViewModel();
    super.initState();
    Future.microtask( _apiViewModel.  fetchUserData());
  }

  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _apiViewModel)
      ],
      child: Scaffold(
         body: SingleChildScrollView(
      child: Column(
        children: [
         
        ],
      ),
         ),
      ),
    );
  }
}