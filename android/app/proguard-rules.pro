# Flutter-specific rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# Keep any classes that might be used via reflection
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Application
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider

# Keep - Native methods
-keepclasseswithmembernames class * {
    native <methods>;
}

# Keep - View setters/getters
-keepclassmembers public class * extends android.view.View {
    void set*(***);
    *** get*();
}

# Keep - Keep annotation classes
-keepattributes *Annotation*

# Add these additional rules for better compatibility:

# Keep - Serializable classes
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Keep - Enum classes
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Keep - Parcelable classes
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# ========== NEW ADDED RULES ==========

# Play Core Library Rules (for Flutter deferred components)
-keep class com.google.android.play.core.** { *; }
-keep class com.google.android.play.** { *; }
-keep class com.google.android.gms.** { *; }

# Play Core specific classes mentioned in error
-keep class com.google.android.play.core.splitcompat.** { *; }
-keep class com.google.android.play.core.splitinstall.** { *; }
-keep class com.google.android.play.core.tasks.** { *; }

# Keep all Play Core related methods and fields
-keepclassmembers class com.google.android.play.core.** { *; }
-keepclassmembers class com.google.android.play.** { *; }

# Firebase (if you use Firebase)
-keep class com.google.firebase.** { *; }

# Play Core Library Rules
-keep class com.google.android.play.core.** { *; }
-keep class com.google.android.play.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class com.google.android.play.core.splitcompat.** { *; }
-keep class com.google.android.play.core.splitinstall.** { *; }
-keep class com.google.android.play.core.tasks.** { *; }