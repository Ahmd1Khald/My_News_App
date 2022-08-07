
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/bloc/app_cubits.dart';
import 'package:mynewsapp/bloc/app_states.dart';
import 'package:mynewsapp/shared/components.dart';

class SearchScreen extends StatelessWidget {

  var formkey=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener:(context,state){},
        builder:(context,state){
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(onPressed: (){
                AppCubit.get(context).search=[];
                Navigator.pop(context);
              }, icon:Icon(Icons.subdirectory_arrow_left),color:AppCubit.get(context).isDark?Colors.white:Colors.black,),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType:TextInputType.text ,
                        controller:formkey ,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius:BorderRadius.only(topRight:Radius.circular(25),bottomLeft: Radius.circular(25))
                          ),
                          prefixIcon: Icon(Icons.search_rounded),
                          labelText: 'Search',
                        ),
                        onChanged: (value){
                          AppCubit.get(context).getSearchData(value);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder:(context,index)=>ItemBuilder(AppCubit.get(context).search[index],context),
                    separatorBuilder: (context, index) => Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                    itemCount: AppCubit.get(context).search.length,
                  ),
                ),
              ],
            ),
          );
        },
    );
  }
}
