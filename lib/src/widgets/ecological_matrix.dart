import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/nin_database.dart';
import '../screens/types_screen.dart';

class EcologicalMatrix extends StatefulWidget {
  final List<NinType> subTypes;
  const EcologicalMatrix({super.key, required this.subTypes});

  @override
  State<EcologicalMatrix> createState() => _EcologicalMatrixState();
}

class _EcologicalMatrixState extends State<EcologicalMatrix> {
  String? _xAxisVar;
  String? _yAxisVar;
  final Map<String, String> _activeFilters = {};

  @override
  void initState() {
    super.initState();
    _identifyAxes();
  }

  void _identifyAxes() {
    final Map<String, Set<String>> varSteps = {};
    for (var type in widget.subTypes) {
      if (type.lkmData == null) continue;
      final List<dynamic> lkm = jsonDecode(type.lkmData!);
      for (var entry in lkm) {
        final code = entry['v_kode'] as String;
        final trinn = entry['v_trinn']?.toString();
        if (trinn == null) continue;
        varSteps.putIfAbsent(code, () => {}).add(trinn);
      }
    }

    if (varSteps.isEmpty) return;

    // Sort variables by diversity of steps
    final sortedVars = varSteps.entries.toList()
      ..sort((a, b) => b.value.length.compareTo(a.value.length));

    // Prefer KA for X if it exists
    _xAxisVar = varSteps.containsKey('LM-KA') ? 'LM-KA' : sortedVars[0].key;
    
    // Prefer VM or UF for Y
    _yAxisVar = varSteps.containsKey('LM-VM') ? 'LM-VM' : 
                (varSteps.containsKey('LM-UF') ? 'LM-UF' : 
                (sortedVars.length > 1 ? (sortedVars[0].key == _xAxisVar ? sortedVars[1].key : sortedVars[0].key) : null));

    // All other variables become 'Sliders' (active filters)
    _activeFilters.clear();
    for (var entry in varSteps.entries) {
      if (entry.key != _xAxisVar && entry.key != _yAxisVar) {
        final steps = entry.value.toList();
        steps.sort();
        _activeFilters[entry.key] = steps.first;
      }
    }
  }

  final ValueNotifier<String?> _hoveredTypeId = ValueNotifier<String?>(null);

  @override
  void dispose() {
    _hoveredTypeId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_xAxisVar == null) {
      return const Center(child: Text('No matrix variables found for this type.'));
    }

    final matrixData = _generateMatrix();
    final xSteps = matrixData.compressedX;
    final ySteps = matrixData.compressedY;

