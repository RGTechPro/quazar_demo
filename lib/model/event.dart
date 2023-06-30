class EventData {
  Meta? meta;
  List<Event>? events;

  EventData({
    this.meta,
    this.events,
  });

  factory EventData.fromJson(Map<String, dynamic> json) {
    return EventData(
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      events: json['events'] != null
          ? List<Event>.from(json['events'].map((x) => Event.fromJson(x)))
          : null,
    );
  }
}

class Meta {
  Geolocation? geolocation;
  int? took;
  int? perPage;
  int? total;
  int? page;

  Meta({
    this.geolocation,
    this.took,
    this.perPage,
    this.total,
    this.page,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      geolocation: json['geolocation'] != null
          ? Geolocation.fromJson(json['geolocation'])
          : null,
      took: json['took'],
      perPage: json['per_page'],
      total: json['total'],
      page: json['page'],
    );
  }
}

class Geolocation {
  double? lat;
  double? lon;
  String? range;

  Geolocation({
    this.lat,
    this.lon,
    this.range,
  });

  factory Geolocation.fromJson(Map<String, dynamic> json) {
    return Geolocation(
      lat: json['lat']?.toDouble(),
      lon: json['lon']?.toDouble(),
      range: json['range'],
    );
  }
}

class Event {
  Stats? stats;
  String? title;
  String? url;
  DateTime? datetimeLocal;
  List<Performer>? performers;
  Venue? venue;
  String? shortTitle;
  DateTime? datetimeUtc;
  double? score;
  List<Taxonomy>? taxonomies;
  String? type;
  int? id;

  Event({
    this.stats,
    this.title,
    this.url,
    this.datetimeLocal,
    this.performers,
    this.venue,
    this.shortTitle,
    this.datetimeUtc,
    this.score,
    this.taxonomies,
    this.type,
    this.id,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      stats: json['stats'] != null ? Stats.fromJson(json['stats']) : null,
      title: json['title'],
      url: json['url'],
      datetimeLocal: json['datetime_local'] != null
          ? DateTime.parse(json['datetime_local'])
          : null,
      performers: json['performers'] != null
          ? List<Performer>.from(
              json['performers'].map((x) => Performer.fromJson(x)))
          : null,
      venue: json['venue'] != null ? Venue.fromJson(json['venue']) : null,
      shortTitle: json['short_title'],
      datetimeUtc: json['datetime_utc'] != null
          ? DateTime.parse(json['datetime_utc'])
          : null,
      score: json['score']?.toDouble(),
      taxonomies: json['taxonomies'] != null
          ? List<Taxonomy>.from(
              json['taxonomies'].map((x) => Taxonomy.fromJson(x)))
          : null,
      type: json['type'],
      id: json['id'],
    );
  }
}

class Stats {
  int? listingCount;
  int? averagePrice;
  int? lowestPrice;
  int? highestPrice;

  Stats({
    this.listingCount,
    this.averagePrice,
    this.lowestPrice,
    this.highestPrice,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      listingCount: json['listing_count'],
      averagePrice: json['average_price'],
      lowestPrice: json['lowest_price'],
      highestPrice: json['highest_price'],
    );
  }
}

class Performer {
  String? name;
  String? shortName;
  String? url;
  String? image;
  PerformerImages? images;
  bool? primary;
  int? id;
  double? score;
  String? type;
  String? slug;

  Performer({
    this.name,
    this.shortName,
    this.url,
    this.image,
    this.images,
    this.primary,
    this.id,
    this.score,
    this.type,
    this.slug,
  });

  factory Performer.fromJson(Map<String, dynamic> json) {
    return Performer(
      name: json['name'],
      shortName: json['short_name'],
      url: json['url'],
      image: json['image'],
      images: json['images'] != null
          ? PerformerImages.fromJson(json['images'])
          : null,
      primary: json['primary'],
      id: json['id'],
      score: json['score'],
      type: json['type'],
      slug: json['slug'],
    );
  }
}

class PerformerImages {
  String? large;
  String? huge;
  String? small;
  String? medium;

  PerformerImages({
    this.large,
    this.huge,
    this.small,
    this.medium,
  });

  factory PerformerImages.fromJson(Map<String, dynamic> json) {
    return PerformerImages(
      large: json['large'],
      huge: json['huge'],
      small: json['small'],
      medium: json['medium'],
    );
  }
}

class Venue {
  String? city;
  String? name;
  String? extendedAddress;
  String? url;
  String? country;
  String? state;
  double? score;
  String? postalCode;
  VenueLocation? location;
  String? address;
  int? id;

  Venue({
    this.city,
    this.name,
    this.extendedAddress,
    this.url,
    this.country,
    this.state,
    this.score,
    this.postalCode,
    this.location,
    this.address,
    this.id,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      city: json['city'],
      name: json['name'],
      extendedAddress: json['extended_address'],
      url: json['url'],
      country: json['country'],
      state: json['state'],
      score: json['score']?.toDouble(),
      postalCode: json['postal_code'],
      location: json['location'] != null
          ? VenueLocation.fromJson(json['location'])
          : null,
      address: json['address'],
      id: json['id'],
    );
  }
}

class VenueLocation {
  double? lat;
  double? lon;

  VenueLocation({
    this.lat,
    this.lon,
  });

  factory VenueLocation.fromJson(Map<String, dynamic> json) {
    return VenueLocation(
      lat: json['lat']?.toDouble(),
      lon: json['lon']?.toDouble(),
    );
  }
}

class Taxonomy {
  int? parentId;
  int? id;
  String? name;

  Taxonomy({
    this.parentId,
    this.id,
    this.name,
  });

  factory Taxonomy.fromJson(Map<String, dynamic> json) {
    return Taxonomy(
      parentId: json['parent_id'],
      id: json['id'],
      name: json['name'],
    );
  }
}
