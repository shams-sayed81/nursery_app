import 'package:flutter/material.dart';
import 'package:gym_app/core/helpers/spacing.dart';
import 'package:gym_app/core/theme/app_text_styles.dart';
import 'package:gym_app/core/widgets/custom_button.dart';
import 'package:gym_app/core/widgets/custom_text_feild.dart';

import '../../../../generated/l10n.dart';
import '../../../parent/data/models/parent_model.dart';
import '../../../parent/data/models/child_model.dart';

class NotifyParentScreen extends StatefulWidget {
  final ParentModel parent;

  const NotifyParentScreen({super.key, required this.parent});
  static const String routeName = '/notify';

  @override
  State<NotifyParentScreen> createState() => _NotifyParentScreenState();
}

class _NotifyParentScreenState extends State<NotifyParentScreen> {
  List<String> selectedChildren = [];
  String selectedType = "Nap";

  final titleController = TextEditingController();
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final children = widget.parent.children;

    return Scaffold(
      appBar: AppBar(
        title: Text(s.notify_parents, style: AppTextStyles.font16BlackBold),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _parentCard(),
            vGap(20),
            _childrenCard(children),
            vGap(20),
            _notificationType(),
            vGap(20),
            _messageCard(),
          ],
        ),
      ),
    );
  }

  /// Parent Card
  Widget _parentCard() {
    final parent = widget.parent;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(radius: 22, child: Text(parent.name[0])),
          hGap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                parent.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(parent.email),
            ],
          ),
        ],
      ),
    );
  }

  /// Children Selection
  Widget _childrenCard(List<ChildModel> children) {
    final s = S.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(s.select_students, style: AppTextStyles.font16BlackRegular),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    if (selectedChildren.length == children.length) {
                      selectedChildren.clear(); // Unselect All
                    } else {
                      selectedChildren = children
                          .map((e) => e.id)
                          .toList(); // Select All
                    }
                  });
                },
                child: Text(
                  s.select_all,
                  style: AppTextStyles.font14BlackRegular,
                ),
              ),
            ],
          ),
          vGap(5),
          Text(
            s.choose_students_notification,
            style: AppTextStyles.font14GreyRegular,
          ),
          vGap(10),
          ...children.map((child) {
            bool isSelected = selectedChildren.contains(child.id);

            return CheckboxListTile(
              activeColor: Colors.teal,
              value: isSelected,
              onChanged: (_) {
                setState(() {
                  if (isSelected) {
                    selectedChildren.remove(child.id);
                  } else {
                    selectedChildren.add(child.id);
                  }
                });
              },
              title: Text(child.name),
              subtitle: Text("${s.age} ${child.age} • ${s.year} ${child.year}"),
              secondary: Chip(label: Text(child.religion)),
            );
          }),
        ],
      ),
    );
  }

  /// Notification Type
  Widget _notificationType() {
    final s = S.of(context);
    List<String> types = [
      s.general,
      s.meals,
      s.nap,
      s.mood,
      s.activity,
      s.important,
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            s.notification_type,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          vGap(10),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: types.map((type) {
              bool isSelected = selectedType == type;

              return ChoiceChip(
                selectedColor:Colors.teal,
                label: Text(type, style: AppTextStyles.font14BlackRegular,),
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    selectedType = type;
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// Message Card
  Widget _messageCard() {
    final s = S.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        children: [
          CustomTextFormField(
            textInputType: TextInputType.text,
            controller: titleController,
            labelText: s.title_optional,
            hintText: s.title_hint,
          ),
          vGap(10),
          CustomTextFormField(
            textInputType: TextInputType.text,
            controller: messageController,
            labelText: s.message,
            hintText: s.type_a_message,
          ),
          vGap(15),
          CustomButton(

            width: double.infinity,
            text: s.send_notification, onPressed: () {

          },)

        ],
      ),
    );
  }
}
