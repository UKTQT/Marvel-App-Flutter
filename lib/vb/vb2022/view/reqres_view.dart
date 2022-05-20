import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:marvel/vb/vb2022/service/service.dart';
import 'package:provider/provider.dart';

import '../viewModel/reqres_provider_vm.dart';
import '../viewModel/reqres_view_model.dart';

class ReqResView extends StatefulWidget {
  const ReqResView({Key? key}) : super(key: key);

  @override
  State<ReqResView> createState() => _ReqResViewState();
}

class _ReqResViewState extends State<ReqResView> {
  //extends ReqResViewModel
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqResProviderVm>(
      create: (context) => ReqResProviderVm(
        ReqresService(
          Dio(
            BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'),
          ),
        ),
      ),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
              title: context.watch<ReqResProviderVm>().isLoading
                  ? Text('ewq')
                  : Text('aaa')),
          /* body: ListView.builder(
            itemCount: resources.length,
            itemBuilder: (context, index) {
              return Text(resources[index].title ?? '');
            },
          ), */
        );
      },
    );
  }
}


//inspect(resources[index]);  gelen veriyi konsolda gösterir
