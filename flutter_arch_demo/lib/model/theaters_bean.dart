class TheatersBean {
  int count;
  int start;
  int total;
  List<Subjects> subjects;
  String title;

  TheatersBean({this.count, this.start, this.total, this.subjects, this.title});

  TheatersBean.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    start = json['start'];
    total = json['total'];
    if (json['subjects'] != null) {
      subjects = new List<Subjects>();
      json['subjects'].forEach((v) {
        subjects.add(new Subjects.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['start'] = this.start;
    data['total'] = this.total;
    if (this.subjects != null) {
      data['subjects'] = this.subjects.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    return data;
  }
}

class Subjects {
  Rating rating;
  List<String> genres;
  String title;
  List<Casts> casts;
  List<String> durations;
  int collectCount;
  String mainlandPubdate;
  bool hasVideo;
  String originalTitle;
  String subtype;
  List<String> pubdates;
  String year;
  Avatars images;
  String alt;
  String id;

  Subjects(
      {this.rating,
      this.genres,
      this.title,
      this.casts,
      this.durations,
      this.collectCount,
      this.mainlandPubdate,
      this.hasVideo,
      this.originalTitle,
      this.subtype,
      this.pubdates,
      this.year,
      this.images,
      this.alt,
      this.id});

  Subjects.fromJson(Map<String, dynamic> json) {
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    genres = json['genres'].cast<String>();
    title = json['title'];
    if (json['casts'] != null) {
      casts = new List<Casts>();
      json['casts'].forEach((v) {
        casts.add(new Casts.fromJson(v));
      });
    }
    durations = json['durations'].cast<String>();
    collectCount = json['collect_count'];
    mainlandPubdate = json['mainland_pubdate'];
    hasVideo = json['has_video'];
    originalTitle = json['original_title'];
    subtype = json['subtype'];

    pubdates = json['pubdates'].cast<String>();
    year = json['year'];
    images =
        json['images'] != null ? new Avatars.fromJson(json['images']) : null;
    alt = json['alt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['genres'] = this.genres;
    data['title'] = this.title;
    if (this.casts != null) {
      data['casts'] = this.casts.map((v) => v.toJson()).toList();
    }
    data['durations'] = this.durations;
    data['collect_count'] = this.collectCount;
    data['mainland_pubdate'] = this.mainlandPubdate;
    data['has_video'] = this.hasVideo;
    data['original_title'] = this.originalTitle;
    data['subtype'] = this.subtype;

    data['pubdates'] = this.pubdates;
    data['year'] = this.year;
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    data['alt'] = this.alt;
    data['id'] = this.id;
    return data;
  }
}

class Rating {
  int max;
  double average;
  String stars;
  int min;

  Rating({this.max, this.average, this.stars, this.min});

  Rating.fromJson(Map<String, dynamic> json) {
    max = json['max'];
    average = json['average'] * 1.0;
    stars = json['stars'];
    min = json['min'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['max'] = this.max;
    data['average'] = this.average;
    data['stars'] = this.stars;
    data['min'] = this.min;
    return data;
  }
}

class Casts {
  Avatars avatars;
  String nameEn;
  String name;
  String alt;
  String id;

  Casts({this.avatars, this.nameEn, this.name, this.alt, this.id});

  Casts.fromJson(Map<String, dynamic> json) {
    avatars =
        json['avatars'] != null ? new Avatars.fromJson(json['avatars']) : null;
    nameEn = json['name_en'];
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['name_en'] = this.nameEn;
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    return data;
  }
}

class Avatars {
  String small;
  String large;
  String medium;

  Avatars({this.small, this.large, this.medium});

  Avatars.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}
