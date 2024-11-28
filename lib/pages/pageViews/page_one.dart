import 'package:flutter/material.dart';
import '../../classes/Gestor.dart';
import '../../classes/Servidor.dart';

class PageOne extends StatefulWidget {
  final Gestor Ref_Gestao = Gestor();

  PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  final Servidor servidor = Servidor();
  List<Map<String, dynamic>> noticias = [];

  @override
  void initState() {
    super.initState();
    carregarNoticias();
  }

  Future<void> carregarNoticias() async {
    try {
      final noticiasRecebidas = await servidor.obterNoticias();
      setState(() {
        noticias = noticiasRecebidas;
      });
    } catch (e) {
      print('Erro ao carregar notícias: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    widget.Ref_Gestao.one();

    return Scaffold(
      backgroundColor:
        widget.Ref_Gestao.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      widget.Ref_Gestao.get_definicao("PAGE_ONE_TITULO_1"),
                      style: TextStyle(
                        fontSize: widget.Ref_Gestao.fontSize,
                        color: widget.Ref_Gestao.textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: noticias.map((noticia) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    elevation: 4,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      title: Text(noticia['titulo']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Image.network(
                            noticia['imagem'],
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8),
                          Text(noticia['descricao']),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
