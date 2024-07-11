import 'dart:convert';

PokemonListResponse pokemonListResponseFromJson(String str) => PokemonListResponse.fromJson(json.decode(str));

String pokemonListResponseToJson(PokemonListResponse data) => json.encode(data.toJson());

class PokemonListResponse {
    int? count;
    String? next;
    dynamic previous;
    List<Result>? results;

    PokemonListResponse({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory PokemonListResponse.fromJson(Map<String, dynamic> json) => PokemonListResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null ? [] : List<Result>.from(json["results"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Result {
    String? name;
    String? url;

    Result({
        this.name,
        this.url,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
