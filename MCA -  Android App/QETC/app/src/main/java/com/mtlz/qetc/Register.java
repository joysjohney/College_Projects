package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.util.Patterns;
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

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class Register extends AppCompatActivity {

   EditText first_name,last_name,email,password,conpassword,phone;
    Sms sms;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);


        Button signup = findViewById(R.id.btn_reg);
        Button cancel = findViewById(R.id.btn_cancel);

        first_name = findViewById(R.id.txt_first_name);
        last_name = findViewById(R.id.txt_last_name);
        email = findViewById(R.id.txt_email);
        password = findViewById(R.id.txt_password1);
        conpassword = findViewById(R.id.txt_password2);
        phone = findViewById(R.id.txt_phone);


        cancel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Register.this, Login.class);
                startActivity(intent);
                finish();
            }
        });

        signup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(!email.getText().toString().equals(" "))
                {
                    if(Patterns.EMAIL_ADDRESS.matcher(email.getText().toString()).matches() )
                    {
                        Toast.makeText(Register.this, "Email is VALID.", Toast.LENGTH_SHORT).show();

                    }
                    else
                    {
                        Toast.makeText(Register.this, "Email is INVALID.", Toast.LENGTH_SHORT).show();
                    }
                }
                else
                {
                    Toast.makeText(Register.this, "Email is Needed.", Toast.LENGTH_SHORT).show();
                }
                if((first_name.getText().toString().isEmpty())||(email.getText().toString().isEmpty())||(password.getText().toString().isEmpty())||(conpassword.getText().toString().isEmpty())||(phone.getText().toString().isEmpty()))
                {
                    Toast.makeText(Register.this,"All Fields are Mandatory!", Toast.LENGTH_SHORT).show();
                }
                else if(!(password.getText().toString()).equals(conpassword.getText().toString()))
                {
                    Toast.makeText(Register.this, "Password Miss Matched", Toast.LENGTH_SHORT).show();
                }
                else
                {
                    Register();
                }

            }
        });
    }

    public void Register() {
        StringRequest stringRequest = new StringRequest(Request.Method.POST, GlobalVariables.URL_REG,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
//If we are getting success from server
                        Log.i("nnn","Respons" +response);
                        String status="0";
                        try {
                            JSONObject json_obj= new JSONObject(response);
                            status=json_obj.getString("status");

                            if(status.contains("registration successful")) {

                                sms = new Sms(Register.this);
                                sms.send(phone.getText().toString(), "Dear " + first_name.getText().toString() + ", thank you for registering with QRToll App");
                                Intent intent = new Intent(Register.this, Login.class);
                                startActivity(intent);
                                finish();


                            }

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }




                        Toast.makeText(Register.this, status, Toast.LENGTH_SHORT).show();

                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {
//You can handle error here if you want
                    }

                }) {
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String, String> params = new HashMap<>();
//Adding parameters to request
                params.put("first_name", first_name.getText().toString());
                params.put("last_name", last_name.getText().toString());
                params.put("email", email.getText().toString());
                params.put("password",password.getText().toString());
                params.put("phone", phone.getText().toString());
                params.put("amount", "0");
                params.put("status", "0");
//returning parameter
                return params;
            }
        };
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }



}
