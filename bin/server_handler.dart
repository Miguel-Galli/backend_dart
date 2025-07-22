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
    router.get('/query', (Request req){
      String? nome =req.url.queryParameters['nome'] ?? 'desconhecido';
      String? idade =req.url.queryParameters['idade'] ?? 'desconhecido';
      return Response.ok("Query eh: $nome, idade: $idade");
    });

    return router;
  }
}
