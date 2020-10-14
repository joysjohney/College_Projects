package com.mtlz.qetc;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Bundle;
import android.provider.MediaStore;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import java.io.File;

public class Issue extends AppCompatActivity {
    ImageView img_visual,current_img;
    Uri filePath;
    Sms sms;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_issue);
        final EditText head=findViewById(R.id.editText_head);
        final EditText loc=findViewById(R.id.editText_loc);
        final EditText com=findViewById(R.id.editText_comment);
        head.setText(GlobalVariables.ISSUE_HEAD);

        img_visual=findViewById(R.id.imageViewVisual);

        Button submit=findViewById(R.id.buttonSubmit);
        submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String head_txt =head.getText().toString();
                String loc_txt = loc.getText().toString();
                String com_txt = com.getText().toString();


                if(head_txt.isEmpty()|| loc_txt.isEmpty()||com_txt.isEmpty())
                {
                    Toast.makeText(Issue.this, "Fill All !", Toast.LENGTH_SHORT).show();
                }

                else if (filePath == null  )
                {
                    Toast.makeText(Issue.this, "Choose Image !", Toast.LENGTH_SHORT).show();
                }
                else
                {
                    Toast.makeText(Issue.this, "Submitted !", Toast.LENGTH_SHORT).show();
                    sms = new Sms(Issue.this);
                    sms.send(GlobalVariables.PHONE, "Dear " + GlobalVariables.user + ", thank you for submitting the issue with NHAI. NHAI will validate and take appropiate actions. Wishing you a safe Journey");
                    Intent intent = new Intent(Issue.this, MainActivity.class);
                    startActivity(intent);
                    finish();

                }

            }
        });

        img_visual.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                current_img=img_visual;
                selectImage(Issue.this);
            }
        });

    }

    private void selectImage(Context context) {
        final CharSequence[] options = {"Take Photo", "Choose from Gallery", "Cancel"};

        AlertDialog.Builder builder = new AlertDialog.Builder(context);
        builder.setTitle("Choose Picture");

        builder.setItems(options, new DialogInterface.OnClickListener() {

            @Override
            public void onClick(DialogInterface dialog, int item) {

                if (options[item].equals("Take Photo")) {
                    Intent takePicture = new Intent(android.provider.MediaStore.ACTION_IMAGE_CAPTURE);
                    startActivityForResult(takePicture, 0);

                } else if (options[item].equals("Choose from Gallery")) {
                    Intent pickPhoto = new Intent(Intent.ACTION_PICK, android.provider.MediaStore.Images.Media.EXTERNAL_CONTENT_URI);
                    startActivityForResult(pickPhoto, 1);//one can be replaced with any action code

                } else if (options[item].equals("Cancel")) {
                    dialog.dismiss();
                }
            }
        });
        builder.show();
    }


    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != RESULT_CANCELED) {
            switch (requestCode) {
                case 0:
                    if (resultCode == RESULT_OK && data != null) {
                        Bitmap selectedImage = (Bitmap) data.getExtras().get("data");
                        current_img.setImageBitmap(selectedImage);
                        Uri tempUri = getImageUri(getApplicationContext(), selectedImage);

                        String picturePath= new File(getRealPathFromURI(tempUri)).getPath();



                        Log.i("nnn", "111"+picturePath );
                    }

                    break;
                case 1:
                    if (resultCode == RESULT_OK && data != null) {

                        filePath = data.getData();
                        Log.i("nnn", "222");

                        Uri selectedImage = data.getData();
                        String[] filePathColumn = {MediaStore.Images.Media.DATA};
                        if (selectedImage != null) {
                            Cursor cursor = getContentResolver().query(selectedImage,
                                    filePathColumn, null, null, null);
                            if (cursor != null) {
                                cursor.moveToFirst();


                                int columnIndex = cursor.getColumnIndex(filePathColumn[0]);
                                String picturePath = cursor.getString(columnIndex);


                                current_img.setImageBitmap(BitmapFactory.decodeFile(picturePath));
                                cursor.close();
                            }
                        }

                    }
                    break;
            }
        }
    }



    public Uri getImageUri(Context inContext, Bitmap inImage) {
        String path = MediaStore.Images.Media.insertImage(inContext.getContentResolver(), inImage, "VFD", null);
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




}
