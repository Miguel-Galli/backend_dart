import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class ServerH {
  Handler get handler {
    final router = Router();

    router.get('/', (Request request) {
      return Response(200, body: 'Primeira rota');
    });

    return router;
  }
}
