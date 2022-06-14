import 'package:flutter/material.dart';
import 'package:newsapp/screens/WebViewScr.dart';

Widget buildArticleItem(dynamic article, index,context) => InkWell(
  onTap: (() {
    Navigator.push( context, MaterialPageRoute(builder: ((context) => WebViewScr(article[index]['url']) )));
  }),
  child:   Padding(
  
        padding: EdgeInsets.all(5),
  
        child: Container(
  
          height: 320,
  
          decoration: BoxDecoration(
  
              color: Colors.blueGrey, borderRadius: BorderRadius.circular(16)),
  
          child: Column(
  
            children: [
  
              Padding(
  
                padding: const EdgeInsets.all(5.0),
  
                child: Container(
  
                  decoration: BoxDecoration(
  
                      borderRadius: BorderRadius.circular(16),
  
                      image: DecorationImage(
  
                        image: NetworkImage('${article[index]["urlToImage"]}'),
  
                      )),
  
                  height: 200,
  
                  width: double.infinity,
  
                  // child: Image.network(
  
                  //   '${article[index]["urlToImage"]}',
  
                  //   fit: BoxFit.fill,
  
                  // ),
  
                ),
  
              ),
  
              Column(
  
                children: [
  
                  Text(
  
                    '${article[index]["title"]}',
  
                    style: TextStyle(
  
                      fontSize: 20,
  
                      fontWeight: FontWeight.bold,
  
                    ),
  
                    maxLines: 2,
  
                  ),
  
                  Text(
  
                    '${article[index]["publishedAt"]}',
  
                    style: TextStyle(fontSize: 16, color: Colors.greenAccent),
  
                  ),
  
                ],
  
              )
  
            ],
  
          ),
  
        ),
  
      ),
);
