class UserEntity {
  List<Results>? results;

  UserEntity({
    this.results,
  });

  UserEntity.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
  }
}

class Results {
  Name? name;
  Location? location;
  Picture? picture;

  Results({this.name, this.location, this.picture});
  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    picture =
        json['picture'] != null ? Picture.fromJson(json['picture']) : null;
  }
}

class Name {
  String? title;
  String? first;
  String? last;

  Name({this.title, this.first, this.last});

  Name.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    first = json['first'];
    last = json['last'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['title'] = title;
    data['first'] = first;
    data['last'] = last;
    return data;
  }
}

class Location {
  String? city;
  String? country;

  Location({
    this.city,
    this.country,
  });

  Location.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    country = json['country'];
  }
}

class Picture {
  String? large;
  String? medium;
  String? thumbnail;

  Picture({this.large, this.medium, this.thumbnail});

  Picture.fromJson(Map<String, dynamic> json) {
    large = json['large'];
    medium = json['medium'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['large'] = large;
    data['medium'] = medium;
    data['thumbnail'] = thumbnail;
    return data;
  }
}
