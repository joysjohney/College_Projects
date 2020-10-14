package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.util.Patterns;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
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

public class Login extends AppCompatActivity {
    EditText lpswd,lmail;
    Sms sms;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);


        lmail = findViewById(R.id.txt_login_email);
        lpswd = findViewById(R.id.txt_login_password);

        Button login =findViewById(R.id.btn_login);
        Button signup=findViewById(R.id.btn_new_sign_up);
        Button forgot= findViewById(R.id.btn_forgot);


        login.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(!lmail.getText().toString().equals(" "))
                {
                    if(Patterns.EMAIL_ADDRESS.matcher(lmail.getText().toString()).matches() )
                    {
                        Toast.makeText(Login.this, "Email is VALID.", Toast.LENGTH_SHORT).show();

                    }
                    else
                    {
                        Toast.makeText(Login.this, "Email is INVALID.", Toast.LENGTH_SHORT).show();
                    }
                }
                else
                {
                    Toast.makeText(Login.this, "Email is Needed.", Toast.LENGTH_SHORT).show();
                }
                if((lmail.getText().toString().isEmpty())||(lpswd.getText().toString().isEmpty()))
                {
                    Toast.makeText(Login.this,"All fields are Mandatory!", Toast.LENGTH_SHORT).show();
                }
                else
                {
                    login();
                }
            }
        });
        signup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent  intent = new Intent(Login.this, Register.class);
                startActivity(intent);

            }
        });
        forgot.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if(!lmail.getText().toString().equals(" "))
                {
                    if(Patterns.EMAIL_ADDRESS.matcher(lmail.getText().toString()).matches() )
                    {
                        Toast.makeText(Login.this, "Email is VALID.", Toast.LENGTH_SHORT).show();

                    }
                    else
                    {
                        Toast.makeText(Login.this, "Email is INVALID.", Toast.LENGTH_SHORT).show();
                    }
                }
                else
                {
                    Toast.makeText(Login.this, "Email is Needed.", Toast.LENGTH_SHORT).show();
                }
                if((lmail.getText().toString().isEmpty()))
                {
                    Toast.makeText(Login.this,"Email is Mandatory!", Toast.LENGTH_SHORT).show();
                }
                else
                {
                    forgot();
                }
            }
        });
    }

    public void login()
    {
        StringRequest stringRequest = new StringRequest(Request.Method.POST,GlobalVariables.URL_LOGIN,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.i("nnn","Login");

                        Log.i("nnn","Response="+response);
//If we are getting success from server
                        String sts="",phone1="";
                        try {
                            JSONObject json_obj= new JSONObject(response);
                            sts=json_obj.getString("status");
                           phone1=json_obj.getString("phone");
                           GlobalVariables.user=json_obj.getString("user");

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        if(sts.contains("login successful"))
                        {
                            GlobalVariables.EMAIL=lmail.getText().toString();
                            GlobalVariables.PHONE=phone1;
                            Toast.makeText(Login.this, sts, Toast.LENGTH_SHORT).show();
                            Intent intent = new Intent(Login.this, MainActivity.class);
                            startActivity(intent);


                            finish();
                        }

                        else

                        {

                            Toast.makeText(Login.this,"Invalid Login",Toast.LENGTH_SHORT).show();
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

                params.put("email", lmail.getText().toString());
                params.put("password",lpswd.getText().toString());
//returning parameter
                return params;
            }
        };
//Adding the string request to the queue
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    public void forgot()
    {
        StringRequest stringRequest = new StringRequest(Request.Method.POST,GlobalVariables.URL_FORGOT,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.i("nnn","Login");

                        Log.i("nnn","Response="+response);
//If we are getting success from server
                        String sts="",phone1="",pass1="";
                        try {
                            JSONObject json_obj= new JSONObject(response);
                            sts=json_obj.getString("status");
                            phone1=json_obj.getString("phone");
                            pass1=json_obj.getString("pass");
                            GlobalVariables.user=json_obj.getString("user");

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        if(sts.contains("successful"))
                        {
                            GlobalVariables.EMAIL=lmail.getText().toString();
                            GlobalVariables.PHONE=phone1;
                            GlobalVariables.PASS=pass1;
                            sms = new Sms(Login.this);
                            sms.send(GlobalVariables.PHONE, "Dear " + GlobalVariables.user + ", As per your request  your password is ' "+GlobalVariables.PASS+" ' Please change password after logging in");
                            Toast.makeText(Login.this, sts, Toast.LENGTH_SHORT).show();
                            Intent intent = new Intent(Login.this, Login.class);
                            startActivity(intent);


                            finish();
                        }

                        else

                        {

                            Toast.makeText(Login.this,"Can't Retrive * Sign Up",Toast.LENGTH_SHORT).show();
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

                params.put("email", lmail.getText().toString());
//returning parameter
                return params;
            }
        };
//Adding the string request to the queue
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }




}
