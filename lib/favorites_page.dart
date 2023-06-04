import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites_model.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  String _colorToHexString(Color color) {
    return '#${color.red.toRadixString(16).padLeft(2, '0').toUpperCase()}${color.green.toRadixString(16).padLeft(2, '0').toUpperCase()}${color.blue.toRadixString(16).padLeft(2, '0').toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesModel>(
      builder: (context, model, child) {
        return ListView.builder(
          itemCount: model.favorites.length,
          itemBuilder: (context, index) {
            final color = model.favorites[index];
            return Container(
              color: color,
              height: MediaQuery.of(context).size.height /
                  16, // Adjust the height as needed
              child: Center(
                child: Text(
                  _colorToHexString(color),
                  style: TextStyle(
                    fontSize: 24,
                    color: color.computeLuminance() > 0.5
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Courier',
                    letterSpacing: 2,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
