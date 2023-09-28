import 'package:flutter/material.dart';
import '../../models/animais_model.dart';
import '../../controller/animais_controller.dart';
import '../componetes/list.dart';
import '../componetes/loading.dart';
import '../componetes/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Animais> _animais = <Animais>[];
  List<Animais> _animaisDisplay = <Animais>[];

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchanimais().then((value) {
      setState(() {
        _isLoading = false;
        _animais.addAll(value);
        _animaisDisplay = _animais;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de animais'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            if (!_isLoading) {
              return index == 0
                  ? MySearch(
                      hintText: 'ex: nome, raça, dono',
                      onChanged: (searchText) {
                        searchText = searchText.toLowerCase();
                        setState(() {
                          _animaisDisplay = _animais.where((u) {
                            var nomeLowerCase = u.nome.toLowerCase();
                            var enderecoLowerCase = u.endereco.toLowerCase();
                            var donoLowerCase = u.dono.toLowerCase();
                            return nomeLowerCase.contains(searchText) ||
                                enderecoLowerCase.contains(searchText) ||
                                donoLowerCase.contains(searchText);
                          }).toList();
                        });
                      },
                    )
                  : MyList(animais: _animaisDisplay[index - 1]);
            } else {
              return const MyLoading();
            }
          },
          itemCount: _animaisDisplay.length + 1,
        ),
      ),
    );
  }
}
