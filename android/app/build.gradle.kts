import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(keystorePropertiesFile.inputStream())
}

android {
    namespace = "com.example.online_groceries_app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.online_groceries_app"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        create("release") {
            val keyAlias: String? = keystoreProperties["keyAlias"]?.toString()
            val keyPassword: String? = keystoreProperties["keyPassword"]?.toString()
            val storeFilePath: String? = keystoreProperties["storeFile"]?.toString()
            val storePassword: String? = keystoreProperties["storePassword"]?.toString()

            if (storeFilePath != null) {
                storeFile = file(storeFilePath)
            }
            this.keyAlias = keyAlias
            this.keyPassword = keyPassword
            this.storePassword = storePassword
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("release")
        }
    }
    flavorDimensions += "app"
    productFlavors {
        create("dev") {
            dimension = "app"
            resValue(
                type = "string",
                name = "app_name",
                value = "Online Groceries App Dev")
            applicationIdSuffix = ".dev"
        }
        create("staging") {
            dimension = "app"
            resValue(
                type = "string",
                name = "app_name",
                value = "Online Groceries Stg")
            applicationIdSuffix = ".staging"
        }
        create("prod") {
            dimension = "app"
            resValue(
                type = "string",
                name = "app_name",
                value = "Online Groceries App")
        }
    }
}

flutter {
    source = "../.."
}
