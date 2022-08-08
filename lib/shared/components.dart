import 'package:flutter/material.dart';
import 'package:mynewsapp/screens/web%20view.dart';

Widget ItemBuilder(list,context)=>InkWell(
  onTap: (){
    NavigateTo(context,WebViewScreen("${list['url']}"));
  },
  child:   Padding(
  
    padding: const EdgeInsets.all(15.0),
  
    child: Row(

      mainAxisSize: MainAxisSize.min,
  
      children: [
  
        Container(
  
          height: 120,
  
          width: 130,
  
          decoration: BoxDecoration(
  
            borderRadius: const BorderRadius.all(Radius.circular(20)),
  
            image: DecorationImage(
  
              image:NetworkImage('${list['urlToImage']}'),
  
              fit: BoxFit.cover,
  
  
  
            ),
  
          ),
  
        ),
  
        const SizedBox(width: 20,),
  
        Expanded(
  
          child: SizedBox(
  
            height: 120,
  
            child: Column(
  
              crossAxisAlignment: CrossAxisAlignment.start,
  
              children: [
  
                Expanded(
  
                  child: Text('${list['title']}',
  
                    maxLines:4,
  
                    overflow: TextOverflow.ellipsis,
  
                    style: Theme.of(context).textTheme.headline6,
  
                  ),
  
                ),
  
                Text('${list['publishedAt']}',style: const TextStyle(
  
                    color: Colors.grey,
  
                    fontSize: 15
  
                ),)
  
              ],
  
            ),
  
          ),
  
        ),
  
      ],
  
    ),
  
  ),
);


void NavigateTo(context,widget)=>Navigator.push(
  context,
  MaterialPageRoute(builder:(context)=>widget),);