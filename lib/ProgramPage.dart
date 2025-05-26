import 'package:flutter/material.dart';

class ProgramPage extends StatefulWidget {
  const ProgramPage({super.key, required this.program});
  final dynamic program;

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.program['imageurl']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      widget.program['title'],
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .onError,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    height: 64,
                    width: 64,
                    margin: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            widget.program['trainerProfileUrl']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trainer',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const Divider(
                        height: 2,
                      ),
                      Text(
                        widget.program['trainer'],
                        style: TextStyle(
                          color:
                          Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                          size: 16,
                        ),
                        Text(
                          ' ${widget.program['goals']}',
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onError,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    'Difficulty: ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10,),
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
                              color: widget.program['difficulty'] == "Easy"
                                  ? Colors.green.shade800
                                  : widget.program['difficulty'] ==
                                  "Medium"
                                  ? Colors.orange.shade800
                                  : Colors.red.shade800,
                              width: 4,
                            ),
                            color: widget.program['difficulty'] == "Easy"
                                ? Colors.green
                                : widget.program['difficulty'] == "Medium"
                                ? Colors.orange
                                : Colors.red,
                          ),
                        ),
                        Text(
                          ' ${widget.program['difficulty']}',
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
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Text(
                    'Duration ',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10,),
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
                          ' ${widget.program['duration']}',
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
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {

              },
              child: Container(
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'Join Now only @ Rs.${widget.program['price']}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onError,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
