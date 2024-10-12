import 'package:flutter/material.dart';
import 'package:appflutter/models/noticias_model.dart' as noticias_model;
import 'package:appflutter/provider/noticias_provider.dart';

class ListadoNoticias extends StatefulWidget {
  const ListadoNoticias({Key? key}) : super(key: key);

  @override
  State<ListadoNoticias> createState() => _ListadoNoticias();
}

class _ListadoNoticias extends State<ListadoNoticias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Listado Noticias',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<List<noticias_model.Datum>>(
        future: NoticiasProvider().fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<noticias_model.Datum> items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                noticias_model.Datum item = items[index];
                return ListTile(
                  leading: Image.network(
                    item.image.url,
                    fit: BoxFit
                        .cover, // Ajustar el tamaño de la imagen al contenedor
                    errorBuilder: (context, error, stackTrace) {
                      // Widget de sustitución en caso de error de carga
                      return const Icon(Icons.error);
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        // La imagen ha terminado de cargar
                        return child;
                      }
                      // Mientras la imagen carga, se puede mostrar un indicador de progreso
                      return const CircularProgressIndicator();
                    },
                  ),
                  title: Text(
                    item.title,
                    maxLines: 1,
                  ),
                  subtitle: Text(
                    item.description,
                    maxLines: 2,
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error al obtener los datos'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