    // Get all available steps and names for our filter variables
    final Map<String, Map<String, String>> allVarSteps = {};
    final Map<String, String> varNames = {};
    for (var type in widget.subTypes) {
      if (type.lkmData == null) continue;
      final List<dynamic> lkm = jsonDecode(type.lkmData!);
      for (var entry in lkm) {
        final code = entry['v_kode'] as String;
        final name = entry['v_navn'] as String?;
        final trinn = entry['v_trinn']?.toString();
        final trinnNavn = entry['v_trinn_navn'] as String?;
        if (trinn == null) continue;
        
        allVarSteps.putIfAbsent(code, () => {});
        if (trinnNavn != null) allVarSteps[code]![trinn] = trinnNavn;
        if (name != null) varNames[code] = name;
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Variable Toggles (Slices) - Merged by Effect
        if (_activeFilters.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _activeFilters.keys.map((filterVar) {
                final allSteps = allVarSteps[filterVar]!.keys.toList()..sort();
                final displayName = varNames[filterVar] ?? filterVar;
                
                // Group steps that produce the SAME matrix
                final List<List<String>> mergedGroups = [];
                if (allSteps.isNotEmpty) {
                  List<String> currentGroup = [allSteps[0]];
                  String? currentGridHash = _calculateGridHash(filterVar, allSteps[0]);
                  
                  for (int i = 1; i < allSteps.length; i++) {
                    final nextHash = _calculateGridHash(filterVar, allSteps[i]);
                    if (nextHash == currentGridHash) {
                      currentGroup.add(allSteps[i]);
                    } else {
                      mergedGroups.add(currentGroup);
                      currentGroup = [allSteps[i]];
                      currentGridHash = nextHash;
                    }
                  }
                  mergedGroups.add(currentGroup);
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      SizedBox(width: 80, child: Text(displayName, style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: Colors.greenAccent))),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: mergedGroups.map((group) {
                              final isSelected = group.contains(_activeFilters[filterVar]);
                              final startLabel = allVarSteps[filterVar]![group.first] ?? group.first;
                              final endLabel = allVarSteps[filterVar]![group.last] ?? group.last;
                              final rangeLabel = group.length > 1 ? "$startLabel - $endLabel" : startLabel;
                              final codesLabel = group.length > 1 ? "(${group.join(', ')})" : "";

                              return Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: ChoiceChip(
                                  label: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(rangeLabel, style: const TextStyle(fontSize: 9)),
                                      if (codesLabel.isNotEmpty)
                                        Text(codesLabel, style: const TextStyle(fontSize: 7, color: Colors.white38)),
                                    ],
                                  ),
                                  selected: isSelected,
                                  onSelected: (val) {
                                    if (val) setState(() => _activeFilters[filterVar] = group.first);
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              const Icon(Icons.grid_on, size: 14, color: Colors.greenAccent),
              const SizedBox(width: 8),
              Text(
                '${varNames[_xAxisVar] ?? _xAxisVar} × ${varNames[_yAxisVar] ?? _yAxisVar ?? "None"}',
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.greenAccent),
              ),
            ],
          ),
        ),

        // The Archipelago (Outside the box!)
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // X-Axis Header (Dual Layer)
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(width: 60), // Corner space (Matched to Y-axis width)
                  ...xSteps.map((xId) {
                    final group = matrixData.xMergeMap[xId]!;
                    final startLabel = allVarSteps[_xAxisVar]?[group.first] ?? group.first;
                    final endLabel = allVarSteps[_xAxisVar]?[group.last] ?? group.last;
                    final rangeLabel = group.length > 1 ? "$startLabel - $endLabel" : startLabel;
                    final width = group.length * 100.0;

                    return Container(
                      width: width,
                      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Range Label (Centered)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              rangeLabel,
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Colors.greenAccent),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          // Individual Step Codes
                          Row(
                            children: group.map((code) => Container(
                              width: 100,
                              height: 15,
                              alignment: Alignment.center,
                              child: Text(code, style: const TextStyle(fontSize: 7, color: Colors.white38)),
                            )).toList(),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Y-Axis Header (Dual Layer)
                  Column(
                    children: ySteps.map((yId) {
                      final group = matrixData.yMergeMap[yId]!;
                      final startLabel = allVarSteps[_yAxisVar]?[group.first] ?? group.first;
                      final endLabel = allVarSteps[_yAxisVar]?[group.last] ?? group.last;
                      final rangeLabel = group.length > 1 ? "${startLabel == '' ? '-' : startLabel} - ${endLabel}" : (startLabel == '' ? '-' : startLabel);
                      final height = group.length * 80.0;

                      return Container(
                        width: 60, // Tightened from 80
                        height: height,
                        decoration: const BoxDecoration(border: Border(right: BorderSide(color: Colors.white10))),
                        child: Row(
                          children: [
                            // Range Label (Vertical Centered)
                            Expanded(
                              child: RotatedBox(
                                quarterTurns: 3,
                                child: Text(
                                  rangeLabel,
                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 9, color: Colors.greenAccent),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            // Individual Step Codes
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: group.map((code) => Container(
                                width: 25,
                                height: 80,
                                alignment: Alignment.center,
                                child: Text(code, style: const TextStyle(fontSize: 7, color: Colors.white38)),
                              )).toList(),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  // The Data Area (Stack)
                  Builder(builder: (context) {
                    // Calculate total width/height from groups
                    double totalW = 0;
                    for (var xId in xSteps) totalW += (matrixData.xMergeMap[xId]?.length ?? 1) * 100.0;
                    double totalH = 0;
                    for (var yId in ySteps) totalH += (matrixData.yMergeMap[yId]?.length ?? 1) * 80.0;

                    return SizedBox(
                      width: totalW,
                      height: totalH,
                      child: Stack(
                        children: [
                          // Subtle Background Grid (Individual steps)
                          _buildBackgroundGrid(matrixData, xSteps, ySteps),
                          
                          // The Islands
                          ..._buildIslands(matrixData, xSteps, ySteps),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            'Matrix Axes: X=$_xAxisVar, Y=${_yAxisVar ?? "None"}',
            style: const TextStyle(fontSize: 10, color: Colors.white24),
          ),
        ),
      ],
    );
  }

  _MatrixData _generateMatrix() {
    final Map<String, Map<String, NinType>> grid = {};
    final Set<String> xSteps = {};
    final Set<String> ySteps = {};

    for (var type in widget.subTypes) {
      if (type.lkmData == null) continue;
      final List<dynamic> lkm = jsonDecode(type.lkmData!);
      
      final List<String> currentXSteps = [];
      final List<String> currentYSteps = [];
      bool matchesFilters = true;

      // Group steps by variable for this type
      final typeVars = <String, Set<String>>{};
      for (var entry in lkm) {
        final code = entry['v_kode'] as String;
        final trinn = entry['v_trinn']?.toString();
        if (trinn == null) continue;
        typeVars.putIfAbsent(code, () => {}).add(trinn);
      }

      // Check if this type exists in our current slice (for dimensions other than X/Y)
      _activeFilters.forEach((filterVar, selectedTrinn) {
        if (typeVars.containsKey(filterVar) && !typeVars[filterVar]!.contains(selectedTrinn)) {
          matchesFilters = false;
        }
      });

      if (matchesFilters) {
        currentXSteps.addAll(typeVars[_xAxisVar] ?? []);
        currentYSteps.addAll(typeVars[_yAxisVar] ?? []);

        if (currentXSteps.isNotEmpty) {
          final yStepsToFill = currentYSteps.isNotEmpty ? currentYSteps : [''];
          for (var x in currentXSteps) {
            xSteps.add(x);
            for (var y in yStepsToFill) {
              ySteps.add(y);
              grid.putIfAbsent(y, () => {})[x] = type;
            }
          }
        }
      }
    }

    final List<String> sortedX = xSteps.toList()..sort();
    final List<String> sortedY = ySteps.toList()..sort();

    // Compression: Merge adjacent identical X columns
    final List<List<String>> mergedX = [];
    if (sortedX.isNotEmpty) {
      List<String> currentGroup = [sortedX[0]];
      for (int i = 1; i < sortedX.length; i++) {
        bool identical = true;
        for (var y in sortedY) {
          if (grid[y]?[sortedX[i]]?.id != grid[y]?[sortedX[i-1]]?.id) {
            identical = false;
            break;
          }
        }
        if (identical) {
          currentGroup.add(sortedX[i]);
        } else {
          mergedX.add(currentGroup);
          currentGroup = [sortedX[i]];
        }
      }
      mergedX.add(currentGroup);
    }

    // Compression: Merge adjacent identical Y rows
    final List<List<String>> mergedY = [];
    if (sortedY.isNotEmpty) {
      List<String> currentGroup = [sortedY[0]];
      for (int j = 1; j < sortedY.length; j++) {
        bool identical = true;
        for (var x in sortedX) {
          if (grid[sortedY[j]]?[x]?.id != grid[sortedY[j-1]]?[x]?.id) {
            identical = false;
            break;
          }
        }
        if (identical) {
          currentGroup.add(sortedY[j]);
        } else {
          mergedY.add(currentGroup);
          currentGroup = [sortedY[j]];
        }
      }
      mergedY.add(currentGroup);
    }

    // Create compressed grid
    final Map<String, Map<String, NinType>> compressedGrid = {};
    final List<String> compressedX = [];
    final List<String> compressedY = [];
    final Map<String, List<String>> xMergeMap = {};
    final Map<String, List<String>> yMergeMap = {};

    for (var xGroup in mergedX) {
      final xId = xGroup.join('|');
      compressedX.add(xId);
      xMergeMap[xId] = xGroup;
    }
    for (var yGroup in mergedY) {
      final yId = yGroup.join('|');
      compressedY.add(yId);
      yMergeMap[yId] = yGroup;
    }

    for (var yId in compressedY) {
      final ySample = yMergeMap[yId]!.first;
      for (var xId in compressedX) {
        final xSample = xMergeMap[xId]!.first;
        final type = grid[ySample]?[xSample];
        if (type != null) {
          compressedGrid.putIfAbsent(yId, () => {})[xId] = type;
        }
      }
    }

    return _MatrixData(compressedGrid, compressedX, compressedY, xMergeMap, yMergeMap);
  }

  String _calculateGridHash(String variable, String step) {
    // Temporary override to check effect
    final originalFilter = _activeFilters[variable];
    _activeFilters[variable] = step;
    
    final data = _generateMatrix();
    
    // Restore
    _activeFilters[variable] = originalFilter!;
    
    // Create a stable hash based on (typeId, x, y)
    final List<String> items = [];
    data.grid.forEach((y, row) {
      row.forEach((x, type) {
        items.add("${type.id}:$x:$y");
      });
    });
    items.sort();
    return items.join("|");
  }

  Widget _buildBackgroundGrid(_MatrixData data, List<String> xSteps, List<String> ySteps) {
    final List<Widget> lines = [];
    double currentX = 0;
    for (var xId in xSteps) {
      final group = data.xMergeMap[xId]!;
      for (int i = 0; i < group.length; i++) {
        lines.add(Positioned(
          left: currentX, top: 0, bottom: 0,
          child: Container(width: 1, color: Colors.white.withOpacity(0.05)),
        ));
        currentX += 100.0;
      }
    }
    double currentY = 0;
    for (var yId in ySteps) {
      final group = data.yMergeMap[yId]!;
      for (int i = 0; i < group.length; i++) {
        lines.add(Positioned(
          top: currentY, left: 0, right: 0,
          child: Container(height: 1, color: Colors.white.withOpacity(0.05)),
        ));
        currentY += 80.0;
      }
    }
    return Stack(children: lines);
  }

  List<Widget> _buildIslands(_MatrixData data, List<String> xSteps, List<String> ySteps) {
    final List<Widget> islands = [];
    final Set<String> processedCells = {}; // Format: "yIndex-xIndex"

    // Map of cumulative positions
    final Map<int, double> xPosMap = {};
    double cumX = 0;
    for (int i = 0; i < xSteps.length; i++) {
      xPosMap[i] = cumX;
      cumX += data.xMergeMap[xSteps[i]]!.length * 100.0;
    }
    final Map<int, double> yPosMap = {};
    double cumY = 0;
    for (int j = 0; j < ySteps.length; j++) {
      yPosMap[j] = cumY;
      cumY += data.yMergeMap[ySteps[j]]!.length * 80.0;
    }

    for (int j = 0; j < ySteps.length; j++) {
      for (int i = 0; i < xSteps.length; i++) {
        final cellId = "$j-$i";
        if (processedCells.contains(cellId)) continue;

        final type = data.grid[ySteps[j]]?[xSteps[i]];
        if (type == null) continue;

        int maxX = i;
        int maxY = j;

        while (maxX + 1 < xSteps.length && data.grid[ySteps[j]]?[xSteps[maxX + 1]]?.id == type.id) {
          maxX++;
        }
        bool canExpandY = true;
        while (canExpandY && maxY + 1 < ySteps.length) {
          for (int k = i; k <= maxX; k++) {
            if (data.grid[ySteps[maxY + 1]]?[xSteps[k]]?.id != type.id) {
              canExpandY = false;
              break;
            }
          }
          if (canExpandY) maxY++;
        }

        for (int row = j; row <= maxY; row++) {
          for (int col = i; col <= maxX; col++) {
            processedCells.add("$row-$col");
          }
        }

        // Calculate size based on merged group lengths
        double width = 0;
        for (int k = i; k <= maxX; k++) width += data.xMergeMap[xSteps[k]]!.length * 100.0;
        double height = 0;
        for (int k = j; k <= maxY; k++) height += data.yMergeMap[ySteps[k]]!.length * 80.0;

        islands.add(Positioned(
          left: xPosMap[i]!,
          top: yPosMap[j]!,
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: MouseRegion(
              onEnter: (_) => _hoveredTypeId.value = type.id,
              onExit: (_) => _hoveredTypeId.value = null,
              child: ValueListenableBuilder<String?>(
                valueListenable: _hoveredTypeId,
                builder: (context, hoveredId, _) {
                  final isHighlighted = hoveredId == type.id;
                  return InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TypesScreen(type: type))),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: isHighlighted 
                            ? [Colors.green.withOpacity(0.4), Colors.green.withOpacity(0.2)]
                            : [Colors.green.withOpacity(0.15), Colors.green.withOpacity(0.05)],
                        ),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: isHighlighted ? Colors.greenAccent : Colors.white10),
                        boxShadow: isHighlighted ? [
                          BoxShadow(color: Colors.green.withOpacity(0.2), blurRadius: 8, spreadRadius: 1)
                        ] : [],
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            type.id.split('-').last,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.greenAccent),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            type.navn,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 10, color: Colors.white70),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
        ));
      }
    }

    return islands;
  }
}

class _MatrixData {
  final Map<String, Map<String, NinType>> grid;
  final List<String> compressedX;
  final List<String> compressedY;
  final Map<String, List<String>> xMergeMap;
  final Map<String, List<String>> yMergeMap;

  _MatrixData(this.grid, this.compressedX, this.compressedY, this.xMergeMap, this.yMergeMap);
}
