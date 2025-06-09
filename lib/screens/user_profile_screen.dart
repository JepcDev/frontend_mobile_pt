import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/user_service.dart';

class UserProfileScreen extends StatelessWidget {
  final int userId;

  const UserProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil del Usuario')),
      body: FutureBuilder<User>(
        future: UserService.fetchUser(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error al cargar usuario'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('Usuario no encontrado'));
          }

          final user = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nombre: ${user.name}', style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8),
                    Text('Username: @${user.username}'),
                    Text('Email: ${user.email}'),
                    Text('Teléfono: ${user.phone}'),
                    Text('Sitio Web: ${user.website}'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
