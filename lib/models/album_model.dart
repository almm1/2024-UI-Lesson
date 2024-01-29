class AlbumModel {
  String title;
  String description;
  String iconPath;

  AlbumModel({
    required this.title,
    required this.description,
    required this.iconPath,
  });

  static List<AlbumModel> getAlbum() {
    List<AlbumModel> album = [];

    album.add(AlbumModel(
        title: "R&B Playlist",
        description: "Chill yor mind",
        iconPath: 'assets/images/Rectangle90.png'));
    album.add(AlbumModel(
        title: "Dayli Mix",
        description: "Made for you",
        iconPath: 'assets/images/Rectangle90.png'));

    return album;
  }
}
