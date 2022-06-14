import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cupit/States.dart';
import '../cupit/cupit.dart';
import '../shared/componants.dart';

class ScienseScr extends StatelessWidget {
  const ScienseScr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: ((context, state) {
          if (state != NewScienceGetlodingState) {
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    buildArticleItem(NewsCubit.get(context).science, index,context),
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: NewsCubit.get(context).science.length);
          } else {
            return CircularProgressIndicator();
          }
        }));
  }
}
