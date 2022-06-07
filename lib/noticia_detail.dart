import 'package:flutter/material.dart';
import 'models/Noticia.dart';
import 'package:transparent_image/transparent_image.dart';

class NoticiaDetailPage extends StatelessWidget {
  final Map<String, dynamic> args;
  const NoticiaDetailPage(this.args, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Noticia objNoticia = args['noticia'] as Noticia;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(objNoticia.source.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          FadeInImage.memoryNetwork(
              placeholder: kTransparentImage, image: objNoticia.urlToImage),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  ListTile(
                    title: Text(objNoticia.title),
                    subtitle: Text(
                        '${objNoticia.publishedAt}\n${objNoticia.description}'),
                    onTap: () {
                      Navigator.pushNamed(context, '/webview',
                          arguments: {'url': objNoticia.url});
                    },
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/webview',
                              arguments: {'url': objNoticia.url});
                        },
                        child: const Text('Ver mas'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
