import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:lista_de_tarefa/module/folder/folder_controller.dart';
import 'package:lista_de_tarefa/services/folder_service.dart';
import 'package:lista_de_tarefa/widget/button.dart';

class FolderPage extends StatefulWidget {
  final FolderController controller;
  const FolderPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<FolderPage> createState() => _FolderPageState();
}

class _FolderPageState extends State<FolderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Listas'),
      ),
      body: FutureBuilder<List<FolderModel>>(
        future: widget.controller.getAllFolder(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              return Slidable(
                  startActionPane: ActionPane(
                    extentRatio: 0.3,
                    openThreshold: 0.01,
                    closeThreshold: 0.8,
                    motion: const BehindMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) async {
                          await widget.controller.deleteFolder(snapshot.data![index]);
                          setState(() {});
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                      ),
                    ],
                  ),
                  child: Button(
                    child: SizedBox(
                      height: 45,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          snapshot.data![index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    onTap: () async {
                      final refresh =
                          await Navigator.pushNamed<bool?>(context, '/task/', arguments: snapshot.data![index]);
                      if (refresh == true) {
                        setState(() {});
                      }
                    },
                  )
                  // ListTile(
                  //   focusColor: Colors.transparent,
                  //   title: Text(snapshot.data![index].title),
                  //   onTap: () {
                  //     Navigator.pushNamed(context, '/task/', arguments: snapshot.data![index]);
                  //   },
                  // ),
                  );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          final refresh = await Navigator.pushNamed(context, '/folder/create/');
          if (refresh == true) {
            setState(() {});
          }
        },
      ),
    );
  }
}
