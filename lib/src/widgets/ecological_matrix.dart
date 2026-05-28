import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/nin_database.dart';
import '../screens/types_screen.dart';
import '../screens/variable_detail_screen.dart';
import '../utils/gad_konstans_colors.dart';

class EcologicalMatrix extends StatefulWidget {
  final List<NinType> subTypes;
  final ValueChanged<NinType>? onPick;
  final bool showStepNames;
  final Map<String, double>? gadConstancy;

  const EcologicalMatrix({
    super.key,
    required this.subTypes,
    this.onPick,
    this.showStepNames = true,
    this.gadConstancy,
  });

  @override
  State<EcologicalMatrix> createState() => _EcologicalMatrixState();
}

class _EcologicalMatrixState extends State<EcologicalMatrix> {
  String? _xAxisVar;
  String? _yAxisVar;
  final Map<String, String> _activeFilters = {};
  late bool _showStepNames;

  @override
  void initState() {
    super.initState();
    _showStepNames = widget.showStepNames;
    _identifyAxes();
  }

  @override
  void didUpdateWidget(EcologicalMatrix oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.subTypes != oldWidget.subTypes) {
      _identifyAxes();
    }
    if (widget.showStepNames != oldWidget.showStepNames) {
      setState(() => _showStepNames = widget.showStepNames);
    }
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

    if (varSteps.isEmpty) {
      _xAxisVar = null;
      _yAxisVar = null;
      _activeFilters.clear();
      return;
    }

    // Sort variables by diversity of steps
    final sortedVars = varSteps.entries.toList()
      ..sort((a, b) => b.value.length.compareTo(a.value.length));

    // Use the variables with the most steps as X and Y axes
    _xAxisVar = sortedVars[0].key;
    _yAxisVar = sortedVars.length > 1 ? sortedVars[1].key : null;

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

  bool _isHighContrast(ColorScheme colorScheme) =>
      colorScheme.primary == Colors.black || colorScheme.primary == Colors.white;

  Color _matrixBorderColor(ColorScheme colorScheme, {double opacity = 0.12}) =>
      _isHighContrast(colorScheme)
          ? colorScheme.outline
          : colorScheme.onSurface.withOpacity(opacity);

  Color _matrixGridLineColor(ColorScheme colorScheme) =>
      _isHighContrast(colorScheme)
          ? colorScheme.outline.withOpacity(0.65)
          : colorScheme.onSurface.withOpacity(0.08);

  double _matrixBorderWidth(ColorScheme colorScheme, {double normal = 1}) =>
      _isHighContrast(colorScheme) ? 2 : normal;

  Color _matrixAxisFillColor(ColorScheme colorScheme) =>
      _isHighContrast(colorScheme)
          ? colorScheme.surface
          : colorScheme.primary.withOpacity(0.1);

