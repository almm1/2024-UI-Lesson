import 'package:app1/models/album_model.dart';
import 'package:app1/models/track_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  List<AlbumModel> albums = [];
  void _getAlbum() {
    albums = AlbumModel.getAlbum();
  }

  List<TrackModel> tracks = [];
  void _getTracks() {
    tracks = TrackModel.getTracks();
  }

  void init() {
    _getAlbum();
    _getTracks();
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(
      backgroundColor: Color(0xFF0F0817),
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Color(0xFF781ECF), Color(0xFF0F0817)],
                focalRadius: 0.001,
                radius: 1.1,
                focal: Alignment.centerLeft)),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              const SizedBox(
                height: 24,
              ),
              searchTextField(),
              const SizedBox(
                height: 40,
              ),
              const CategoryWidget(),
              const SizedBox(
                height: 24,
              ),
              category(),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Your favourites",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Flexible(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Row(
                        // mainAxisAlignment: MainAxisAlignment.,
                        children: [
                          Image.asset(tracks[index].logoPath),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tracks[index].title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  tracks[index].artist,
                                  style: TextStyle(
                                      color: Color(0xFFA5A5A5),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                              child: Text(
                            tracks[index].duration,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ))
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 24,
                      );
                    },
                    itemCount: tracks.length),
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox category() {
    return SizedBox(
      height: 268,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: albums.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 24,
        ),
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                albums[index].iconPath,
                // width: 202,
                // height: 208,
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  albums[index].title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  albums[index].description,
                  style: TextStyle(
                      color: Color(0xFFA5A5A5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  SizedBox searchTextField() {
    return SizedBox(
      height: 48,
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            contentPadding: const EdgeInsets.only(top: 1),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            fillColor: const Color(0xFF433E48),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SvgPicture.asset('assets/icons/search.svg'),
            ),
            prefixIconColor: const Color(0xFFA5A5A5),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 24, minHeight: 24),
            hintStyle: const TextStyle(color: Color(0xFFA5A5A5)),
            hintText: "Search song, playlist, artist..."),
      ),
    );
  }

  Column header() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 48,
        ),
        Text(
          "Welcome back!",
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "What do you fell like today?",
          style: TextStyle(
              fontSize: 14,
              color: Color(0xFFA5A5A5),
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> categoryList = [
      "Recent",
      "Top 50",
      "Chill",
      "R&B",
      "Festival",
      "Pop",
      "Hip-Hop",
      "Gavnovoz"
    ];
    int selectNumber = 1;
    return SizedBox(
      height: 28,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: categoryList.length,
          separatorBuilder: (context, index) => const SizedBox(
                width: 32,
              ),
          itemBuilder: (context, index) {
            return Column(children: [
              Text(categoryList[index],
                  style: TextStyle(
                      color: selectNumber == index
                          ? Colors.white
                          : const Color(0xFFA5A5A5),
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
            ]);
          }),
    );
  }
}
