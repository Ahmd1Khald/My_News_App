import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/bloc/app_cubits.dart';
import 'package:mynewsapp/bloc/app_states.dart';
import 'package:mynewsapp/shared/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        List list = AppCubit.get(context).sports;
        return ListView.separated(
          itemBuilder: (context, index) => ItemBuilder(list[index],context),
          separatorBuilder: (context, index) => Container(),
          itemCount: list.length,
          physics:  BouncingScrollPhysics(),

        );
      },
    );
  }
}
