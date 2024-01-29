class TrackModel {
  String title;
  String artist;
  String duration;
  String logoPath;

  TrackModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.logoPath,
  });

  static List<TrackModel> getTracks() {
    List<TrackModel> tracks = [];
    tracks.add(TrackModel(
        title: "Bye Bye",
        artist: "Marshmello, Juice WRLD",
        duration: "2:09",
        logoPath: 'assets/images/Rectangle83.png'));
    tracks.add(TrackModel(
        title: "I Like You",
        artist: "Post Malone, Doja Cat",
        duration: "4:03",
        logoPath: 'assets/images/Rectangle83.png'));
    tracks.add(TrackModel(
        title: "Fountains",
        artist: "Drake, Tems",
        duration: "3:19",
        logoPath: 'assets/images/Rectangle83.png'));
    tracks.add(TrackModel(
        title: "Hands on you",
        artist: "Austin George",
        duration: "2:09",
        logoPath: 'assets/images/Rectangle83.png'));
    return tracks;
  }
}
