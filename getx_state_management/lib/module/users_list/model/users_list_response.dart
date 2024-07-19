import 'dart:convert';

List<UsersListResponse> usersListResponseFromJson(String str) => List<UsersListResponse>.from(json.decode(str).map((x) => UsersListResponse.fromJson(x)));

String usersListResponseToJson(List<UsersListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersListResponse {
    int? id;
    String? name;
    String? username;
    String? email;
    Address? address;
    String? phone;
    String? website;
    Company? company;

    UsersListResponse({
        this.id,
        this.name,
        this.username,
        this.email,
        this.address,
        this.phone,
        this.website,
        this.company,
    });

    factory UsersListResponse.fromJson(Map<String, dynamic> json) => UsersListResponse(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        address: json["address"] == null ? null : Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address?.toJson(),
        "phone": phone,
        "website": website,
        "company": company?.toJson(),
    };
}

class Address {
    String? street;
    String? suite;
    String? city;
    String? zipcode;
    Geo? geo;

    Address({
        this.street,
        this.suite,
        this.city,
        this.zipcode,
        this.geo,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo?.toJson(),
    };
}

class Geo {
    String? lat;
    String? lng;

    Geo({
        this.lat,
        this.lng,
    });

    factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
    };
}

class Company {
    String? name;
    String? catchPhrase;
    String? bs;

    Company({
        this.name,
        this.catchPhrase,
        this.bs,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
    };
}
