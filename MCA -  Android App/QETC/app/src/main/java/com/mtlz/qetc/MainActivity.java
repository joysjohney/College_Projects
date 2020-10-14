package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
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

public class MainActivity extends AppCompatActivity {
    private ProgressDialog progress;
    TextView balance_amt_disp;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        balance_amt_disp=findViewById(R.id.balance_view);
        get_data();
        Button logout =findViewById(R.id.btn_logout);
        Button btn_add_fund =findViewById(R.id.btn_add_fund);

        Button btn_near_by =findViewById(R.id.near_by_btn);

        Button btn_bnk =findViewById(R.id.btn_bank);
        Button btn_report_issue =findViewById(R.id.btn_report_issue);
        Button btn_energency =findViewById(R.id.btn_emergency);

        Button btn_feedback =findViewById(R.id.buttonFeedback);
        Button btn_summary =findViewById(R.id.buttonSummary);


        Button btn_vehicle =findViewById(R.id.btn_vehicle);
        Button btn_about =findViewById(R.id.btn_about);
        Button btn_profile =findViewById(R.id.btn_profile);


        btn_summary.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, Summary.class);
                startActivity(intent);
                finish();

            }
        });


        btn_feedback.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, Feedback.class);
                startActivity(intent);

            }
        });



        btn_add_fund.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, Recharge.class);
                startActivity(intent);
                finish();
            }
        });



        btn_energency.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, Emergency.class);
                startActivity(intent);
                finish();
            }
        });


        logout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(MainActivity.this, Login.class);
                startActivity(intent);
                finish();
            }
        });

        btn_near_by.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(MainActivity.this, NearBy.class);
                startActivity(intent);
                finish();

            }
        });

        btn_bnk.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(MainActivity.this, Bank.class);
                startActivity(intent);
                finish();

            }
        });

        btn_report_issue.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(MainActivity.this, ReportIssue.class);
                startActivity(intent);
                finish();
            }
        });





        btn_vehicle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(MainActivity.this, Vehicle.class);
                startActivity(intent);

            }
        });

        btn_profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(MainActivity.this, Profile.class);
                startActivity(intent);

            }
        });
        btn_about.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(MainActivity.this, About.class);
                startActivity(intent);

            }
        });

    }


    public void get_data()
    {

        progress=new ProgressDialog(this);
        progress.setMessage("Please Wait..");
        progress.show();

        StringRequest stringRequest = new StringRequest(Request.Method.POST,GlobalVariables.URL_GET_BALANCE,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        progress.hide();
//If we are getting success from server
                        Log.i("nnn",response);
                        String balance="";
                        try {
                            JSONObject json_obj= new JSONObject(response);
                            balance=json_obj.getString("amount");
                            Log.i("nnn","STS="+balance);

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        if(response.contains("amount"))
                        {
                            Log.i("nnn","Success");
                            try{
                                GlobalVariables.BALANCE=Double.parseDouble(balance);
                                balance_amt_disp.setText(balance);

                            } catch (Exception e) {
                                e.printStackTrace();
                            }

                            // Intent intent = new Intent(Login.this, Balance.class);
                            // startActivity(intent);
                        }

                        else

                        {
                            Log.i("nnn","Error");
                            Toast.makeText(MainActivity.this,"Error",Toast.LENGTH_SHORT).show();
                        }

                    }
                },
                new Response.ErrorListener() {

                    @Override
                    public void onErrorResponse(VolleyError error) {
//You can handle error here if you want
                        progress.hide();
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







}
