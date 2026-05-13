import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../data/business_repository.dart';

class MembersScreen extends ConsumerStatefulWidget {
  const MembersScreen({super.key});

  @override
  ConsumerState<MembersScreen> createState() => _MembersScreenState();
}

class _MembersScreenState extends ConsumerState<MembersScreen> {
  // Use FutureProvider or simply call fetch to allow pull to refresh
  late Future<List<dynamic>> _membersFuture;

  @override
  void initState() {
    super.initState();
    _fetchMembers();
  }

  void _fetchMembers() {
    _membersFuture = ref.read(businessRepositoryProvider).getMembers();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _fetchMembers();
    });
    await _membersFuture;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Members')),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: FutureBuilder<List<dynamic>>(
          future: _membersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.red)));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return ListView( // ListView allows pull to refresh even when empty
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.people_outline, size: 64, color: Colors.grey),
                          const SizedBox(height: 16),
                          const Text('No members found.', style: TextStyle(fontSize: 18, color: Colors.grey)),
                          const SizedBox(height: 8),
                          ElevatedButton.icon(
                            icon: const Icon(Icons.add),
                            label: const Text('Issue Card to New Member'),
                            onPressed: () {
                              context.push('/member_search').then((_) => _onRefresh());
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ]
              );
            }

            final members = snapshot.data!;
            return ListView.separated(
              itemCount: members.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final member = members[index];
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(member['display_name'] ?? member['phone_number']),
                  subtitle: Text(member['phone_number']),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    context.push('/member_detail', extra: member['id']).then((_) => _onRefresh());
                  },
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/member_search').then((_) => _onRefresh());
        },
        child: const Icon(Icons.person_add),
        tooltip: 'Add Member',
      ),
    );
  }
}
