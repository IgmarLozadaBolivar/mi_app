import 'package:flutter/cupertino.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LiquidGlassWidgets.initialize();

  runApp(LiquidGlassWidgets.wrap(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.systemBlue,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(fontFamily: 'ZonaPro'),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

int _selectedIndex = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final isDarkMode = CupertinoTheme.of(context).brightness == Brightness.dark;

    // Recibe 2 argumentos { navigationBar (Barra superior) y Child (Cuerpo de la pantalla) }
    return GlassScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              // --- BARRA SUPERIOR ---
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(22.5),
                    child: Image.network(
                      'https://www.tapback.co/api/avatar.webp',
                      width: 45,
                      height: 45,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hello, Sandra',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'Today 25 Nov.',
                        style: TextStyle(
                          color: CupertinoColors.darkBackgroundGray,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  GlassButton(
                    stretch: 0.2,
                    width: 45,
                    height: 45,
                    icon: Icon(
                      CupertinoIcons.search,
                      size: 20,
                      color: CupertinoColors.darkBackgroundGray,
                    ),
                    onTap: () {},
                  ),
                ],
              ),

              // --- CUERPO ---
              SizedBox(height: 20.0),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     CupertinoListSection.insetGrouped(
              //       margin: EdgeInsets.symmetric(
              //         horizontal: 16.0,
              //         vertical: 8.0,
              //       ),
              //       additionalDividerMargin: 0.0,
              //       children: [
              //         CupertinoListTile.notched(
              //           title: Text('Emotional Balance'),
              //           subtitle: Text('Emotional Balance'),
              //           trailing: const CupertinoListTileChevron(),
              //           onTap: () {
              //             // Acción estática
              //           },
              //         ),
              //       ],
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),

      // --- BARRA DE NAVEGACIÓN ---
      bottomBar: GlassBottomBar(
        indicatorColor: CupertinoColors.systemGrey5,
        barBorderRadius: 40,
        barHeight: 80,
        tabs: [
          GlassBottomBarTab(icon: Icon(CupertinoIcons.home)),
          GlassBottomBarTab(icon: Icon(CupertinoIcons.square_grid_2x2)),
          GlassBottomBarTab(icon: Icon(CupertinoIcons.chart_bar_square)),
          GlassBottomBarTab(icon: Icon(CupertinoIcons.person)),
        ],
        selectedIndex: _selectedIndex,
        onTabSelected: (index) {},
      ),
    );
  }
}
