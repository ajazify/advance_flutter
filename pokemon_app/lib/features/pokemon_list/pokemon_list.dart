import 'package:flutter/material.dart';
import 'package:pokemon_app/features/pokemon_list/pokemon_api.dart';
import 'package:pokemon_app/features/pokemon_list/pokemon_list_response.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  PokemonApi pokeInstance = PokemonApi();
  Future<PokemonListResponse>? respVariable;
  int page = 0;

  @override
  void initState() {
    super.initState();
    initialCall();
  }

  previousOrNextCall({required String url, required bool isNext}) {
    setState(() {
      if (isNext) {
        page++;
      } else {
        if (page >= 1) {
          page--;
        }
      }
      var baseUrl = Uri.parse(url);
      respVariable = pokeInstance.fetchList(baseUrl);
    });
  }

  void initialCall() {
    setState(() {
      page = 1;
      respVariable = pokeInstance.fetchList(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FutureBuilder<PokemonListResponse>(
            future: respVariable,
            builder: (BuildContext context, AsyncSnapshot<PokemonListResponse> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Some Error Occered!'),
                );
              } else if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                      height: 180,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(fit: BoxFit.contain, image: AssetImage('images/pokemon.jpg'))),
                    ),
                    Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        padding: const EdgeInsets.all(10.0),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Text('${snapshot.data!.count.toString()} Pokemons Found'),
                          ],
                        )),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.separated(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            height: 60,
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context).pushNamed('/pokemonDetails',
                                    arguments: {"url": snapshot.data!.results![index].url!});
                              },
                              leading: SizedBox.square(
                                dimension: 45,
                                child: Stack(
                                  children: [
                                    Column(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(255, 210, 25, 12),
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(100.0), topRight: Radius.circular(100.0))),
                                          ),
                                        ),
                                        Container(
                                          height: 5,
                                          color: Colors.black,
                                          width: double.infinity,
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(100.0),
                                                    bottomRight: Radius.circular(100.0))),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.center,
                                      child: SizedBox.square(
                                        dimension: 30,
                                        child: Card(
                                          color: Colors.white,
                                          child: Center(
                                            child: Text(
                                              snapshot.data!.results![index].name![0].toUpperCase(),
                                              style: const TextStyle(fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              title: Text(snapshot.data!.results![index].name!),
                              trailing: const Icon(Icons.navigate_next),
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => Divider(
                          height: 5,
                          color: Colors.grey[200],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton.filled(
                                  disabledColor: Colors.grey,
                                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.red[900])),
                                  onPressed: snapshot.data!.previous != null
                                      ? () => previousOrNextCall(url: snapshot.data!.previous, isNext: false)
                                      : null,
                                  icon: const Icon(Icons.arrow_circle_left_rounded)),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Previous',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Text(
                            'Page $page',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Text(
                                'Next',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton.filled(
                                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.red[900])),
                                  onPressed: () {
                                    previousOrNextCall(url: snapshot.data!.next ?? '', isNext: true);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_circle_right_rounded,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }
}
