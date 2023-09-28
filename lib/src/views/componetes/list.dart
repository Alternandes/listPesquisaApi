import 'package:app_pesquisa_api/src/models/animais_model.dart';
import 'package:flutter/material.dart';

// Model
// Page
import '../pages/animais_details_page.dart';

class MyList extends StatelessWidget {
  final Animais animais;
  const MyList({Key? key, required this.animais}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: animais.id,
              child: CircleAvatar(
                backgroundImage: NetworkImage(animais.foto),
              ),
            ),
            title: Text(animais.nome),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(animais.raca),
                Text(animais.dono),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AnimaisDetailsPage(animais: animais)));
            },
          ),
          const Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
