import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/bloc/app_cubits.dart';
import 'package:mynewsapp/bloc/app_states.dart';
import 'package:mynewsapp/screens/search_screen.dart';
import 'package:mynewsapp/shared/components.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(onPressed: () {
                NavigateTo(context,SearchScreen());
              }, icon: const Icon(Icons.search_rounded)),
              IconButton(onPressed: () {
                cubit.changeAppMode();
              }, icon: const Icon(Icons.brightness_4)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items:const [
              BottomNavigationBarItem(
                icon:Icon(Icons.business),
                label:'Business',
              ),
              BottomNavigationBarItem(
                icon:Icon(Icons.sports),
                label:'Sports',
              ),
              BottomNavigationBarItem(
                icon:Icon(Icons.science),
                label:'Science',
              ),
            ],
            onTap: (index){
              cubit.changeBottomIndex(index:index);
            },
            currentIndex:cubit.bottomIndex,
          ),
          body: cubit.screens[cubit.bottomIndex],
        );
      },
    );
  }
}
