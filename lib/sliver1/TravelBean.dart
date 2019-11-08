class TravelBean {
  String name;
  String location;
  String url;

  TravelBean(this.name, this.location, this.url);

  static List<TravelBean> generateTravelBean() {
    return [
      TravelBean("Peach", "Spain ES1", "assets/images/top1.jpg"),
      TravelBean("Grassland", "Spain ES2", "assets/images/top2.jpg"),
      TravelBean("Starry sky", "Spain ES3", "assets/images/top3.jpg"),
      TravelBean("Beauty Pic", "Spain ES4", "assets/images/top4.jpg"),
    ];
  }

  static List<TravelBean> generateMostPopularBean() {
    return [
      TravelBean("Peach", "Spain ES", "assets/images/bottom1.jpg"),
      TravelBean("Grassland", "Spain ES", "assets/images/bottom2.jpg"),
      TravelBean("Starry sky", "Spain ES", "assets/images/bottom3.jpg"),
      TravelBean("Beauty Pic", "Spain ES", "assets/images/bottom4.jpg"),
    ];
  }
}
