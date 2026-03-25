import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/daily_status_enum.dart';
import '../data/models/child_model.dart';
import '../data/models/daily_entry_model.dart';
import '../data/models/daily_report_model.dart';
import '../data/models/parent_model.dart';
import '../data/models/photo_model.dart';


class ChildCubit extends Cubit<int> {
  ChildCubit() : super(0) {
    _loadMockData();
  }

  late ParentModel parent;

  final List<DailyReportModel> reports = [];
  final List<PhotoModel> photos = [];

  final Map<String, Map<DailyStatus, List<DailyEntryModel>>> entriesByStatus = {};

  void _loadMockData() {
    final children = [
      ChildModel(
        id: 'child_1',
        name: 'ليلى محمد',
        age: 4,
        classId: 'KG1',
        parentId: '1',
        className: '',
        religion: 'Muslim',
        year: '',

      ),
      ChildModel(
        id: 'child_2',
        name: 'أحمد علي',
        age: 5,
        classId: 'KG2',
        parentId: '1',
        className: '',
        religion: 'Muslim',
        year: '',
      ),
    ];

    parent = ParentModel(
      password: 'passs',
      id: 'parent_1',
      name: 'Ahmed Mohamed',
      children: children, email: '',
    );

    reports.addAll([
      DailyReportModel(
        id: 'report_1',
        childId: 'child_1',
        date: DateTime.now(),
        entries: [
          DailyEntryModel(
            id: 'entry_1',
            type: DailyEntryType.activity,
            date: DateTime.now(),
            title: 'رسم حيوانات',
            caption: 'ليلى رسمت حيوانات ملونة',
            imageUrl: 'https://via.placeholder.com/100',
          ),
          DailyEntryModel(
            id: 'entry_2',
            type: DailyEntryType.meal,
            date: DateTime.now().subtract(Duration(days: 1)),
            title: 'غداء',
            caption: 'بطاطس + دجاج',
            imageUrl: 'https://via.placeholder.com/100',
          ),
        ],
      ),
      DailyReportModel(
        id: 'report_2',
        childId: 'child_2',
        date: DateTime.now(),
        entries: [
          DailyEntryModel(
            id: 'entry_3',
            type: DailyEntryType.activity,
            date: DateTime.now(),
            title: 'لعب تركيب',
            caption: 'أحمد ركب برج من المكعبات',
            imageUrl: 'https://via.placeholder.com/100',
          ),
          DailyEntryModel(
            id: 'entry_4',
            type: DailyEntryType.meal,
            date: DateTime.now().subtract(Duration(days: 2)),
            title: 'فطور',
            caption: 'توست + حليب',
            imageUrl: 'https://via.placeholder.com/100',
          ),
        ],
      ),
    ]);

    photos.addAll([
      PhotoModel(
        id: 'photo_1',
        childId: 'child_1',
        date: DateTime.now(),
        imageUrl: 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
        caption: 'Playing in the garden',
      ),
      PhotoModel(
        id: 'photo_2',
        childId: 'child_1',
        date: DateTime.now(),
        imageUrl: 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
        caption: 'Playing in the garden',
      ),
      PhotoModel(
        id: 'photo_3',
        childId: 'child_1',
        date: DateTime.now(),
        imageUrl: 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
        caption: 'Playing in the garden',
      ),

    ]);

    for (var child in parent.children) {
      final childEntries = reports
          .where((r) => r.childId == child.id)
          .expand((r) => r.entries)
          .toList();

      entriesByStatus[child.id] = {
        DailyStatus.today:
        childEntries.where((e) => e.status == DailyStatus.today).toList(),
        DailyStatus.scheduled:
        childEntries.where((e) => e.status == DailyStatus.scheduled).toList(),
        DailyStatus.history:
        childEntries.where((e) => e.status == DailyStatus.history).toList(),
      };
    }

    emit(0);
  }

  ChildModel get currentChild => parent.children[state];

  void selectChild(int index) => emit(index);

  List<DailyEntryModel> getEntriesByStatus(DailyEntryType type, DailyStatus status) {
    final childStatusMap = entriesByStatus[currentChild.id]!;
    return childStatusMap[status]!.where((e) => e.type == type).toList();
  }

  List<PhotoModel> getChildPhotos() {
    return photos.where((p) => p.childId == currentChild.id).toList();
  }
}