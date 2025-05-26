import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/post.dart';
import '../providers/post_provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  AddPostScreenState createState() {
    return AddPostScreenState();
  }
}

class AddPostScreenState extends State<AddPostScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newPost = Post(
          userId: 1,
          id: 0,
          title: _titleController.text,
          body: _bodyController.text);
      Provider.of<PostProvider>(context, listen: false).addPost(newPost);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Post')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Título'),
              validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
            ),
            TextFormField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Contenido'),
              validator: (value) => value!.isEmpty ? 'Campo requerido' : null,
              maxLines: 4,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _submit, child: Text('Guardar'))
          ]),
        ),
      ),
    );
  }
}
