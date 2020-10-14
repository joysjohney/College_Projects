package com.mtlz.qetc;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
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
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.util.ArrayList;

import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class AddVehicle extends AppCompatActivity {
    ImageView img_front,img_back,current_img,img_rc;
    TextView reg_number,owner_name,chasis_number;
    Spinner spinner_type;
    ProgressDialog progressDialog;
    int img_flag=0;
    //Uri to store the image uri
    Uri filePath;
    String FilePath1,FilePath2;
    String class_of_vehicle="CAR";
    Sms sms;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_vehicle);

        progressDialog = new ProgressDialog(this);
        progressDialog.setMessage("Uploading...");

        reg_number=findViewById(R.id.editTextVehicleReg);
        owner_name=findViewById(R.id.editText_owner);
        chasis_number=findViewById(R.id.editText_ch_no);


        Button generate_qr=findViewById(R.id.btn_generate_qr);
        img_front=findViewById(R.id.imageViewFront);
        img_back=findViewById(R.id.imageViewBack);
        img_rc=findViewById(R.id.imageViewRC);
        spinner_type = findViewById(R.id.spinner_vehicle_class);

        ArrayList<String> arrayList = new ArrayList<>();
        arrayList.add("Car, Jeep, Van");
        arrayList.add("Light Commercial Vehicle (LCV)");
        arrayList.add("Bus, Truck");
        arrayList.add("Multi axle");
        ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>(this,android.R.layout.simple_spinner_item, arrayList);
        arrayAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner_type.setAdapter(arrayAdapter);

        img_front.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                current_img=img_front;
                selectImage(AddVehicle.this);
            }
        });

        img_back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                current_img=img_back;
                selectImage(AddVehicle.this);
            }
        });


        img_rc.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                current_img=img_rc;
                selectImage(AddVehicle.this);
            }
        });


        spinner_type.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                class_of_vehicle = parent.getItemAtPosition(position).toString();


            }
            @Override
            public void onNothingSelected(AdapterView <?> parent) {
            }
        });

        generate_qr.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.i("nnn","Class "+class_of_vehicle);
                Log.i("nnn","Uses "+GlobalVariables.EMAIL);


                uploadMultipleFiles();
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

                        if(current_img==img_front)
                        {
                            FilePath1=picturePath;
                        }
                        else if(current_img==img_back)
                        {
                            FilePath2=picturePath;
                        }


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


                                if(current_img==img_front)
                                {
                                    FilePath1=picturePath;

                                    Log.i("nnn","Front !"+picturePath);
                                }
                                else if(current_img==img_back)
                                {
                                    FilePath2=picturePath;
                                    Log.i("nnn","Back !"+picturePath);
                                }


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
    private void uploadMultipleFiles() {
        //  progressDialog.show();


        Log.i("nnn", "Path1= " + FilePath1);
        Log.i("nnn", "Path2= " + FilePath2);

        String reg = reg_number.getText().toString();
        String ownr_name = owner_name.getText().toString();
        String ch_no= chasis_number.getText().toString();

        GlobalVariables.REG_NO=reg;



        if (reg.isEmpty()|| ownr_name.isEmpty()|| ch_no.isEmpty()) {
            Toast.makeText(AddVehicle.this, "Fill all fields!", Toast.LENGTH_SHORT).show();

        } else
        {
            if (FilePath1 != null && FilePath2 != null ) {
                Log.i("nnn", "OK");

                // Map is used to multipart the file using okhttp3.RequestBody
                File file1 = new File(FilePath1);
                File file2 = new File(FilePath2);

                // Parsing any Media type file
                RequestBody requestBody1 = RequestBody.create(MediaType.parse("*/*"), file1);
                RequestBody requestBody2 = RequestBody.create(MediaType.parse("*/*"), file2);

                MultipartBody.Part fileToUpload1 = MultipartBody.Part.createFormData("file1", file1.getName(), requestBody1);
                MultipartBody.Part fileToUpload2 = MultipartBody.Part.createFormData("file2", file2.getName(), requestBody2);

                ApiConfig getResponse = AppConfig.getRetrofit().create(ApiConfig.class);
                Call<ServerResponse> call = getResponse.uploadMulFile(fileToUpload1, fileToUpload2, GlobalVariables.EMAIL, reg, ownr_name,ch_no, class_of_vehicle);
                call.enqueue(new Callback<ServerResponse>() {
                    @Override
                    public void onResponse(Call<ServerResponse> call, Response<ServerResponse> response) {
                        ServerResponse serverResponse = response.body();



                        if (serverResponse != null) {
                            if (serverResponse.getSuccess()) {

                                sms = new Sms(AddVehicle.this);
                                sms.send(GlobalVariables.PHONE, "Dear " + GlobalVariables.user + ", The QR Code tag for your vehicle "+GlobalVariables.REG_NO+ " has been generated. Please visit your RTO office for obtaining and activation of your tag.");


                                Toast.makeText(getApplicationContext(), serverResponse.getMessage(), Toast.LENGTH_SHORT).show();
                                Log.i("nnn", "Response1: "+serverResponse.getMessage());
                                Intent intent = new Intent(AddVehicle.this, ViewQr.class);
                                startActivity(intent);
                                finish();

                            } else {
                                Toast.makeText(getApplicationContext(), serverResponse.getMessage(), Toast.LENGTH_SHORT).show();
                                Log.i("nnn", "Response2: "+serverResponse.getMessage());
                            }
                        } else {
                            assert serverResponse != null;
                            Log.i("nnn", "Response3: "+serverResponse.getMessage());
                        }
                        progressDialog.dismiss();
                    }

                    @Override
                    public void onFailure(Call<ServerResponse> call, Throwable t) {
                        Log.i("nnn", "Failed");
                        Log.i("nnn","Response "+t.getMessage());
                    }
                });


            } else {
                Toast.makeText(AddVehicle.this, "Choose images!", Toast.LENGTH_SHORT).show();
            }

        }



    }





}
