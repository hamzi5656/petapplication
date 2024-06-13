import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
class HomeSlider extends StatelessWidget {
  HomeSlider({super.key});
final List<String> images = [

    'https://d3i71xaburhd42.cloudfront.net/0203de1892205aaccc3c638c9d496beee1f8c151/5-Figure4-1.png',

     'https://www.consilium.europa.eu/media/67980/thumb.png',
     'https://centaur-wp.s3.eu-central-1.amazonaws.com/designweek/prod/content/uploads/2019/03/18111417/thisables-edit.jpg',
  
  ];
  @override
  Widget build(BuildContext context) {
    return  

 Center(
        child: CarouselSlider(
          options: CarouselOptions(
            aspectRatio: 10/6,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: images.map((String imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
      );
  
  }
}
