package com.example.fasttagscanner;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.budiyev.android.codescanner.CodeScanner;
import com.budiyev.android.codescanner.CodeScannerView;
import com.budiyev.android.codescanner.DecodeCallback;
import com.google.zxing.Result;

import org.json.JSONException;
import org.json.JSONObject;

import java.security.MessageDigest;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;


public class MainActivity extends AppCompatActivity {
    Sms sms;
    private CodeScanner mCodeScanner;
    CodeScannerView scannerView;
    private ProgressDialog progress;
    int flag=0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        scannerView = findViewById(R.id.scanner_view);
        final Button scan=findViewById(R.id.scan_btn);

        scan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //
                if(flag==0) {
                    scan_code();
                    flag=1;
                }
                mCodeScanner.startPreview();
            }
        });

    }

    @Override
    protected void onResume() {
        super.onResume();
        // mCodeScanner.startPreview();
    }

    @Override
    protected void onPause() {
        //  mCodeScanner.releaseResources();
        super.onPause();
    }


    public void scan_code()
    {
        mCodeScanner = new CodeScanner(MainActivity.this, scannerView);
        mCodeScanner.setDecodeCallback(new DecodeCallback() {
            @Override
            public void onDecoded(@NonNull final Result result) {
                MainActivity.this.runOnUiThread(new Runnable() {
                    @Override
                    public void run() {

                        String raw_data= result.getText();

                        String decrypted_data= null;
                        try {
                            decrypted_data = decrypt(raw_data, "noufal");
                            String[] values = decrypted_data.split(",");

                            System.out.println(Arrays.toString(values));
                            Log.i("nnn","email"+values[0]);
                            Log.i("nnn","reg"+values[1]);
                            GlobalVariables.EMAIL=values[0];
                            GlobalVariables.REG_NO=values[1];



                            get_data();



                        } catch (Exception e) {
                            Log.i("nnn","Error while decoding!");
                            e.printStackTrace();

                        }


                    }
                });
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
//If we are getting success from server // added "Respons"+
                        Log.i("nnn","Response="+response);
                        String balance="",_fee="";
                        try {
                            JSONObject json_obj= new JSONObject(response);
                            balance=json_obj.getString("amount");
                            _fee=json_obj.getString("fee");


                            Log.i("nnn","STS="+balance);

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        if(response.contains("amount"))
                        {
                            Log.i("nnn","Success");

                            if(Double.parseDouble(balance)>=Double.parseDouble(_fee))
                            {
                                GlobalVariables.BALANCE=Double.parseDouble(balance);
                                GlobalVariables.FEE=Double.parseDouble(_fee);

                                update_balance();
                            }
                            else
                            {
                                Toast.makeText(MainActivity.this,"Insufficient balance",Toast.LENGTH_SHORT).show();
                            }


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
                params.put("reg_no", GlobalVariables.REG_NO);

//returning parameter
                return params;
            }
        };
//Adding the string request to the queue
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    public void update_balance() {
        // Toast.makeText(this, "Payment successfully done! " + razorpayPaymentID, Toast.LENGTH_SHORT).show();
        StringRequest stringRequest = new StringRequest(Request.Method.POST,GlobalVariables.URL_UPDATE_AMOUNT,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        Log.i("nnn","Response="+response);
//If we are getting success from server

                        if(response.contains("success"))
                        {

                            Toast.makeText(MainActivity.this,"Thank You!", Toast.LENGTH_SHORT).show();
                            scan();

                        }
                        else
                        {
                            Toast.makeText(MainActivity.this, "Update Failed", Toast.LENGTH_SHORT).show();
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
                Double amount=GlobalVariables.BALANCE-GlobalVariables.FEE;
                params.put("email",GlobalVariables.EMAIL);
                params.put("amount",amount.toString());
                params.put("reg_no",GlobalVariables.REG_NO);
                params.put("fee",GlobalVariables.FEE.toString());

//returning parameter

                return params;
            }
        };

//Adding the string request to the queue
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);

    }
    public void scan()
    {
        StringRequest stringRequest = new StringRequest(Request.Method.POST,GlobalVariables.URL_SCAN,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {
                        Log.i("nnn","Login");

                        Log.i("nnn","Response="+response);
//If we are getting success from server
                        String sts="",phone1="",_fee="";
                        try {
                            JSONObject json_obj= new JSONObject(response);
                            sts=json_obj.getString("status");
                            phone1=json_obj.getString("phone");
                            _fee=json_obj.getString("fee");
                            GlobalVariables.user=json_obj.getString("user");

                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        if(sts.contains("successful"))
                        {

                            GlobalVariables.PHONE=phone1;
                            GlobalVariables.FEE=Double.parseDouble(_fee);
                            sms = new Sms(MainActivity.this);
                            sms.send(GlobalVariables.PHONE, "Dear " + GlobalVariables.user + ", Your QR Toll tag has been scanned at Paliyekkara Toll Plaza.Rs "+GlobalVariables.FEE+" has been deducted.Thank you for using our service.Wishing you a safe journey.");
                            Toast.makeText(MainActivity.this, sts, Toast.LENGTH_SHORT).show();

                        }

                        else

                        {

                            Toast.makeText(MainActivity.this,"Can't Retrive * ",Toast.LENGTH_SHORT).show();
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
                params.put("reg_no",GlobalVariables.REG_NO);
//returning parameter
                return params;
            }
        };
//Adding the string request to the queue
        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }
    private String decrypt(String out, String microtechlabz) throws Exception {
        SecretKeySpec k=gen(microtechlabz);
        Cipher cipher=Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE,k);
        byte[] dv= Base64.decode(out,Base64.DEFAULT);
        byte[] deco= cipher.doFinal(dv);
        String n=new String(deco);
        return n;

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
