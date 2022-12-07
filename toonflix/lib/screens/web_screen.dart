import 'package:flutter/material.dart';
import 'package:toonflix/models/webtoon_model.dart';
import 'package:toonflix/services/api_service.dart';

class WebScreen extends StatelessWidget {
  WebScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService().getTodaysTonns();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Today\'s Webtoon',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        print(index);
        final webtoon = snapshot.data![index];
        return Text(webtoon.title);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 40,
        );
      },
    );
  }
}
