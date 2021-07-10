import 'package:fancy_pokedex/common/round_shape.dart';
import 'package:fancy_pokedex/common/utils.dart';
import 'package:fancy_pokedex/models/pokemon.dart';
import 'package:fancy_pokedex/screens/widgets/about_tab.dart';
import 'package:fancy_pokedex/screens/widgets/stats_tab.dart';
import 'package:flutter/material.dart';

class PokemonDetailsScreen extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonDetailsScreen({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  _PokemonDetailsScreenState createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = Utils.getColorByType(widget.pokemon.types.first);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: backgroundColor,
              child: Hero(
                tag: '${widget.pokemon.name}',
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Utils.generateIdText(widget.pokemon.pokedexId),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 28,
                        ),
                      ),
                      Text(
                        widget.pokemon.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 42,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          widget.pokemon.types.length,
                          (index) => SizedBox(
                            height: 25,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: Utils.getImageForType(
                                  widget.pokemon.types[index]),
                            ),
                          ),
                        ),
                      ),
                      // TODO fix strange RenderFlex overflow
                      SizedBox(
                        height: 200,
                        child: Center(
                          child: Image.network(
                            widget.pokemon.artUrl,
                            cacheHeight: 200,
                            height: 200,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ClipPath(
              clipper: RoundShape(),
              child: Container(
                height: 80,
                color: backgroundColor,
              ),
            ),
            Column(
              children: [
                Container(
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.green,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(text: 'About'),
                      Tab(text: 'Stats'),
                      Tab(text: 'Evolution'),
                    ],
                  ),
                ),
                Container(
                  height: 400,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      AboutTab(pokemon: widget.pokemon),
                      StatsTab(pokemon: widget.pokemon),
                      Container(child: Center(child: Text('Display Tab 3'))),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
