package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.squareup.picasso.Picasso;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class ViewVehicle extends AppCompatActivity {

    TextView class_of_vehicle,reg_no_view,owner_name_view,chasis_no_view;
    ImageView img_rc,img_front,img_back,current_img,img_driver,img_licence;
Sms sms;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view_vehicle);


        reg_no_view=findViewById(R.id.textViewVehicleReg);
        owner_name_view=findViewById(R.id.textViewVehicleOwner);
        chasis_no_view=findViewById(R.id.textViewVehicleChasis);
        class_of_vehicle=findViewById(R.id.textViewVehicleClass);



        img_front=findViewById(R.id.imageViewFront);
        img_back=findViewById(R.id.imageViewBack);


        Button btn_delete=findViewById(R.id.button_delete);
        Button btn_view_qr=findViewById(R.id.buttonViewQR);




        getData();


        btn_view_qr.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(ViewVehicle.this, ViewQr.class);
                startActivity(intent);
            }
        });
        btn_delete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {


                delete_vehicle();

            }
        });



    }




    private void getData()
    {

        String url = GlobalVariables.URL_GET_VEHICLE_DETAILS+GlobalVariables.REG_NO;



        Log.i("nnn", "url="+url);
        StringRequest stringRequest = new StringRequest(url, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                parseJsonData(response);

            }
        },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(ViewVehicle.this, error.getMessage(), Toast.LENGTH_LONG).show();
                    }
                });

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    public void parseJsonData(String response) {
        Log.i("nnnn", "Response"+response);
        try {
            // Create the root JSONObject from the JSON string.

            JSONObject jsonRootObject = new JSONObject(response);

            //Get the instance of JSONArray that contains JSONObjects
            JSONArray jsonArray = jsonRootObject.optJSONArray("Result");


            for (int i = 0; i < jsonArray.length(); i++)
            {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                String reg_no = jsonObject.optString("reg_no");
                String owner_name = jsonObject.optString("owner_name");
                String chasis_no = jsonObject.optString("chasis_no");
                String v_class = jsonObject.optString("type");
                String front_photo = jsonObject.optString("front_photo");
                String back_photo = jsonObject.optString("back_photo");


                reg_no_view.setText(reg_no);
                owner_name_view.setText(owner_name);
                chasis_no_view.setText(chasis_no);
                class_of_vehicle.setText(v_class);

                String imageUri;
                imageUri = GlobalVariables.host+front_photo;
                Picasso.with(ViewVehicle.this).load(imageUri).into(img_front);
                imageUri = GlobalVariables.host+back_photo;
                Picasso.with(ViewVehicle.this).load(imageUri).into(img_back);



            }

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }




    private void delete_vehicle()
    {

        String url = GlobalVariables.URL_DELETE_VEHICLE+GlobalVariables.REG_NO;

        Log.i("nnn", "url="+url);
        StringRequest stringRequest = new StringRequest(url, new Response.Listener<String>() {

            @Override
            public void onResponse(String response) {
                Log.i("nnn","Response"+response);
                sms = new Sms(ViewVehicle.this);
                sms.send(GlobalVariables.PHONE, "Dear " + GlobalVariables.user + ", you have deleted the QR Code Tag for your vehicle"+GlobalVariables.REG_NO+ "from our system. Please note that the tag will become ineffective with in 2 minutes. \n" +
                        "If you havent done this , please visit your RTO immediately or register a complaint to the nearest police station.");

                Toast.makeText(ViewVehicle.this,response, Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(ViewVehicle.this, Vehicle.class);
                startActivity(intent);
                finish();

            }
        },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
                        Toast.makeText(ViewVehicle.this, error.getMessage(), Toast.LENGTH_LONG).show();
                    }
                });

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }
}
