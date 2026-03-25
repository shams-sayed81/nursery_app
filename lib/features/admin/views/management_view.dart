import 'package:flutter/material.dart';
import 'package:gym_app/core/widgets/custom_button.dart';

typedef ItemBuilder<T> = Widget Function(BuildContext context, T item);

class ManagementView<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final ItemBuilder<T> itemBuilder;

  final List<StatModel> stats;
  final bool showCreateButton;

  // Actions
  final VoidCallback onCreatePressed;

  // Optional
  final bool showSearch;
  final bool showFilter;
  final List<String>? filterItems;
  final Function(String)? onSearch;
  final Function(String)? onFilter;


  const ManagementView({
    super.key,
    required this.title,
    required this.items,
    required this.itemBuilder,
    required this.stats,
    required this.onCreatePressed,
    this.showSearch = false,
    this.showFilter = false,
    this.filterItems,
    this.onSearch,
    this.onFilter,
    this.showCreateButton = true,

  });

  @override
  State<ManagementView<T>> createState() => _ManagementViewState<T>();
}

class _ManagementViewState<T> extends State<ManagementView<T>> {
  String? selectedFilter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showCreateButton? AppBar(title: Text(widget.title)) : null,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.stats.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.5,
              ),
              itemBuilder: (_, index) {
                final stat = widget.stats[index];
                return _statCard(stat);
              },
            ),

            const SizedBox(height: 15),

            Row(
              children: [
                if (widget.showSearch)
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: widget.onSearch,
                    ),
                  ),

                if (widget.showSearch && widget.showFilter)
                  const SizedBox(width: 10),

                if (widget.showFilter && widget.filterItems != null)
                  DropdownButton<String>(
                    value: selectedFilter,
                    hint: const Text("Filter"),
                    items: widget.filterItems!
                        .map((e) =>
                        DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (val) {
                      setState(() => selectedFilter = val);
                      if (val != null) widget.onFilter?.call(val);
                    },
                  ),
              ],
            ),

            const SizedBox(height: 15),

            if (widget.showCreateButton)
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child:CustomButton(text: 'Create new', onPressed: () {

                    },)
                  ),
                  const SizedBox(height: 20),
                ],
              ),

            const SizedBox(height: 20),

            Expanded(
              child: widget.items.isEmpty
                  ? _emptyState()
                  : ListView.builder(
                itemCount: widget.items.length,
                itemBuilder: (context, index) =>
                    widget.itemBuilder(context, widget.items[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(StatModel stat) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: stat.color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: stat.color.withValues(alpha: 0.2),
            child: Icon(stat.icon, color: stat.color, size: 18),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(stat.title, style: const TextStyle(fontSize: 12)),
              Text(
                stat.value,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.group_outlined, size: 50, color: Colors.grey),
          SizedBox(height: 10),
          Text("No users found"),
        ],
      ),
    );
  }
}

class StatModel {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  StatModel({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });
}