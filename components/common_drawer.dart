// 依照文件的先期設定，設定側邊欄以及其點擊後的轉發路徑
// 引用 Flutter 的核心套件
import 'package:flutter/material.dart';

class CommonDrawer {
  /// 設置 getDrawer 靜態函數，無需建立物件，即可呼叫此方法
  /// 使用後回傳一個 Drawer，使用時必須放入 BuildContext 引數，此物是記錄 Flutter App
  /// 的頁面關聯狀態的物件
  /// 設置 Drawer，並在裡面安置 ListView，讓選項超過畫面時，仍可滑動。
  /// 為 ListView 分別置入 ListTitle，點擊時，會轉發至指定頁面
  static Drawer getDrawer(BuildContext context) {
    return Drawer(
      // 避免按鍵過多時，超出畫面而異常。使用 ListView
      child: ListView(
        // 放入 ListView 專用的
        children: [
          ListTile(
            title: const Text("Novel"),
            onTap: () {
              Navigator.pushNamed(context, "/novel-screen");
            },
          ),
          ListTile(
            title: const Text("Science"),
            onTap: () {
              Navigator.pushNamed(context, "/science-screen");
            },
          ),
          ListTile(
            title: const Text("Business"),
            onTap: () {
              Navigator.pushNamed(context, "/business-screen");
            },
          ),
          ListTile(
            title: const Text("Health"),
            onTap: () {
              Navigator.pushNamed(context, "/health-screen");
            },
          ),
        ],
      ),
    );
  }
}
