import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cupit/States.dart';
import 'package:newsapp/cupit/cupit.dart';
import 'package:newsapp/shared/componants.dart';

class ScerchScr extends StatelessWidget {
  const ScerchScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cupit = NewsCubit.get(context);

    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: ((context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Search")),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: Colors.blueGrey,
                      shape: BoxShape.rectangle),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0)),
                      hintText: "Search",
                      prefix: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 1.0),
                        child: Icon(
                          Icons.search_rounded,
                          size: 28,
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    onChanged: (value) {
                      print(value);
                      cupit.getSearch(value);
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      buildArticleItem(cupit.search, index, context),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 5,
                  ),
                  itemCount: cupit.search.length,
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
