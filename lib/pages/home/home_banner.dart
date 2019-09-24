import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:zz_living/models/home_page_model.dart';


class HomeBanner extends StatelessWidget {
  final List<Slides> bannerImages;

  const HomeBanner({Key key,@required this.bannerImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        child: Swiper(
          pagination: SwiperPagination(),
          autoplay: true,
          itemCount: bannerImages.length,
          itemBuilder: (context, index){
            return InkWell(
              child: Image.network(bannerImages[index].image,fit: BoxFit.fill,),
              onTap: (){

              },
            );
          },
        ),
    );
  }
}