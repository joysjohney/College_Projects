package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Text;

import java.util.HashMap;
import java.util.Map;

public class Profile extends AppCompatActivity {
    TextView name,email,phone,owned;
    EditText password;
    int flag=0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);

        Button btn_home =findViewById(R.id.btn_home);
        Button btn_vehicle =findViewById(R.id.btn_vehicle);
        Button btn_about =findViewById(R.id.btn_about);
        final Button btn_change_password =findViewById(R.id.btn_change_pass);


        name=findViewById(R.id.textView_name);
        email=findViewById(R.id.textView_email);
        password=findViewById(R.id.editText_password);
        phone=findViewById(R.id.textView_phone);
        owned=findViewById(R.id.textView_owned);

        password.setFocusable(false);




        get_details();

        btn_change_password.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(flag==0)
                {
                    flag=1;
                    btn_change_password.setText("SAVE");
                    password.setFocusableInTouchMode(true);
                }
                else
                {
                    btn_change_password.setText("CHANGE");
                    flag=0;
                    change_pass();
                    password.setFocusable(false);
                }

            }
        });

        btn_home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Profile.this, MainActivity.class);
                startActivity(intent);
                finish();

            }
        });
        btn_vehicle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Profile.this, Vehicle.class);
                startActivity(intent);
                finish();

            }
        });


        btn_about.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Profile.this, About.class);
                startActivity(intent);
                finish();

            }
        });
    }



    public void get_details()
    {
        StringRequest stringRequest = new StringRequest(Request.Method.POST,GlobalVariables.URL_GET_PROFILE,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        Log.i("nnn","Response="+response);
                        try {
                            JSONObject json_obj= new JSONObject(response);
                            name.setText("Name:"+json_obj.getString("first_name"));
                            email.setText("Email: "+GlobalVariables.EMAIL);
                            password.setText(json_obj.getString("password"));
                            phone.setText("Phone :"+json_obj.getString("phone"));
                            owned.setText("VEHICLE OWNED: "+json_obj.getString("v_count"));



                        } catch (JSONException e) {
                            e.printStackTrace();
                        }



                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
//You can handle error here if you want
                    }

                }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> params = new HashMap<>();
//Adding parameters t o request

                params.put("email", GlobalVariables.EMAIL);
//returning parameter
                return params;
            }
        };
//Adding the string request to the queue
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }
    public void change_pass()
    {
        StringRequest stringRequest = new StringRequest(Request.Method.POST,GlobalVariables.URL_CHANGE_PASSWORD,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        String sts="";
                        try {
                            JSONObject json_obj= new JSONObject(response);
                            sts=json_obj.getString("status");

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        if(sts.contains("success"))
                        {
                            Toast.makeText(Profile.this,"Password Changed!", Toast.LENGTH_LONG).show();

                        }



                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
//You can handle error here if you want
                    }

                }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> params = new HashMap<>();
//Adding parameters t o request

                params.put("email", GlobalVariables.EMAIL);
                params.put("password", password.getText().toString());
//returning parameter
                return params;
            }
        };
//Adding the string request to the queue
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

}
