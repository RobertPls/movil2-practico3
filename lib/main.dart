import 'package:flutter/material.dart';
import 'package:practico3/lista_noticias_page.dart';
import 'package:practico3/models/Noticia.dart';
import 'package:practico3/noticia_detail.dart';
import 'package:practico3/web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontSizeFactor: 1.1,
              fontSizeDelta: 2.0,
            ),
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        '/': (context) => const ListaNoticiaPage(),
        '/detail': ((context) => NoticiaDetailPage(
              ModalRoute.of(context)?.settings.arguments
                  as Map<String, dynamic>,
            )),
        '/webview': ((context) => WebViewPage(
              ModalRoute.of(context)?.settings.arguments
                  as Map<String, dynamic>,
            )),
      },
      initialRoute: '/',
    );
  }
}
