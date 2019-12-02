import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LeaderPhone extends StatelessWidget {
  final String image;
  final String mobile;

  const LeaderPhone({Key key, this.image, this.mobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Image.network(image, fit: BoxFit.fill),
        onTap: () async {
          var url = 'tel:$mobile';
          if (await canLaunch(url)) {
            await launch(url);
          } else {
            print('could not launch $url');
          }
        },
      ),
    );
  }
}
