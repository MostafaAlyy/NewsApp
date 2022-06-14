import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cupit/States.dart';
import 'package:newsapp/cupit/cupit.dart';
import 'package:newsapp/shared/componants.dart';

class BusnisScr extends StatelessWidget {
  const BusnisScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: ((context, state) {
          if (state != NewBusnissGetlodingState) {
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildArticleItem(NewsCubit.get(context).busniss, index,context),
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: NewsCubit.get(context).busniss.length);
          } else {
            return CircularProgressIndicator();
          }
        }));
  }
}