  @override
  Widget build(BuildContext context) {
    if (widget.subTypes.isEmpty || _xAxisVar == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            "No ecological gradients available for this view",
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2)),
          ),
        ),
      );
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
        final name = entry['v_navn']?.toString();
        final trinn = entry['v_trinn']?.toString();
        final trinnNavn = entry['v_trinn_navn'] as String?;
        if (trinn == null) continue;
        
        allVarSteps.putIfAbsent(code, () => {});
        if (trinnNavn != null) allVarSteps[code]![trinn] = trinnNavn;
        if (name != null) varNames[code] = name;
      }
    }

    // Responsive sizing — prefer readable cells; scroll horizontally if needed.
    final colorScheme = Theme.of(context).colorScheme;
    final bool hasYAxis = _yAxisVar != null;

    return LayoutBuilder(
      builder: (context, constraints) {
        final availableW = constraints.maxWidth;

        double totalXUnits = 0;
        for (var xId in xSteps) {
          totalXUnits += (matrixData.xMergeMap[xId]?.length ?? 1);
        }
        double totalYUnits = 0;
        for (var yId in ySteps) {
          totalYUnits += (matrixData.yMergeMap[yId]?.length ?? 1);
        }

        final layout = _computeLayout(
          availableWidth: availableW,
          availableHeight: constraints.maxHeight.isFinite
              ? constraints.maxHeight
              : _viewportMatrixBudget(context, totalXUnits, totalYUnits),
          totalXUnits: totalXUnits,
          totalYUnits: totalYUnits,
          hasYAxis: hasYAxis,
          xSteps: xSteps,
          ySteps: ySteps,
          matrixData: matrixData,
          allVarSteps: allVarSteps,
          showStepCodes: !_showStepNames,
        );

        final gridWidth = totalXUnits * layout.unitWidth;

        Widget gridColumn = Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: gridWidth,
              height: totalYUnits * layout.unitHeight,
              child: Stack(
                children: [
                  _buildBackgroundGrid(
                    matrixData,
                    xSteps,
                    ySteps,
                    layout.unitWidth,
                    layout.unitHeight,
                    colorScheme,
                  ),
                  if (widget.gadConstancy != null && widget.gadConstancy!.isNotEmpty) ...[
                    ..._buildIslands(
                      matrixData,
                      xSteps,
                      ySteps,
                      layout.unitWidth,
                      layout.unitHeight,
                      colorScheme,
                    ),
                    ..._buildGadHeatmap(
                      matrixData,
                      xSteps,
                      ySteps,
                      layout.unitWidth,
                      layout.unitHeight,
                      colorScheme,
                    ),
                    ..._buildGadLabels(
                      matrixData,
                      xSteps,
                      ySteps,
                      layout.unitWidth,
                      layout.unitHeight,
                      colorScheme,
                    ),
                  ] else ...[
                    ..._buildIslands(
                      matrixData,
                      xSteps,
                      ySteps,
                      layout.unitWidth,
                      layout.unitHeight,
                      colorScheme,
                    ),
                  ],
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: xSteps.map((xId) {
                final group = matrixData.xMergeMap[xId]!;
                final rangeLabel = _formatRangeLabel(
                  group,
                  allVarSteps[_xAxisVar],
                  showStepNames: _showStepNames,
                );
                final width = group.length * layout.unitWidth;

                return _buildXAxisStepLabel(
                  context,
                  colorScheme: colorScheme,
                  width: width,
                  rangeLabel: rangeLabel,
                  stepCodes: group,
                  showStepCodes: layout.showStepCodes,
                  unitWidth: layout.unitWidth,
                  axisHeight: layout.xAxisHeight,
                );
              }).toList(),
            ),
            Semantics(
              label: 'X-axis variable: $_xAxisVar. Tap to view details.',
              button: true,
              child: InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VariableDetailScreen(variableId: _xAxisVar!),
                  ),
                ),
                child: Container(
                  width: gridWidth,
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  decoration: BoxDecoration(
                    color: _matrixAxisFillColor(colorScheme),
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(4)),
                    border: Border.all(
                      color: _matrixBorderColor(colorScheme, opacity: 0.2),
                      width: _matrixBorderWidth(colorScheme),
                    ),
                  ),
                  child: _MatrixLabel(
                    text: '$_xAxisVar (${varNames[_xAxisVar] ?? 'N/A'})',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                    maxLines: 2,
                    minFontSize: 10,
                    maxFontSize: 13,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        );

        if (layout.scrollHorizontally) {
          gridColumn = SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: gridColumn,
          );
        }

        final matrixBlock = Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (hasYAxis) ...[
              _buildYAxisVariableStrip(
                context,
                colorScheme: colorScheme,
                height: totalYUnits * layout.unitHeight,
                width: layout.yVariableStripWidth,
                label: '$_yAxisVar (${varNames[_yAxisVar] ?? 'N/A'})',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => VariableDetailScreen(variableId: _yAxisVar!),
                  ),
                ),
              ),
              Column(
                children: ySteps.map((yId) {
                  final group = matrixData.yMergeMap[yId]!;
                  final rangeLabel = _formatRangeLabel(
                    group,
                    allVarSteps[_yAxisVar],
                    showStepNames: _showStepNames,
                  );
                  final height = group.length * layout.unitHeight;

                  return _buildYAxisStepLabel(
                    context,
                    colorScheme: colorScheme,
                    width: layout.yHeaderWidth,
                    height: height,
                    rangeLabel: rangeLabel,
                    stepCodes: group,
                    showStepCodes: layout.showStepCodes,
                    unitHeight: layout.unitHeight,
                  );
                }).toList(),
              ),
            ],
            Expanded(child: gridColumn),
          ],
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_activeFilters.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: [
                          Icon(Icons.tune, size: 14, color: colorScheme.primary),
                          const SizedBox(width: 6),
                          Text(
                            'ADDITIONAL LKMs',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1,
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ..._activeFilters.keys.map((filterVar) {
                    final allSteps = allVarSteps[filterVar]!.keys.toList()..sort();
                    final displayName = varNames[filterVar] ?? filterVar;

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
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildAdditionalLkmHeader(
                            context,
                            colorScheme: colorScheme,
                            variableId: filterVar,
                            displayName: displayName,
                          ),
                          const SizedBox(height: 8),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: mergedGroups.map((group) {
                                final isSelected = group.contains(_activeFilters[filterVar]);
                                final rangeLabel = _formatRangeLabel(
                                  group,
                                  allVarSteps[filterVar],
                                  showStepNames: _showStepNames,
                                );

                                return Padding(
                                  padding: const EdgeInsets.only(right: 6.0),
                                  child: ChoiceChip(
                                    label: Text(
                                      rangeLabel,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: isSelected
                                            ? colorScheme.onPrimary
                                            : colorScheme.onSurface,
                                      ),
                                    ),
                                    selected: isSelected,
                                    showCheckmark: false,
                                    selectedColor: colorScheme.primary,
                                    backgroundColor: colorScheme.surface,
                                    side: BorderSide(
                                      color: isSelected
                                          ? colorScheme.primary
                                          : colorScheme.outline.withOpacity(0.55),
                                      width: isSelected ? 1.5 : 1,
                                    ),
                                    onSelected: (val) {
                                      if (val) {
                                        setState(() => _activeFilters[filterVar] = group.first);
                                      }
                                    },
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Icon(Icons.grid_on, size: 14, color: colorScheme.primary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      hasYAxis
                          ? '${varNames[_xAxisVar] ?? _xAxisVar} \u00d7 ${varNames[_yAxisVar] ?? _yAxisVar}'
                          : '${varNames[_xAxisVar] ?? _xAxisVar}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: matrixBlock,
            ),
            if (layout.scrollHorizontally)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  'Scroll horizontally to read all columns',
                  style: TextStyle(
                    fontSize: 10,
                    color: colorScheme.onSurface.withOpacity(0.45),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildAdditionalLkmHeader(
    BuildContext context, {
    required ColorScheme colorScheme,
    required String variableId,
    required String displayName,
  }) {
    return Semantics(
      label: 'View details for variable $displayName',
      button: true,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => VariableDetailScreen(variableId: variableId),
          ),
        ),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _matrixBorderColor(colorScheme, opacity: 0.45),
              width: _matrixBorderWidth(colorScheme),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: colorScheme.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  variableId,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onPrimary,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      displayName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                        color: colorScheme.onPrimaryContainer,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Tap for variable details',
                      style: TextStyle(
                        fontSize: 10,
                        color: colorScheme.onPrimaryContainer.withOpacity(0.72),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.open_in_new,
                size: 16,
                color: colorScheme.onPrimaryContainer,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatRangeLabel(
    List<String> group,
    Map<String, String>? stepNames, {
    required bool showStepNames,
  }) {
    if (group.isEmpty) return '-';
    if (showStepNames) {
      final startLabel = stepNames?[group.first] ?? group.first;
      final endLabel = stepNames?[group.last] ?? group.last;
      if (startLabel.isEmpty) return '-';
      return group.length > 1 ? '$startLabel–$endLabel' : startLabel;
    }
    return group.join(', ');
  }

  double _viewportMatrixBudget(
    BuildContext context,
    double totalXUnits,
    double totalYUnits,
  ) {
    final media = MediaQuery.sizeOf(context);
    final padding = MediaQuery.paddingOf(context);
    final usableHeight = media.height - padding.top - padding.bottom;
    final matrixAspect = totalYUnits / (totalXUnits > 0 ? totalXUnits : 1);

    final factor = switch (matrixAspect) {
      >= 2.0 => 0.36,
      >= 1.4 => 0.42,
      >= 1.0 => 0.48,
      >= 0.65 => 0.54,
      _ => 0.58,
    };

    return usableHeight * factor;
  }

  _MatrixLayout _computeLayout({
    required double availableWidth,
    required double availableHeight,
    required double totalXUnits,
    required double totalYUnits,
    required bool hasYAxis,
    required List<String> xSteps,
    required List<String> ySteps,
    required _MatrixData matrixData,
    required Map<String, Map<String, String>> allVarSteps,
    required bool showStepCodes,
  }) {
    const idealUnit = 56.0;
    const minUnit = 44.0;
    const minUnitHeight = 34.0;

    double yVariableStripWidth(bool compact) =>
        hasYAxis ? (compact ? 18.0 : 26.0) : 0.0;

    double yHeaderWidth(bool compact) {
      if (!hasYAxis) return 0.0;
      if (showStepCodes) return compact ? 22.0 : 28.0;

      var width = compact ? 40.0 : 52.0;
      for (final yId in ySteps) {
        final group = matrixData.yMergeMap[yId]!;
        final label = _formatRangeLabel(
          group,
          allVarSteps[_yAxisVar],
          showStepNames: true,
        );
        if (label.length > 14) {
          width = (width + 8).clamp(52.0, 88.0);
        }
      }
      return width;
    }

    // Prefer scrolling over shrinking cells on narrow viewports.
    final compactYGutter =
        yVariableStripWidth(true) + yHeaderWidth(true);
    final naturalGridWidth = totalXUnits * idealUnit;
    final scrollHorizontally =
        naturalGridWidth > (availableWidth - compactYGutter).clamp(80.0, double.infinity);

    final yVarStrip = yVariableStripWidth(scrollHorizontally);
    final yHeader = yHeaderWidth(scrollHorizontally);
    final yAxisGutterWidth = yVarStrip + yHeader;
    final gridBudget =
        (availableWidth - yAxisGutterWidth).clamp(80.0, double.infinity);

    final unitWidth = scrollHorizontally
        ? idealUnit
        : (gridBudget / (totalXUnits > 0 ? totalXUnits : 1))
            .clamp(minUnit, 112.0);

    final xAxisHeight = showStepCodes ? 26.0 : 34.0;
    const xLkmBarHeight = 34.0;
    final maxGridHeight = (availableHeight - xAxisHeight - xLkmBarHeight)
        .clamp(minUnitHeight * 2, double.infinity);

    final squareHeight = unitWidth.clamp(minUnitHeight, 112.0);
    final fittedHeight = totalYUnits > 0
        ? (maxGridHeight / totalYUnits).clamp(minUnitHeight, squareHeight)
        : squareHeight;
    final unitHeight = totalYUnits * squareHeight > maxGridHeight
        ? fittedHeight
        : squareHeight;

    return _MatrixLayout(
      unitWidth: unitWidth,
      unitHeight: unitHeight,
      yVariableStripWidth: yVarStrip,
      yHeaderWidth: yHeader,
      yAxisGutterWidth: yAxisGutterWidth,
      xAxisHeight: xAxisHeight,
      showStepCodes: showStepCodes,
      scrollHorizontally: scrollHorizontally,
    );
  }

  Widget _buildYAxisVariableStrip(
    BuildContext context, {
    required ColorScheme colorScheme,
    required double height,
    required double width,
    required String label,
    required VoidCallback onTap,
  }) {
    return Semantics(
      label: 'Y-axis variable. Tap to view details.',
      button: true,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _matrixAxisFillColor(colorScheme),
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(4)),
            border: Border.all(
              color: _matrixBorderColor(colorScheme, opacity: 0.2),
              width: _matrixBorderWidth(colorScheme),
            ),
          ),
          child: RotatedBox(
            quarterTurns: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: _MatrixLabel(
                text: label,
                style: TextStyle(fontWeight: FontWeight.bold, color: colorScheme.primary),
                maxLines: 2,
                minFontSize: 9,
                maxFontSize: 12,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildYAxisStepLabel(
    BuildContext context, {
    required ColorScheme colorScheme,
    required double width,
    required double height,
    required String rangeLabel,
    required List<String> stepCodes,
    required bool showStepCodes,
    required double unitHeight,
  }) {
    if (showStepCodes) {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: _matrixBorderColor(colorScheme),
              width: _matrixBorderWidth(colorScheme),
            ),
          ),
        ),
        child: Column(
          children: stepCodes
              .map(
                (code) => SizedBox(
                  height: unitHeight,
                  child: Center(
                    child: _MatrixLabel(
                      text: code,
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      minFontSize: 9,
                      maxFontSize: 12,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      );
    }

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            color: _matrixBorderColor(colorScheme),
            width: _matrixBorderWidth(colorScheme),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: RotatedBox(
          quarterTurns: 3,
          child: _MatrixLabel(
            text: rangeLabel,
            style: TextStyle(fontWeight: FontWeight.w700, color: colorScheme.primary),
            maxLines: 3,
            minFontSize: 9,
            maxFontSize: 12,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildXAxisStepLabel(
    BuildContext context, {
    required ColorScheme colorScheme,
    required double width,
    required String rangeLabel,
    required List<String> stepCodes,
    required bool showStepCodes,
    required double unitWidth,
    required double axisHeight,
  }) {
    if (showStepCodes) {
      return Container(
        width: width,
        height: axisHeight,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: _matrixBorderColor(colorScheme),
              width: _matrixBorderWidth(colorScheme),
            ),
          ),
        ),
        child: Row(
          children: stepCodes
              .map(
                (code) => SizedBox(
                  width: unitWidth,
                  child: Center(
                    child: _MatrixLabel(
                      text: code,
                      style: TextStyle(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      minFontSize: 9,
                      maxFontSize: 12,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      );
    }

    return Container(
      width: width,
      height: axisHeight,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: _matrixBorderColor(colorScheme),
            width: _matrixBorderWidth(colorScheme),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(2, 4, 2, 4),
        child: _MatrixLabel(
          text: rangeLabel,
          style: TextStyle(fontWeight: FontWeight.w700, color: colorScheme.primary),
          maxLines: 3,
          minFontSize: 9,
          maxFontSize: 12,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildCellContent(
    NinType type,
    double width,
    double height,
    ColorScheme colorScheme,
  ) {
    final showName = height >= 30 && width >= 28;

    return Padding(
      padding: const EdgeInsets.all(3),
      child: SizedBox(
        width: width - 2,
        height: height - 2,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: _isHighContrast(colorScheme)
                ? colorScheme.surface
                : colorScheme.surface.withOpacity(0.78),
            borderRadius: BorderRadius.circular(4),
            border: _isHighContrast(colorScheme)
                ? Border.all(
                    color: colorScheme.outline,
                    width: 1,
                  )
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: _MatrixLabel(
                      text: type.id,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: colorScheme.primary,
                        letterSpacing: -0.2,
                      ),
                      maxLines: 2,
                      minFontSize: 9,
                      maxFontSize: 14,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                if (showName)
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: _MatrixLabel(
                        text: type.navn,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: colorScheme.onSurface.withOpacity(0.88),
                        ),
                        maxLines: height >= 72 ? 3 : 2,
                        minFontSize: 8,
                        maxFontSize: 11,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
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
    // Sort Y in descending order so that the lowest values (origin) end up at the bottom
    final List<String> sortedY = ySteps.toList()..sort((a, b) => b.compareTo(a));

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

  Widget _buildBackgroundGrid(_MatrixData data, List<String> xSteps, List<String> ySteps, double unitWidth, double unitHeight, ColorScheme colorScheme) {
    final lineColor = _matrixGridLineColor(colorScheme);
    final lineWidth = _isHighContrast(colorScheme) ? 1.5 : 1.0;
    final List<Widget> lines = [];
    double currentX = 0;
    for (var xId in xSteps) {
      final group = data.xMergeMap[xId]!;
      for (int i = 0; i < group.length; i++) {
        lines.add(Positioned(
          left: currentX, top: 0, bottom: 0,
          child: Container(width: lineWidth, color: lineColor),
        ));
        currentX += unitWidth;
      }
    }
    double currentY = 0;
    for (var yId in ySteps) {
      final group = data.yMergeMap[yId]!;
      for (int i = 0; i < group.length; i++) {
        lines.add(Positioned(
          top: currentY, left: 0, right: 0,
          child: Container(height: lineWidth, color: lineColor),
        ));
        currentY += unitHeight;
      }
    }
    return Stack(children: lines);
  }

  (String?, String?, String?) _resolveGadTrinn(String xTrinn, String yTrinn) {
    String? ka;
    String? uf;
    String? vm;

    void assign(String varCode, String trinn) {
      switch (varCode) {
        case 'LM-KA':
          ka = trinn;
        case 'LM-UF':
          uf = trinn;
        case 'LM-VM':
          vm = trinn;
      }
    }

    if (_xAxisVar != null) assign(_xAxisVar!, xTrinn);
    if (_yAxisVar != null) assign(_yAxisVar!, yTrinn);
    for (final entry in _activeFilters.entries) {
      assign(entry.key, entry.value);
    }

    return (ka, uf, vm);
  }

  double? _lookupGad(String xTrinn, String yTrinn) {
    final map = widget.gadConstancy;
    if (map == null || map.isEmpty) return null;
    final (ka, uf, vm) = _resolveGadTrinn(xTrinn, yTrinn);
    if (ka == null || uf == null || vm == null) return null;
    return map['$ka|$uf|$vm'];
  }

  String _formatGadValue(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(1);
  }

  List<Widget> _buildGadHeatmap(
    _MatrixData data,
    List<String> xSteps,
    List<String> ySteps,
    double unitWidth,
    double unitHeight,
    ColorScheme colorScheme,
  ) {
    return _buildGadCells(
      data,
      xSteps,
      ySteps,
      unitWidth,
      unitHeight,
      colorScheme,
      includeColor: true,
      includeLabel: false,
    );
  }

  List<Widget> _buildGadLabels(
    _MatrixData data,
    List<String> xSteps,
    List<String> ySteps,
    double unitWidth,
    double unitHeight,
    ColorScheme colorScheme,
  ) {
    return _buildGadCells(
      data,
      xSteps,
      ySteps,
      unitWidth,
      unitHeight,
      colorScheme,
      includeColor: false,
      includeLabel: true,
    );
  }

  List<Widget> _buildGadCells(
    _MatrixData data,
    List<String> xSteps,
    List<String> ySteps,
    double unitWidth,
    double unitHeight,
    ColorScheme colorScheme, {
    required bool includeColor,
    required bool includeLabel,
  }) {
    final cells = <Widget>[];
    double cumX = 0;

    for (final xId in xSteps) {
      final xGroup = data.xMergeMap[xId]!;
      for (final xTrinn in xGroup) {
        double cumY = 0;
        for (final yId in ySteps) {
          final yGroup = data.yMergeMap[yId]!;
          for (final yTrinn in yGroup) {
            final value = _lookupGad(xTrinn, yTrinn);
            if (value != null && value > 0) {
              final tint = GadKonstansColors.tintFor(value, colorScheme);
              cells.add(
                Positioned(
                  left: cumX,
                  top: cumY,
                  width: unitWidth,
                  height: unitHeight,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      if (includeColor)
                        IgnorePointer(
                          child: Container(
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: tint,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                        ),
                      if (includeLabel)
                        Center(
                          child: _GadValueBadge(
                            label: _formatGadValue(value),
                            compact: unitWidth < 44 || unitHeight < 44,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }
            cumY += unitHeight;
          }
        }
        cumX += unitWidth;
      }
    }

    return cells;
  }

  Widget _buildIslandLayer({
    required NinType type,
    required double width,
    required double height,
    required ColorScheme colorScheme,
  }) {
    return MouseRegion(
      onEnter: (_) => _hoveredTypeId.value = type.id,
      onExit: (_) => _hoveredTypeId.value = null,
      child: ValueListenableBuilder<String?>(
        valueListenable: _hoveredTypeId,
        builder: (context, hoveredId, _) {
          final isHighlighted = hoveredId == type.id;

          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TypesScreen(type: type, onPick: widget.onPick),
              ),
            ),
            child: Semantics(
              label: 'Nature type ${type.id}: ${type.navn}. Tap to select or view details.',
              button: true,
              child: Container(
                decoration: _islandDecoration(
                  colorScheme: colorScheme,
                  isHighlighted: isHighlighted,
                ),
                alignment: Alignment.center,
                child: _buildCellContent(
                  type,
                  width,
                  height,
                  colorScheme,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  BoxDecoration _islandDecoration({
    required ColorScheme colorScheme,
    required bool isHighlighted,
  }) {
    final primaryColor = colorScheme.primary;

    if (_isHighContrast(colorScheme)) {
      return BoxDecoration(
        color: isHighlighted
            ? colorScheme.surfaceContainerHighest
            : colorScheme.surface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isHighlighted
              ? primaryColor
              : _matrixBorderColor(colorScheme, opacity: 0.25),
          width: _matrixBorderWidth(colorScheme),
        ),
      );
    }

    final baseOpacity = isHighlighted ? 0.4 : 0.15;
    final endOpacity = isHighlighted ? 0.2 : 0.05;

    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          primaryColor.withOpacity(baseOpacity),
          primaryColor.withOpacity(endOpacity),
        ],
      ),
      borderRadius: BorderRadius.circular(4),
      border: Border.all(
        color: isHighlighted
            ? primaryColor
            : _matrixBorderColor(colorScheme, opacity: 0.25),
        width: _matrixBorderWidth(colorScheme),
      ),
      boxShadow: isHighlighted
          ? [
              BoxShadow(
                color: primaryColor.withOpacity(0.2),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ]
          : [],
    );
  }

  List<Widget> _buildIslands(
    _MatrixData data,
    List<String> xSteps,
    List<String> ySteps,
    double unitWidth,
    double unitHeight,
    ColorScheme colorScheme,
  ) {
    final List<Widget> islands = [];
    final Set<String> processedCells = {}; // Format: "yIndex-xIndex"

    // Map of cumulative positions
    final Map<int, double> xPosMap = {};
    double cumX = 0;
    for (int i = 0; i < xSteps.length; i++) {
      xPosMap[i] = cumX;
      cumX += data.xMergeMap[xSteps[i]]!.length * unitWidth;
    }
    final Map<int, double> yPosMap = {};
    double cumY = 0;
    for (int j = 0; j < ySteps.length; j++) {
      yPosMap[j] = cumY;
      cumY += data.yMergeMap[ySteps[j]]!.length * unitHeight;
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
        for (int k = i; k <= maxX; k++) {
          width += data.xMergeMap[xSteps[k]]!.length * unitWidth;
        }
        double height = 0;
        for (int k = j; k <= maxY; k++) {
          height += data.yMergeMap[ySteps[k]]!.length * unitHeight;
        }

        islands.add(Positioned(
          left: xPosMap[i]!,
          top: yPosMap[j]!,
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: _buildIslandLayer(
              type: type,
              width: width,
              height: height,
              colorScheme: colorScheme,
            ),
          ),
        ));
      }
    }

    return islands;
  }
}

class _MatrixLayout {
  final double unitWidth;
  final double unitHeight;
  final double yVariableStripWidth;
  final double yHeaderWidth;
  final double yAxisGutterWidth;
  final double xAxisHeight;
  final bool showStepCodes;
  final bool scrollHorizontally;

  const _MatrixLayout({
    required this.unitWidth,
    required this.unitHeight,
    required this.yVariableStripWidth,
    required this.yHeaderWidth,
    required this.yAxisGutterWidth,
    required this.xAxisHeight,
    required this.showStepCodes,
    required this.scrollHorizontally,
  });
}

class _MatrixLabel extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int maxLines;
  final double minFontSize;
  final double maxFontSize;
  final TextAlign textAlign;

  const _MatrixLabel({
    required this.text,
    required this.style,
    this.maxLines = 1,
    this.minFontSize = 8,
    this.maxFontSize = 12,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth.isFinite && constraints.maxWidth > 0
            ? constraints.maxWidth
            : double.infinity;

        return FittedBox(
          fit: BoxFit.scaleDown,
          alignment: _alignmentFor(textAlign),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Text(
              text,
              style: style.copyWith(fontSize: maxFontSize),
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              textAlign: textAlign,
            ),
          ),
        );
      },
    );
  }

  Alignment _alignmentFor(TextAlign align) {
    switch (align) {
      case TextAlign.center:
        return Alignment.center;
      case TextAlign.end:
      case TextAlign.right:
        return Alignment.centerRight;
      default:
        return Alignment.centerLeft;
    }
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

/// Distinct badge for GAD konstans — centered in cell, amber border, separate from type labels.
class _GadValueBadge extends StatelessWidget {
  final String label;
  final bool compact;

  const _GadValueBadge({required this.label, required this.compact});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 3 : 5,
          vertical: compact ? 1 : 2,
        ),
        decoration: BoxDecoration(
          color: const Color(0xDD1A1A1A),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: const Color(0xFFFFB300), width: 1.5),
          boxShadow: const [
            BoxShadow(
              color: Color(0x44000000),
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: compact ? 10 : 13,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1,
            fontFeatures: const [FontFeature.tabularFigures()],
          ),
        ),
      ),
    );
  }
}
