import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  return switch(context.request.method) {
    HttpMethod.get => _getUsers(),
    HttpMethod.post => _createUser(context),
    _ => Future.value(Response(body: 'This is default'))
  };
}

Future<Response> _getUsers() async {
  return Future.value(Response.json(
    body: [
      {
        'name': 'mahdi',
        'lastname': 'mirzadeh', 
      },
      {
        'name': 'john',
        'lastname': 'smith',
      },
    ], 
  ));
}

Future<Response> _createUser(RequestContext context) async {
  final json = (await context.request.json()) as Map<String, dynamic>;
  final name = json['name'];
  final lastname = json['lastname'];

// TODO: Insert user information to database

  return Response.json(
    body: {
      'message': 'User $name $lastname created successfully',
      'user': {
        'name': name,
        'lastname': lastname,
      },
    },
  );
}
