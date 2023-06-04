import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'color_display.dart';
import 'favorites_model.dart';

class HomePage extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;

  const HomePage({
    Key? key,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ColorDisplay(
            color: color,
            onTap: onTap,
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Provider.of<FavoritesModel>(context).favorites.contains(color)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
              color: Colors.red,
              onPressed: () {
                final favoritesModel =
                    Provider.of<FavoritesModel>(context, listen: false);
                if (favoritesModel.favorites.contains(color)) {
                  favoritesModel.remove(color);
                } else {
                  favoritesModel.add(color);
                }
              },
            )),
      ],
    );
  }
}
