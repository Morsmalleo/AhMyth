# AhMyth Android Client - Testing Procedure

## Overview
This document outlines the testing procedures for the updated AhMyth Android client after implementing:
- Android SDK updates (compileSdkVersion 34, targetSdkVersion 34)
- Dependency updates to latest secure versions
- Migration from Android Support Library to AndroidX
- Network Security Configuration implementation
- Electron server dependency updates
- GitHub Actions workflow fixes

## Prerequisites
- Android Studio Flamingo | 2022.2.1 or newer
- Android SDK Platform 34
- Android SDK Build-Tools 34.0.0
- JDK 17 (required for Gradle 8.x)
- Android Emulator or physical device (API 21+ for testing)

## Build Verification

### 1. Gradle Sync Verification
1. Open the project in Android Studio
2. Wait for Gradle sync to complete
3. Verify no sync errors appear in the "Build" tab
4. Confirm build.gradle shows:
   - `compileSdkVersion 34`
   - `buildToolsVersion "34.0.0"`
   - `minSdkVersion 21`
   - `targetSdkVersion 34`
   - AndroidX dependencies (no `android.support.*` imports)
   - Updated libraries:
     - AppCompat: 1.6.1
     - Material Components: 1.10.0
     - Socket.IO Client: 1.0.0
     - OkHttp: 4.12.0
     - Gson: 2.10.1
     - Glide: 4.15.1
     - Lifecycle: 2.6.2

### 2. Dependency Validation
Run: `./gradlew dependencies --configuration compileClasspath`
Verify:
- No `com.android.support` dependencies
- All AndroidX libraries present at correct versions
- No jcenter() repositories (should use google() and mavenCentral())

### 3. Build Variants Testing
Successfully build each variant:
- `./gradlew assembleDebug`
- `./gradlew assembleRelease`
- `./gradlew build`

## Runtime Testing

### 4. Network Security Configuration Verification
Verify network security is properly configured:
1. Install debug APK on emulator/device (API 21+)
2. Monitor network traffic using:
   - Android Studio Profiler
   - Charles Proxy / Wireshark (for HTTP/HTTPS analysis)
   - Logcat for security policy violations (`NetworkSecurityConfig`)
3. Test that cleartext HTTP requests are blocked (unless in debug mode with overrides)
4. Test HTTPS connections to known good endpoints

### 5. Functional Testing
Test core functionality still works:
1. App launches successfully
2. Permissions request properly (Camera, Location, SMS, etc.)
3. Background service starts and maintains connection
4. SMS interception and sending functions work
5. Call logging functionality operates correctly
6. Contact access works as expected
7. Camera/microphone access functional (if applicable)
8. Device admin features working
9. Network communication functional (when using HTTPS)

### 6. Security Validation
1. **Permission Review**: Confirm all requested permissions are necessary for functionality
2. **Network Security**: Verify `android:networkSecurityConfig="@xml/network_security_config"` is in AndroidManifest.xml
3. **Cleartext Traffic**: Ensure `usesCleartextTraffic` is NOT set to true in application tag
4. **Backup Configuration**: Validate `android:allowBackup="true"` is appropriate for use case
5. **Export Settings**: Check services/receivers have appropriate `android:exported` values
6. **Debuggable**: Ensure debuggable is false in release builds

### 7. Unit and Instrumentation Tests
Run existing tests to ensure nothing is broken:
- `./gradlew test` (unit tests)
- `./gradlew connectedAndroidTest` (instrumentation tests on connected device/emulator)

## Verification Checklist

### Build Configuration
- [ ] Gradle sync completes without errors
- [ ] Compile SDK version is 34
- [ ] Target SDK version is 34
- [ ] Min SDK version is 21
- [ ] Build tools version is 34.0.0
- [ ] No `android.support.*` dependencies remain
- [ ] All dependencies updated to secure versions
- [ ] Gradle wrapper updated to 8.5+
- [ ] Java compatibility set to version 17

### Code Quality
- [ ] All `android.support.*` imports replaced with `androidx.*` equivalents
- [ ] No lint errors related to deprecated APIs
- [ ] Proper use of AndroidX libraries
- [ ] ViewBinding enabled
- [ ] Kotlin/JVM target set to 17

### Security Features
- [ ] Network Security Configuration XML created at `res/xml/network_security_config.xml`
- [ ] AndroidManifest.xml references the network security config
- [ ] Cleartext traffic disabled by default (`cleartextTrafficPermitted="false"`)
- [ ] System certificates trusted
- [ ] Debug overrides properly isolated (would be removed in production builds)
- [ ] Dangerous permissions reviewed and minimized where possible
- [ ] Services/receivers have appropriate exported settings

### Functionality
- [ ] Application installs successfully on API 21+ devices
- [ ] Core features (SMS, calls, contacts, camera, location, microphone) functional
- [ ] Background service operational
- [ ] Network connectivity functional (when using HTTPS)
- [ ] Device admin features working
- [ ] Permission flows work correctly

## Troubleshooting

### Common Issues
1. **"Failed to resolve: androidx.*"**
   - Solution: Ensure Google() and MavenCentral() repositories are configured
   
2. **"Manifest merger failed"**
   - Solution: Check for manifest merging issues, especially around `usesCleartextTraffic` vs network security config
   
3. **"Duplicate class" errors**
   - Solution: Check for duplicate dependencies or conflicting versions
   
4. **Runtime NetworkSecurityException**
   - Solution: Verify network security config is correctly formatted and referenced
   
5. **Gradle version conflicts**
   - Solution: Ensure Gradle wrapper matches Android Gradle Plugin version

### Java/Kotlin Issues
- **"Unsupported class version"**
  - Solution: Ensure JDK 17 is installed and JAVA_HOME is set correctly
  
- **"kotlin-reflect not found"**
  - Solution: Ensure Kotlin Gradle plugin is compatible with AGP version

## Performance Benchmarks
Compare APK metrics before and after updates:
- Compare `app-debug.apk` file size
- Compare method count (should be similar or improved with ProGuard/R8)
- Test app startup time
- Monitor memory usage during typical operations

## Sign-off
Tested by: _________________________
Date: _________________________
Build Variant: _________________
Device/Emulator API Level: __________
Notes: ________________________________________________________
