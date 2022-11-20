class Items {
  final String img;
  final String title;
  final String subTitle;

  ///
  Items({
    required this.img,
    required this.title,
    required this.subTitle,
  });
}

List<Items> listOfItems = [
  Items(
    img: "assets/1.png",
    title: "my dream house is a huge \nhouse also ",
    subTitle:
    "a swimming pool in the house and a quite room to relax in\n my dream house should\n be in a good",
  ),
  Items(
    img: "assets/3.png",
    title: "area near to a beachg\nmy dream",
    subTitle:
    "house should have a nice garden\n The garden in the house\n makes the house",
  ),
  Items(
    img: "assets/3.png",
    title: "looks good we have a\n small garden ",
    subTitle: "My mother takes care\n of it every day",
  ),
];