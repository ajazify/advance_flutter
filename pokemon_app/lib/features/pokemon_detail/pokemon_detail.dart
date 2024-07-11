import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokemon_app/features/pokemon_detail/pokemon_detail_api.dart';
import 'package:pokemon_app/features/pokemon_detail/pokemon_detail_response.dart';

class PokemonDetail extends StatefulWidget {
  const PokemonDetail({super.key});

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {
  final PokemonDetailApi _detailApi = PokemonDetailApi();
  Future<PokemonDetailResponse>? pokeVariable;
  String? apiUrl;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};
      apiUrl = args['url'];
      if (apiUrl != null) {
        setState(() {
          pokeVariable = _detailApi.fetchList(dynamicUrl: Uri.parse(apiUrl ?? ''));
        });
      } else {
        //elese
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[900],
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<PokemonDetailResponse>(
              future: pokeVariable,
              builder: (BuildContext context, AsyncSnapshot<PokemonDetailResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LinearProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text('Error Occered!');
                } else if (snapshot.hasData) {
                  return Column(
                    children: [
                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            image: DecorationImage(
                                fit: BoxFit.contain,
                                image:
                                    NetworkImage(snapshot.data!.sprites!.other!.officialArtwork!.frontDefault ?? ''))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'General',
                              style: textStyleRedTitle(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Name',
                                      style: textStyleGreyTitle(),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          snapshot.data!.name ?? 'Unknown',
                                          style: textStyleBlueGreySubTitle(),
                                        ),
                                        const SizedBox(
                                          width: 5.0,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: .5),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(3), color: Colors.green),
                                          child: Text(
                                            snapshot.data!.species!.name ?? 'Unknown',
                                            style: const TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Base Experince',
                                      style: textStyleGreyTitle(),
                                    ),
                                    Text(
                                      snapshot.data!.baseExperience.toString(),
                                      style: textStyleBlueGreySubTitle(),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Physic',
                              style: textStyleRedTitle(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Height',
                                      style: textStyleGreyTitle(),
                                    ),
                                    Text(
                                      '${snapshot.data!.height}"',
                                      style: textStyleBlueGreySubTitle(),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Weight',
                                      style: textStyleGreyTitle(),
                                    ),
                                    Text(
                                      '${snapshot.data!.weight}Kg',
                                      style: textStyleBlueGreySubTitle(),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              height: 30,
                              color: Colors.grey[200],
                            ),
                            Text(
                              'Abilities',
                              style: textStyleRedTitle(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (var item in snapshot.data!.abilities!)
                                  chipContainerWid(item.ability!.name ?? '', Colors.orange),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Super Moves',
                              style: textStyleRedTitle(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                for (var item in snapshot.data!.moves!)
                                  chipContainerWid(item.move!.name ?? '', Colors.red),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  );
                } else {
                  return const Text('Nothig to show');
                }
              }),
        ),
      ),
    );
  }

  Container chipContainerWid(String item, Color col) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(90),
        color: col,
      ),
      child: Text(
        item,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }

  TextStyle textStyleRedTitle() => const TextStyle(color: Colors.red, fontSize: 12.0, fontWeight: FontWeight.w500);

  TextStyle textStyleBlueGreySubTitle() =>
      TextStyle(color: Colors.blueGrey[900], fontSize: 17.0, fontWeight: FontWeight.w500);

  TextStyle textStyleGreyTitle() => const TextStyle(color: Colors.grey, fontSize: 15);
}
