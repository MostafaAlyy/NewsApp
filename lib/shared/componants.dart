import 'package:flutter/material.dart';

Widget buildArticleItem(dynamic article,index) => Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                height: 200,
                width: double.infinity,
                child: Image.network(
                  'https://scontent.fcai20-1.fna.fbcdn.net/v/t39.30808-6/275248087_3087939231421295_2599991420738765212_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=BiIM7uJsl9gAX9Oikb9&_nc_ht=scontent.fcai20-1.fna&oh=00_AT_i8nScDucZnxFPi3K1F-fZvMHwWrM42qAgPODaVz-UzA&oe=62A4BFBC',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  'title',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
                Text(
                  '${article[index]["publishedAt"]}',
                  style: TextStyle(fontSize: 16, color: Colors.orange),
                ),
              ],
            )
          ],
        ),
      ),
    );
