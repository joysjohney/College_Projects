package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;

import java.io.File;
import java.security.MessageDigest;
import java.util.Timer;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;


public class ViewQr extends AppCompatActivity {
    public final static int QRcodeWidth = 500 ;
    Bitmap bitmap_qr;
    ImageView img_qr;
    Timer timer=new Timer();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_qr);

        img_qr=findViewById(R.id.imageViewQr);
        Button dowload=findViewById(R.id.buttonDownloadQR);



        try{

            String data=GlobalVariables.EMAIL+","+GlobalVariables.REG_NO;


            String encrypted_data=encrypt(data, "noufal");

            bitmap_qr= TextToImageEncode(encrypted_data);



            img_qr.setImageBitmap(bitmap_qr);


        } catch (Exception e) {
            e.printStackTrace();
        }

        dowload.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    Uri tempUri = getImageUri(getApplicationContext(), bitmap_qr);
                    String picturePath= new File(getRealPathFromURI(tempUri)).getPath();
                    Log.i("nnn","path"+picturePath);
                    Toast.makeText(getApplicationContext(), "Success! \n"+picturePath, Toast.LENGTH_SHORT).show();
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });


    }


    public Uri getImageUri(Context inContext, Bitmap inImage) {
        String path = MediaStore.Images.Media.insertImage(inContext.getContentResolver(), inImage, GlobalVariables.REG_NO+"QR", null);
        return Uri.parse(path);
    }
    public String getRealPathFromURI(Uri uri) {
        String path = "";
        if (getContentResolver() != null) {
            Cursor cursor = getContentResolver().query(uri, null, null, null, null);
            if (cursor != null) {
                cursor.moveToFirst();
                int idx = cursor.getColumnIndex(MediaStore.Images.ImageColumns.DATA);
                path = cursor.getString(idx);
                cursor.close();
            }
        }
        return path;
    }


    Bitmap TextToImageEncode(String Value) throws WriterException {
        BitMatrix bitMatrix;
        try {
            bitMatrix = new MultiFormatWriter().encode(
                    Value,
                    BarcodeFormat.DATA_MATRIX.QR_CODE,
                    QRcodeWidth, QRcodeWidth, null
            );

        } catch (IllegalArgumentException Illegalargumentexception) {

            return null;
        }


        int bitMatrixWidth = bitMatrix.getWidth();

        int bitMatrixHeight = bitMatrix.getHeight();

        int[] pixels = new int[bitMatrixWidth * bitMatrixHeight];

        for (int y = 0; y < bitMatrixHeight; y++) {
            int offset = y * bitMatrixWidth;

            for (int x = 0; x < bitMatrixWidth; x++) {

                pixels[offset + x] = bitMatrix.get(x, y) ?
                        getResources().getColor(R.color.Black) : getResources().getColor(R.color.White);
            }
        }
        Bitmap bitmap = Bitmap.createBitmap(bitMatrixWidth, bitMatrixHeight, Bitmap.Config.ARGB_4444);

        bitmap.setPixels(pixels, 0, 500, 0, 0, bitMatrixWidth, bitMatrixHeight);
        return bitmap;
    }




    private String encrypt(String user, String pass) throws Exception
    {
        SecretKeySpec k=gen(pass);
        Cipher cipher=Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE,k);
        byte[] en=cipher.doFinal(user.getBytes());
        String vall= Base64.encodeToString(en,Base64.DEFAULT);
        return vall;

    }

    private SecretKeySpec gen(String pass) throws Exception {
        final MessageDigest di= MessageDigest.getInstance("SHA-256");
        byte[] bytes=pass.getBytes("UTF-8");
        di.update(bytes,0,bytes.length);
        byte[] key=di.digest();
        SecretKeySpec secretKeySpec=new SecretKeySpec(key,"SHA");
        return secretKeySpec;

    }


}
