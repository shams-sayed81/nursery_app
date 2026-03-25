// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Create Account`
  String get create_account {
    return Intl.message(
      'Create Account',
      name: 'create_account',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get full_name {
    return Intl.message('Full Name', name: 'full_name', desc: '', args: []);
  }

  /// `Email Address`
  String get email_address {
    return Intl.message(
      'Email Address',
      name: 'email_address',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Account Type`
  String get account_type {
    return Intl.message(
      'Account Type',
      name: 'account_type',
      desc: '',
      args: [],
    );
  }

  /// `Parent`
  String get parent {
    return Intl.message('Parent', name: 'parent', desc: '', args: []);
  }

  /// `Teacher`
  String get teacher {
    return Intl.message('Teacher', name: 'teacher', desc: '', args: []);
  }

  /// `v1.0.0 • Secure & Private`
  String get app_version_secure {
    return Intl.message(
      'v1.0.0 • Secure & Private',
      name: 'app_version_secure',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Little Stars`
  String get welcome_to_little_stars {
    return Intl.message(
      'Welcome to Little Stars',
      name: 'welcome_to_little_stars',
      desc: '',
      args: [],
    );
  }

  /// `The complete nursery app for parents and teachers`
  String get nursery_app_description {
    return Intl.message(
      'The complete nursery app for parents and teachers',
      name: 'nursery_app_description',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Create New Account`
  String get create_new_account {
    return Intl.message(
      'Create New Account',
      name: 'create_new_account',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `Updates`
  String get updates {
    return Intl.message('Updates', name: 'updates', desc: '', args: []);
  }

  /// `Chat`
  String get chat {
    return Intl.message('Chat', name: 'chat', desc: '', args: []);
  }

  /// `Meals`
  String get meals {
    return Intl.message('Meals', name: 'meals', desc: '', args: []);
  }

  /// `Nap`
  String get nap {
    return Intl.message('Nap', name: 'nap', desc: '', args: []);
  }

  /// `Activity`
  String get activity {
    return Intl.message('Activity', name: 'activity', desc: '', args: []);
  }

  /// `Mood`
  String get mood {
    return Intl.message('Mood', name: 'mood', desc: '', args: []);
  }

  /// `Quick Actions`
  String get quick_actions {
    return Intl.message(
      'Quick Actions',
      name: 'quick_actions',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message('Welcome', name: 'welcome', desc: '', args: []);
  }

  /// `Calendar`
  String get calendar {
    return Intl.message('Calendar', name: 'calendar', desc: '', args: []);
  }

  /// `Photos`
  String get photos {
    return Intl.message('Photos', name: 'photos', desc: '', args: []);
  }

  /// `Tuition`
  String get tuition {
    return Intl.message('Tuition', name: 'tuition', desc: '', args: []);
  }

  /// `View Analytics`
  String get view_analytics {
    return Intl.message(
      'View Analytics',
      name: 'view_analytics',
      desc: '',
      args: [],
    );
  }

  /// `Photos and videos from your child's activities`
  String get photos_videos_description {
    return Intl.message(
      'Photos and videos from your child\'s activities',
      name: 'photos_videos_description',
      desc: '',
      args: [],
    );
  }

  /// `Type a message`
  String get type_a_message {
    return Intl.message(
      'Type a message',
      name: 'type_a_message',
      desc: '',
      args: [],
    );
  }

  /// `Detailed insights and progress`
  String get detailed_insights_progress {
    return Intl.message(
      'Detailed insights and progress',
      name: 'detailed_insights_progress',
      desc: '',
      args: [],
    );
  }

  /// `Class Schedule`
  String get class_schedule {
    return Intl.message(
      'Class Schedule',
      name: 'class_schedule',
      desc: '',
      args: [],
    );
  }

  /// `View weekly timetable`
  String get view_weekly_timetable {
    return Intl.message(
      'View weekly timetable',
      name: 'view_weekly_timetable',
      desc: '',
      args: [],
    );
  }

  /// `My Groups`
  String get my_groups {
    return Intl.message('My Groups', name: 'my_groups', desc: '', args: []);
  }

  /// `Daily Updates`
  String get daily_updates {
    return Intl.message(
      'Daily Updates',
      name: 'daily_updates',
      desc: '',
      args: [],
    );
  }

  /// `Activities`
  String get activities {
    return Intl.message('Activities', name: 'activities', desc: '', args: []);
  }

  /// `Today`
  String get today {
    return Intl.message('Today', name: 'today', desc: '', args: []);
  }

  /// `Schedule`
  String get schedule {
    return Intl.message('Schedule', name: 'schedule', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `Today's Focus`
  String get todays_focus {
    return Intl.message(
      'Today\'s Focus',
      name: 'todays_focus',
      desc: '',
      args: [],
    );
  }

  /// `No specific activity recorded for today.`
  String get no_activity_recorded_today {
    return Intl.message(
      'No specific activity recorded for today.',
      name: 'no_activity_recorded_today',
      desc: '',
      args: [],
    );
  }

  /// `Weekly Plan`
  String get weekly_plan {
    return Intl.message('Weekly Plan', name: 'weekly_plan', desc: '', args: []);
  }

  /// `Past Activities`
  String get past_activities {
    return Intl.message(
      'Past Activities',
      name: 'past_activities',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Welcome Teacher`
  String get welcome_teacher {
    return Intl.message(
      'Welcome Teacher',
      name: 'welcome_teacher',
      desc: '',
      args: [],
    );
  }

  /// `Students`
  String get students {
    return Intl.message('Students', name: 'students', desc: '', args: []);
  }

  /// `Classes`
  String get classes {
    return Intl.message('Classes', name: 'classes', desc: '', args: []);
  }

  /// `Parents`
  String get parents {
    return Intl.message('Parents', name: 'parents', desc: '', args: []);
  }

  /// `By Year`
  String get by_year {
    return Intl.message('By Year', name: 'by_year', desc: '', args: []);
  }

  /// `Filter by Year Group`
  String get filter_by_year_group {
    return Intl.message(
      'Filter by Year Group',
      name: 'filter_by_year_group',
      desc: '',
      args: [],
    );
  }

  /// `By Religion`
  String get by_religion {
    return Intl.message('By Religion', name: 'by_religion', desc: '', args: []);
  }

  /// `Filter by Religion`
  String get filter_by_religion {
    return Intl.message(
      'Filter by Religion',
      name: 'filter_by_religion',
      desc: '',
      args: [],
    );
  }

  /// `All Classes`
  String get all_classes {
    return Intl.message('All Classes', name: 'all_classes', desc: '', args: []);
  }

  /// `All Students`
  String get all_students {
    return Intl.message(
      'All Students',
      name: 'all_students',
      desc: '',
      args: [],
    );
  }

  /// `Notify Parents`
  String get notify_parents {
    return Intl.message(
      'Notify Parents',
      name: 'notify_parents',
      desc: '',
      args: [],
    );
  }

  /// `Send Messages to Parents`
  String get send_messages_to_parents {
    return Intl.message(
      'Send Messages to Parents',
      name: 'send_messages_to_parents',
      desc: '',
      args: [],
    );
  }

  /// `Teacher Groups`
  String get teacher_groups {
    return Intl.message(
      'Teacher Groups',
      name: 'teacher_groups',
      desc: '',
      args: [],
    );
  }

  /// `Manage Teacher Groups`
  String get manage_teacher_groups {
    return Intl.message(
      'Manage Teacher Groups',
      name: 'manage_teacher_groups',
      desc: '',
      args: [],
    );
  }

  /// `Parent Accounts`
  String get parent_accounts {
    return Intl.message(
      'Parent Accounts',
      name: 'parent_accounts',
      desc: '',
      args: [],
    );
  }

  /// `Manage Parent Accounts`
  String get manage_parent_accounts {
    return Intl.message(
      'Manage Parent Accounts',
      name: 'manage_parent_accounts',
      desc: '',
      args: [],
    );
  }

  /// `My Schedule`
  String get my_schedule {
    return Intl.message('My Schedule', name: 'my_schedule', desc: '', args: []);
  }

  /// `Dashboard`
  String get dashboard {
    return Intl.message('Dashboard', name: 'dashboard', desc: '', args: []);
  }

  /// `Mark Attendance`
  String get mark_attendance {
    return Intl.message(
      'Mark Attendance',
      name: 'mark_attendance',
      desc: '',
      args: [],
    );
  }

  /// `Mixed`
  String get mixed {
    return Intl.message('Mixed', name: 'mixed', desc: '', args: []);
  }

  /// `Muslim`
  String get muslim {
    return Intl.message('Muslim', name: 'muslim', desc: '', args: []);
  }

  /// `Christian`
  String get christian {
    return Intl.message('Christian', name: 'christian', desc: '', args: []);
  }

  /// `Back to Dashboard`
  String get back_to_dashboard {
    return Intl.message(
      'Back to Dashboard',
      name: 'back_to_dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Children`
  String get children {
    return Intl.message('Children', name: 'children', desc: '', args: []);
  }

  /// `Teachers`
  String get teachers {
    return Intl.message('Teachers', name: 'teachers', desc: '', args: []);
  }

  /// `Management`
  String get management {
    return Intl.message('Management', name: 'management', desc: '', args: []);
  }

  /// `Tuition & Fees`
  String get tuition_fees {
    return Intl.message(
      'Tuition & Fees',
      name: 'tuition_fees',
      desc: '',
      args: [],
    );
  }

  /// `Payment Plans & Installments`
  String get payment_plans_installments {
    return Intl.message(
      'Payment Plans & Installments',
      name: 'payment_plans_installments',
      desc: '',
      args: [],
    );
  }

  /// `Manage Classes`
  String get manage_classes {
    return Intl.message(
      'Manage Classes',
      name: 'manage_classes',
      desc: '',
      args: [],
    );
  }

  /// `Manage Rooms & Students`
  String get manage_rooms_students {
    return Intl.message(
      'Manage Rooms & Students',
      name: 'manage_rooms_students',
      desc: '',
      args: [],
    );
  }

  /// `Edit Users`
  String get edit_users {
    return Intl.message('Edit Users', name: 'edit_users', desc: '', args: []);
  }

  /// `Approve Parents & Teachers`
  String get approve_parents_teachers {
    return Intl.message(
      'Approve Parents & Teachers',
      name: 'approve_parents_teachers',
      desc: '',
      args: [],
    );
  }

  /// `Edit Teachers`
  String get edit_teachers {
    return Intl.message(
      'Edit Teachers',
      name: 'edit_teachers',
      desc: '',
      args: [],
    );
  }

  /// `Manage Teacher Profiles`
  String get manage_teacher_profiles {
    return Intl.message(
      'Manage Teacher Profiles',
      name: 'manage_teacher_profiles',
      desc: '',
      args: [],
    );
  }

  /// `Edit Children`
  String get edit_children {
    return Intl.message(
      'Edit Children',
      name: 'edit_children',
      desc: '',
      args: [],
    );
  }

  /// `Manage Child Profiles`
  String get manage_child_profiles {
    return Intl.message(
      'Manage Child Profiles',
      name: 'manage_child_profiles',
      desc: '',
      args: [],
    );
  }

  /// `Create Parent Account`
  String get create_parent_account {
    return Intl.message(
      'Create Parent Account',
      name: 'create_parent_account',
      desc: '',
      args: [],
    );
  }

  /// `Add a New Parent Account`
  String get add_new_parent_account {
    return Intl.message(
      'Add a New Parent Account',
      name: 'add_new_parent_account',
      desc: '',
      args: [],
    );
  }

  /// `Create`
  String get create {
    return Intl.message('Create', name: 'create', desc: '', args: []);
  }

  /// `View Parent Accounts`
  String get view_parent_accounts {
    return Intl.message(
      'View Parent Accounts',
      name: 'view_parent_accounts',
      desc: '',
      args: [],
    );
  }

  /// `View All Parent Accounts`
  String get view_all_parent_accounts {
    return Intl.message(
      'View All Parent Accounts',
      name: 'view_all_parent_accounts',
      desc: '',
      args: [],
    );
  }

  /// `View`
  String get view {
    return Intl.message('View', name: 'view', desc: '', args: []);
  }

  /// `Manage Schedules`
  String get manage_schedules {
    return Intl.message(
      'Manage Schedules',
      name: 'manage_schedules',
      desc: '',
      args: [],
    );
  }

  /// `Manage Class Schedules`
  String get manage_class_schedules {
    return Intl.message(
      'Manage Class Schedules',
      name: 'manage_class_schedules',
      desc: '',
      args: [],
    );
  }

  /// `Admin Dashboard`
  String get admin_dashboard {
    return Intl.message(
      'Admin Dashboard',
      name: 'admin_dashboard',
      desc: '',
      args: [],
    );
  }

  /// `Manage`
  String get manage {
    return Intl.message('Manage', name: 'manage', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Users`
  String get users {
    return Intl.message('Users', name: 'users', desc: '', args: []);
  }

  /// `Mood Tracker`
  String get mood_tracker {
    return Intl.message(
      'Mood Tracker',
      name: 'mood_tracker',
      desc: '',
      args: [],
    );
  }

  /// `Trends`
  String get trends {
    return Intl.message('Trends', name: 'trends', desc: '', args: []);
  }

  /// `History Log`
  String get history_log {
    return Intl.message('History Log', name: 'history_log', desc: '', args: []);
  }

  /// `Weekly Overview`
  String get weekly_overview {
    return Intl.message(
      'Weekly Overview',
      name: 'weekly_overview',
      desc: '',
      args: [],
    );
  }

  /// `Current Mood`
  String get current_mood {
    return Intl.message(
      'Current Mood',
      name: 'current_mood',
      desc: '',
      args: [],
    );
  }

  /// `Select Child`
  String get select_child {
    return Intl.message(
      'Select Child',
      name: 'select_child',
      desc: '',
      args: [],
    );
  }

  /// `Choose which child's schedule to view`
  String get choose_child_schedule {
    return Intl.message(
      'Choose which child\'s schedule to view',
      name: 'choose_child_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Student Analytics`
  String get student_analytics {
    return Intl.message(
      'Student Analytics',
      name: 'student_analytics',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get overview {
    return Intl.message('Overview', name: 'overview', desc: '', args: []);
  }

  /// `Attendance`
  String get attendance {
    return Intl.message('Attendance', name: 'attendance', desc: '', args: []);
  }

  /// `Nap Time`
  String get nap_time {
    return Intl.message('Nap Time', name: 'nap_time', desc: '', args: []);
  }

  /// `Overview Summary`
  String get overview_summary {
    return Intl.message(
      'Overview Summary',
      name: 'overview_summary',
      desc: '',
      args: [],
    );
  }

  /// `Last 30 Days`
  String get last_30_days {
    return Intl.message(
      'Last 30 Days',
      name: 'last_30_days',
      desc: '',
      args: [],
    );
  }

  /// `Activity Logs`
  String get activity_logs {
    return Intl.message(
      'Activity Logs',
      name: 'activity_logs',
      desc: '',
      args: [],
    );
  }

  /// `Total Records`
  String get total_records {
    return Intl.message(
      'Total Records',
      name: 'total_records',
      desc: '',
      args: [],
    );
  }

  /// `Eating Average`
  String get eating_average {
    return Intl.message(
      'Eating Average',
      name: 'eating_average',
      desc: '',
      args: [],
    );
  }

  /// `Of Meals`
  String get of_meals {
    return Intl.message('Of Meals', name: 'of_meals', desc: '', args: []);
  }

  /// `Happy Rate`
  String get happy_rate {
    return Intl.message('Happy Rate', name: 'happy_rate', desc: '', args: []);
  }

  /// `Positive Mood`
  String get positive_mood {
    return Intl.message(
      'Positive Mood',
      name: 'positive_mood',
      desc: '',
      args: [],
    );
  }

  /// `Quick Stats`
  String get quick_stats {
    return Intl.message('Quick Stats', name: 'quick_stats', desc: '', args: []);
  }

  /// `Total Attendance Records`
  String get total_attendance_records {
    return Intl.message(
      'Total Attendance Records',
      name: 'total_attendance_records',
      desc: '',
      args: [],
    );
  }

  /// `Total Meals Tracked`
  String get total_meals_tracked {
    return Intl.message(
      'Total Meals Tracked',
      name: 'total_meals_tracked',
      desc: '',
      args: [],
    );
  }

  /// `Mood Records`
  String get mood_records {
    return Intl.message(
      'Mood Records',
      name: 'mood_records',
      desc: '',
      args: [],
    );
  }

  /// `Activities Participated`
  String get activities_participated {
    return Intl.message(
      'Activities Participated',
      name: 'activities_participated',
      desc: '',
      args: [],
    );
  }

  /// `Total Nap Times`
  String get total_nap_times {
    return Intl.message(
      'Total Nap Times',
      name: 'total_nap_times',
      desc: '',
      args: [],
    );
  }

  /// `Attendance Analysis`
  String get attendance_analysis {
    return Intl.message(
      'Attendance Analysis',
      name: 'attendance_analysis',
      desc: '',
      args: [],
    );
  }

  /// `Present`
  String get present {
    return Intl.message('Present', name: 'present', desc: '', args: []);
  }

  /// `Absent`
  String get absent {
    return Intl.message('Absent', name: 'absent', desc: '', args: []);
  }

  /// `Late`
  String get late {
    return Intl.message('Late', name: 'late', desc: '', args: []);
  }

  /// `Attendance Rate`
  String get attendance_rate {
    return Intl.message(
      'Attendance Rate',
      name: 'attendance_rate',
      desc: '',
      args: [],
    );
  }

  /// `Last 14 Days`
  String get last_14_days {
    return Intl.message(
      'Last 14 Days',
      name: 'last_14_days',
      desc: '',
      args: [],
    );
  }

  /// `Recent Records`
  String get recent_records {
    return Intl.message(
      'Recent Records',
      name: 'recent_records',
      desc: '',
      args: [],
    );
  }

  /// `Eating Habits`
  String get eating_habits {
    return Intl.message(
      'Eating Habits',
      name: 'eating_habits',
      desc: '',
      args: [],
    );
  }

  /// `Total Meals`
  String get total_meals {
    return Intl.message('Total Meals', name: 'total_meals', desc: '', args: []);
  }

  /// `Eating Distribution`
  String get eating_distribution {
    return Intl.message(
      'Eating Distribution',
      name: 'eating_distribution',
      desc: '',
      args: [],
    );
  }

  /// `By Meal Type`
  String get by_meal_type {
    return Intl.message(
      'By Meal Type',
      name: 'by_meal_type',
      desc: '',
      args: [],
    );
  }

  /// `Breakfast`
  String get breakfast {
    return Intl.message('Breakfast', name: 'breakfast', desc: '', args: []);
  }

  /// `Lunch`
  String get lunch {
    return Intl.message('Lunch', name: 'lunch', desc: '', args: []);
  }

  /// `Snack`
  String get snack {
    return Intl.message('Snack', name: 'snack', desc: '', args: []);
  }

  /// `Mood Tracking`
  String get mood_tracking {
    return Intl.message(
      'Mood Tracking',
      name: 'mood_tracking',
      desc: '',
      args: [],
    );
  }

  /// `Positive Rate`
  String get positive_rate {
    return Intl.message(
      'Positive Rate',
      name: 'positive_rate',
      desc: '',
      args: [],
    );
  }

  /// `Mood Distribution`
  String get mood_distribution {
    return Intl.message(
      'Mood Distribution',
      name: 'mood_distribution',
      desc: '',
      args: [],
    );
  }

  /// `Mood Breakdown`
  String get mood_breakdown {
    return Intl.message(
      'Mood Breakdown',
      name: 'mood_breakdown',
      desc: '',
      args: [],
    );
  }

  /// `Happy`
  String get happy {
    return Intl.message('Happy', name: 'happy', desc: '', args: []);
  }

  /// `Neutral`
  String get neutral {
    return Intl.message('Neutral', name: 'neutral', desc: '', args: []);
  }

  /// `Sad`
  String get sad {
    return Intl.message('Sad', name: 'sad', desc: '', args: []);
  }

  /// `Crying`
  String get crying {
    return Intl.message('Crying', name: 'crying', desc: '', args: []);
  }

  /// `Activities & Engagement`
  String get activities_engagement {
    return Intl.message(
      'Activities & Engagement',
      name: 'activities_engagement',
      desc: '',
      args: [],
    );
  }

  /// `Total Activities`
  String get total_activities {
    return Intl.message(
      'Total Activities',
      name: 'total_activities',
      desc: '',
      args: [],
    );
  }

  /// `Unique Activities`
  String get unique_activities {
    return Intl.message(
      'Unique Activities',
      name: 'unique_activities',
      desc: '',
      args: [],
    );
  }

  /// `Top 5 Activities`
  String get top_5_activities {
    return Intl.message(
      'Top 5 Activities',
      name: 'top_5_activities',
      desc: '',
      args: [],
    );
  }

  /// `No activities recorded yet`
  String get no_activities_recorded {
    return Intl.message(
      'No activities recorded yet',
      name: 'no_activities_recorded',
      desc: '',
      args: [],
    );
  }

  /// `Nap Time Analysis`
  String get nap_time_analysis {
    return Intl.message(
      'Nap Time Analysis',
      name: 'nap_time_analysis',
      desc: '',
      args: [],
    );
  }

  /// `Total Naps`
  String get total_naps {
    return Intl.message('Total Naps', name: 'total_naps', desc: '', args: []);
  }

  /// `Average Duration`
  String get average_duration {
    return Intl.message(
      'Average Duration',
      name: 'average_duration',
      desc: '',
      args: [],
    );
  }

  /// `Recent Nap Times`
  String get recent_nap_times {
    return Intl.message(
      'Recent Nap Times',
      name: 'recent_nap_times',
      desc: '',
      args: [],
    );
  }

  /// `No nap records yet`
  String get no_nap_records {
    return Intl.message(
      'No nap records yet',
      name: 'no_nap_records',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message('About', name: 'about', desc: '', args: []);
  }

  /// `Message`
  String get message {
    return Intl.message('Message', name: 'message', desc: '', args: []);
  }

  /// `General`
  String get general {
    return Intl.message('General', name: 'general', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Important`
  String get important {
    return Intl.message('Important', name: 'important', desc: '', args: []);
  }

  /// `Notify Parent`
  String get notify_parent {
    return Intl.message(
      'Notify Parent',
      name: 'notify_parent',
      desc: '',
      args: [],
    );
  }

  /// `Select Student(s)`
  String get select_students {
    return Intl.message(
      'Select Student(s)',
      name: 'select_students',
      desc: '',
      args: [],
    );
  }

  /// `Select All`
  String get select_all {
    return Intl.message('Select All', name: 'select_all', desc: '', args: []);
  }

  /// `Choose which student(s) this notification is about`
  String get choose_students_notification {
    return Intl.message(
      'Choose which student(s) this notification is about',
      name: 'choose_students_notification',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
  }

  /// `Year`
  String get year {
    return Intl.message('Year', name: 'year', desc: '', args: []);
  }

  /// `Notification Type`
  String get notification_type {
    return Intl.message(
      'Notification Type',
      name: 'notification_type',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get type_general {
    return Intl.message('General', name: 'type_general', desc: '', args: []);
  }

  /// `Meal`
  String get type_meal {
    return Intl.message('Meal', name: 'type_meal', desc: '', args: []);
  }

  /// `Nap`
  String get type_nap {
    return Intl.message('Nap', name: 'type_nap', desc: '', args: []);
  }

  /// `Mood`
  String get type_mood {
    return Intl.message('Mood', name: 'type_mood', desc: '', args: []);
  }

  /// `Activity`
  String get type_activity {
    return Intl.message('Activity', name: 'type_activity', desc: '', args: []);
  }

  /// `Important`
  String get type_important {
    return Intl.message(
      'Important',
      name: 'type_important',
      desc: '',
      args: [],
    );
  }

  /// `Title (Optional)`
  String get title_optional {
    return Intl.message(
      'Title (Optional)',
      name: 'title_optional',
      desc: '',
      args: [],
    );
  }

  /// `e.g., Great Day Today!`
  String get title_hint {
    return Intl.message(
      'e.g., Great Day Today!',
      name: 'title_hint',
      desc: '',
      args: [],
    );
  }

  /// `Type your message to the parent...`
  String get message_hint {
    return Intl.message(
      'Type your message to the parent...',
      name: 'message_hint',
      desc: '',
      args: [],
    );
  }

  /// `Send Notification`
  String get send_notification {
    return Intl.message(
      'Send Notification',
      name: 'send_notification',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get messages {
    return Intl.message('Messages', name: 'messages', desc: '', args: []);
  }

  /// `Bulk`
  String get bulk {
    return Intl.message('Bulk', name: 'bulk', desc: '', args: []);
  }

  /// `Groups`
  String get groups {
    return Intl.message('Groups', name: 'groups', desc: '', args: []);
  }

  /// `Users Management`
  String get users_management {
    return Intl.message(
      'Users Management',
      name: 'users_management',
      desc: '',
      args: [],
    );
  }

  /// `Total Users`
  String get total_users {
    return Intl.message('Total Users', name: 'total_users', desc: '', args: []);
  }

  /// `Admins`
  String get admins {
    return Intl.message('Admins', name: 'admins', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Teacher`
  String get teacher_role {
    return Intl.message('Teacher', name: 'teacher_role', desc: '', args: []);
  }

  /// `Parent`
  String get parent_role {
    return Intl.message('Parent', name: 'parent_role', desc: '', args: []);
  }

  /// `Admin`
  String get admin_role {
    return Intl.message('Admin', name: 'admin_role', desc: '', args: []);
  }

  /// `Search users...`
  String get search_hint {
    return Intl.message(
      'Search users...',
      name: 'search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Create User`
  String get create_user {
    return Intl.message('Create User', name: 'create_user', desc: '', args: []);
  }

  /// `Edit User`
  String get edit_user {
    return Intl.message('Edit User', name: 'edit_user', desc: '', args: []);
  }

  /// `Delete User`
  String get delete_user {
    return Intl.message('Delete User', name: 'delete_user', desc: '', args: []);
  }

  /// `Classes Management`
  String get classes_management {
    return Intl.message(
      'Classes Management',
      name: 'classes_management',
      desc: '',
      args: [],
    );
  }

  /// `Active Classes`
  String get active_classes {
    return Intl.message(
      'Active Classes',
      name: 'active_classes',
      desc: '',
      args: [],
    );
  }

  /// `Total Students`
  String get total_students {
    return Intl.message(
      'Total Students',
      name: 'total_students',
      desc: '',
      args: [],
    );
  }

  /// `Avg Size`
  String get avg_size {
    return Intl.message('Avg Size', name: 'avg_size', desc: '', args: []);
  }

  /// `Unassigned`
  String get unassigned {
    return Intl.message('Unassigned', name: 'unassigned', desc: '', args: []);
  }

  /// `Create Class`
  String get create_class {
    return Intl.message(
      'Create Class',
      name: 'create_class',
      desc: '',
      args: [],
    );
  }

  /// `Edit Class`
  String get edit_class {
    return Intl.message('Edit Class', name: 'edit_class', desc: '', args: []);
  }

  /// `Delete Class`
  String get delete_class {
    return Intl.message(
      'Delete Class',
      name: 'delete_class',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Inactive`
  String get inactive {
    return Intl.message('Inactive', name: 'inactive', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
