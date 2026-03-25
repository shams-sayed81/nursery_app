import 'package:flutter/material.dart';

import '../../../parent/data/models/child_model.dart';
import '../../data/model/student_group_model.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});
  static const String routeName='/create-group';

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {

  final nameController = TextEditingController();
  final descController = TextEditingController();

  bool visible = true;

  Color selectedColor = Colors.teal;

  List<String> selectedChildren = [];

  List<ChildModel> children = [ChildModel(
    id: '1',
    name: 'Shams',
    age: 4,
    classId: 'KG1',
    parentId: 'p1',
    religion: 'Christian',
    className: 'Sunflowers',
    year: '2025',
  ),];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Group"),
      ),

      body: Column(
        children: [

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [

                  _groupInfo(),
                  const SizedBox(height: 10),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Group Color",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      _colorItem(Colors.teal),
                      _colorItem(Colors.blue),
                      _colorItem(Colors.orange),
                      _colorItem(Colors.purple),
                      _colorItem(Colors.red),
                    ],
                  ),

                  const SizedBox(height: 20),

                  _studentsList(),

                ],
              ),
            ),
          ),

          _createButton()
        ],
      ),
    );

  }


  Widget _colorItem(Color color) {
    bool isSelected = selectedColor == color;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: isSelected
              ? Border.all(color: Colors.black, width: 3)
              : null,
        ),
      ),
    );
  }
  Widget _groupInfo() {
    return Column(
      children: [

        TextField(
          controller: nameController,
          decoration: const InputDecoration(
            labelText: "Group Name",
          ),
        ),

        const SizedBox(height: 10),

        TextField(
          controller: descController,
          decoration: const InputDecoration(
            labelText: "Description",
          ),
        ),

        const SizedBox(height: 10),

        SwitchListTile(
          value: visible,
          title: const Text("Visible to Parents"),
          onChanged: (v) {
            setState(() {
              visible = v;
            });
          },
        )
      ],
    );
  }

  Widget _studentsList() {

    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text("Select Students (${selectedChildren.length})"),

            TextButton(
              onPressed: () {

                setState(() {

                  if (selectedChildren.length == children.length) {
                    selectedChildren.clear();
                  } else {
                    selectedChildren =
                        children.map((e) => e.id).toList();
                  }

                });

              },
              child: const Text("Select All"),
            )
          ],
        ),

        const SizedBox(height: 10),

        ...children.map((child) {

          bool selected = selectedChildren.contains(child.id);

          return CheckboxListTile(
            value: selected,
            onChanged: (_) {

              setState(() {

                if (selected) {
                  selectedChildren.remove(child.id);
                } else {
                  selectedChildren.add(child.id);
                }

              });

            },
            title: Text(child.name),
            subtitle: Text("Age ${child.age}"),
          );

        })
      ],
    );
  }

  Widget _createButton() {

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {

              StudentGroupModel group = StudentGroupModel(
                id: DateTime.now().toString(),
                name: nameController.text,
                description: descController.text,
                color: selectedColor,
                visible: visible,
               studentIds: selectedChildren,
              );

              Navigator.pop(context, group);
            },
            child: const Text("Create Group"),
          ),
        ),
      ),
    );
  }
}