import 'package:flutter/material.dart';

import 'ProgramPage.dart';

class Home extends StatefulWidget {
  final dynamic homeData;

  const Home({super.key, required this.homeData});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final List<String> tabs = ['My Programs', 'Explore Programs'];
  final TextEditingController searchController = TextEditingController();
  List<dynamic> programs = [];
  bool isFilter = false;

  @override
  void initState() {
    super.initState();
    updatePrograms();
  }

  void updatePrograms() {
    setState(() {
      programs = index == 0 ? widget.homeData['My Programs']['programs'] : widget.homeData['Explore Programs']['programs'];
    });
  }

  void searchPrograms(String searchText) {
    List<dynamic> allPrograms = index == 0 ? widget.homeData['My Programs']['programs'] : widget.homeData['Explore Programs']['programs'];
    searchText = searchText.toLowerCase();

    if (searchText.isEmpty) {
      updatePrograms();
      return;
    }

    List<dynamic> filtered = allPrograms.where((program) {
      return  program['title']?.toLowerCase().contains(searchText) ||
              program['trainer']?.toLowerCase().contains(searchText) ||
              program['goals']?.toLowerCase().contains(searchText);
    }).toList();

    setState(() {
      programs = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(tabs.length, (i) {
            String key = tabs[i];
            return GestureDetector(
              onTap: () {
                setState(() {
                  index = i;
                  searchController.clear();
                  updatePrograms();
                });
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: index == i
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSecondary,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    widget.homeData[key]['title'],
                    style: TextStyle(
                      color: index == i
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSecondary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
          child: Text(
            widget.homeData[tabs[index]]['title'],
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            widget.homeData[tabs[index]]['subtitle'],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: searchController,
                onChanged: searchPrograms,
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  hintText: "Search for programs, trainers, goals",
                  hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontSize: 14),
                  border: InputBorder.none,
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          searchPrograms(searchController.text);
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                      Container(
                        height: 16,
                        width: 2,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFilter = !isFilter;
                          });
                        },
                        icon: Icon(
                          Icons.filter_list,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              ListView.builder(
                itemCount: programs.length,
                itemBuilder: (context, listIndex) {
                  final program = programs[listIndex];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProgramPage(program: program),));
                    },
                    child: Container(
                      margin:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                      child: Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(18),
                        child: Container(
                          width: double.infinity,
                          height: 250,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onBackground,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(18),
                                      topRight: Radius.circular(18)),
                                  image: DecorationImage(
                                    image: NetworkImage(program['imageurl']),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 7),
                                        decoration: BoxDecoration(
                                          color:
                                          Theme.of(context).colorScheme.primary,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '₹${program['price']}',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onError,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      left: 20,
                                      child: Text(
                                        program['title'],
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onError,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 32,
                                    width: 32,
                                    margin: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            program['trainerProfileUrl']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    program['trainer'],
                                    style: TextStyle(
                                      color:
                                      Theme.of(context).colorScheme.secondary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 10, left: 10, right: 10),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 6),
                                        decoration: BoxDecoration(
                                          color:
                                          Theme.of(context).colorScheme.primary,
                                          borderRadius: BorderRadius.circular(24),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.flag_outlined,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onError,
                                              size: 18,
                                            ),
                                            Text(
                                              ' ${program['goals']}',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onError,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).colorScheme.surface,
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                          borderRadius: BorderRadius.circular(24),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              height: 18,
                                              width: 18,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: program['difficulty'] == "Easy"
                                                      ? Colors.green.shade800
                                                      : program['difficulty'] ==
                                                      "Medium"
                                                      ? Colors.orange.shade800
                                                      : Colors.red.shade800,
                                                  width: 4,
                                                ),
                                                color: program['difficulty'] == "Easy"
                                                    ? Colors.green
                                                    : program['difficulty'] == "Medium"
                                                    ? Colors.orange
                                                    : Colors.red,
                                              ),
                                            ),
                                            Text(
                                              ' ${program['difficulty']}',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 6),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).colorScheme.surface,
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary),
                                          borderRadius: BorderRadius.circular(24),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                              size: 18,
                                            ),
                                            Text(
                                              ' ${program['duration']}',
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              isFilter ?
              Positioned(
                right: 20,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.pink,
                ),
              ) : const SizedBox(height: 0,),
            ],
          ),
        ),
      ],
    );
  }
}
