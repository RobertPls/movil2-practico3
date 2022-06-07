import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practico3/models/Noticia.dart';
import 'package:transparent_image/transparent_image.dart';

class ListaNoticiaPage extends StatelessWidget {
  const ListaNoticiaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Noticias"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: fetchListaPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Text("Error");
              } else {
                List<Noticia> datos = snapshot.data as List<Noticia>;
                return ListView.builder(
                    itemCount: datos.length,
                    itemBuilder: (context, index) => Card(
                          margin: const EdgeInsets.all(10),
                          elevation: 3,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Column(
                            children: [
                              FadeInImage.memoryNetwork(
                                  placeholder: kTransparentImage,
                                  image: datos[index].urlToImage),
                              ListTile(
                                leading: const Icon(Icons.newspaper),
                                title: Text(datos[index].title),
                                subtitle: Text(datos[index].source.name),
                                onTap: () {
                                  Navigator.pushNamed(context, '/detail',
                                      arguments: {'noticia': datos[index]});
                                },
                              ),
                            ],
                          ),
                        ));
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Future<List<Noticia>> fetchListaPosts() async {
    const pagina = "newsapi.org";
    final parametros = {
      'q': 'Fifa',
      // 'from': '2022-06-06',
      'apiKey': 'd464cb40392d4a7aa9c830dcfe6caa8b'
    };
    var url = Uri.https(pagina, '/v2/everything', parametros);
    http.Response resp = await http.get(url);
    if (resp.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(resp.body);
      List<dynamic> body = json['articles'];
      List<Noticia> noticias =
          body.map((dynamic item) => Noticia.fromJson(item)).toList();
      return noticias;
    } else {
      throw Exception('Failed to load News');
    }
  }
}
