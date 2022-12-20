import 'package:flutter/material.dart';
import 'package:foodoodie/shared/layouts.dart';
import 'package:foodoodie/shared/widgets.dart';
import 'package:foodoodie/news_feed/news_feed.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Bootstrap(
      body: Column(
        children: const [
          GapWidget.vertical(8.0),
          //TODO: not signin

          //TODO: popular
          _PopularNow(),

          NewsFeedScreen(),
        ],
      ),
    );
  }
}

class _PopularNow extends StatelessWidget {
  const _PopularNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCardWidget(
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //*theme text header 1
              const Text(
                "Popular now",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //*theme text button link 3
              Text(
                "See more",
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.blue[700],
                ),
              ),
            ],
          ),
          const GapWidget.vertical(8.0),
          SizedBox(
            height: 190.0,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 130.0,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                );
              },
              separatorBuilder: (_, index) => const GapWidget.horizontal(10),
              itemCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}
