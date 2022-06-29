import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkText extends InkWell {
  LinkText({String text, String url})
      : super(
          child: Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.all(1),
            child: Text(
              text ?? url,
              style: TextStyle(
                  color: Colors.blue, decoration: TextDecoration.none),
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.blue, style: BorderStyle.solid),
              ),
            ),
          ),
          onTap: () {
            launch(url, forceSafariVC: false);
          },
        );
}
