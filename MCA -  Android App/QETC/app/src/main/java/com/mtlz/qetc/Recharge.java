package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
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
import com.razorpay.Checkout;
import com.razorpay.PaymentResultListener;

import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

public class Recharge extends AppCompatActivity implements PaymentResultListener {
    EditText amount_txt;
    Sms sms;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recharge);
        amount_txt=findViewById(R.id.editText_amount);
        Button recharge =findViewById(R.id.btn_recharge);
        recharge.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startPayment();
            }
        });
    }


    public void startPayment() {
        /**
         * You need to pass current activity in order to let Razorpay create CheckoutActivity
         */
        final Activity activity = this;

        final Checkout co = new Checkout();

        try {
            JSONObject options = new JSONObject();
            options.put("name", "Razorpay Corp");
            options.put("description", "Demoing Charges");
            //You can omit the image option to fetch the image from dashboard
            options.put("image", "https://rzp-mobile.s3.amazonaws.com/images/rzp.png");
            options.put("currency", "INR");
            options.put("amount", Integer.parseInt(amount_txt.getText().toString())*100);
            JSONObject preFill = new JSONObject();
            preFill.put("email", "sikander@gkmit.co");
            preFill.put("contact", "9680224241");
            options.put("prefill", preFill);

            co.open(activity, options);
        } catch (Exception e) {
            Toast.makeText(activity, "Error in payment: " + e.getMessage(), Toast.LENGTH_SHORT).show();
            e.printStackTrace();

        }


    }

    @Override
    public void onPaymentSuccess(final String razorpayPaymentID) {
        // Toast.makeText(this, "Payment successfully done! " + razorpayPaymentID, Toast.LENGTH_SHORT).show();
        StringRequest stringRequest = new StringRequest(Request.Method.POST,GlobalVariables.URL_UPDATE_AMOUNT,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        Log.i("nnn","Response="+response);
//If we are getting success from server
                        if(response.contains("success"))
                        {
                            sms = new Sms(Recharge.this);
                            sms.send(GlobalVariables.PHONE, "Dear " + GlobalVariables.user + ", The QR Code tag recharge for amount Rs."+ amount_txt.getText().toString() + " has been successful. Thank you for using our service. Wishing you a Safe Journey");

                            Toast.makeText(Recharge.this,"Recharge SuccessFully", Toast.LENGTH_SHORT).show();
                            GlobalVariables.BALANCE=GlobalVariables.BALANCE+Double.parseDouble(amount_txt.getText().toString());
                            Intent intent = new Intent(Recharge.this, MainActivity.class);
                            startActivity(intent);
                            finish();



                        }
                        else
                        {
                            Toast.makeText(Recharge.this, "Payment Failed", Toast.LENGTH_SHORT).show();
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
                Double amount=GlobalVariables.BALANCE+Double.parseDouble(amount_txt.getText().toString());
                params.put("email",GlobalVariables.EMAIL);
                params.put("amount",amount.toString());

//returning parameter

                return params;
            }
        };

//Adding the string request to the queue
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);

    }

    @Override
    public void onPaymentError(int code, String response) {
        try {
            Toast.makeText(this, "Payment error please try again", Toast.LENGTH_SHORT).show();
        } catch (Exception e) {
            Log.e("OnPaymentError", "Exception in onPaymentError", e);
        }
    }


}
