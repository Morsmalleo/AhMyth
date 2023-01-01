-keep public class * extends android.app.Activity
-keep public class * extends android.app.Service
-keep public class * extends android.content.MyReceiver
-keep class ahmyth.mine.king.ahmyth.MainService {

    public static <methods>;

}

-keep class ahmyth.mine.king.ahmyth.ConnectionManager {

    public static <methods>;

}

-optimizationpasses 5

-verbose
