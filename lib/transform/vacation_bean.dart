class VacationBean {
  String url;
  String name;

  VacationBean(this.url, this.name);

  static List<VacationBean> generate() {
    return [
      VacationBean("assets/images/1.jpg", "Japan"),
      VacationBean("assets/images/2.jpg", "Franch"),
      VacationBean("assets/images/3.jpg", "Paris"),
      VacationBean("assets/images/4.jpg", "London"),
      VacationBean("assets/images/5.jpg", "China"),
    ];
  }
}
