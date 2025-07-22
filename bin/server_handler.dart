import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerH {
  Handler get handler {
    final router = Router();

    router.get('/', (Request request) {
      return Response(200, body: 'Primeira rota');
    });

    //http://localhost:8080/ola/mundo/
    //ola mundo

    router.get('/ola/mundo/<usuario>', (Request req, String usuario) {
      return Response.ok("Olá, mundo $usuario");
    });

    //http://localhost:8080/ola/mundo/query?nome=miguel
    router.get('/query', (Request req) {
      String? nome = req.url.queryParameters['nome'] ?? 'desconhecido';
      String? idade = req.url.queryParameters['idade'] ?? 'desconhecido';
      return Response.ok("Query eh: $nome, idade: $idade");
    });

    router.post('/login', (Request req) async {
      var result = await req.readAsString();
      Map json = jsonDecode(result);

      var usuario = json['usuario'];
      var senha = json['senha'];

      
      if (usuario == 'miguel' && senha == '123456') {
        return Response.ok('Bem vindo $usuario');
      } else {
        return Response.forbidden('Acesso negado');
      }
    });

    return router;
  }
}
