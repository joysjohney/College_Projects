package com.mtlz.qetc;

import android.content.Context;
import android.content.Intent;
import android.util.Log;
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

public class Sms {
    Context mContext;

    public Sms(Context context){
        this.mContext = context;
    }

    public void send(final String phone, final String msg)
    {
        StringRequest stringRequest = new StringRequest(Request.Method.POST,GlobalVariables.URL_SMS,
                new Response.Listener<String>() {
                    @Override
                    public void onResponse(String response) {

                        Log.i("nnn","Response="+response);

                        String sts="",message="";
                        try {
                            JSONObject json_obj= new JSONObject(response);
                            sts=json_obj.getString("status");
                            message=json_obj.getString("message");
                            Log.i("nnn","Message: "+message);


                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                },
                new Response.ErrorListener() {
                    @Override
                    public void onErrorResponse(VolleyError error) {

                    }

                }){
            @Override
            protected Map<String, String> getParams() throws AuthFailureError {
                Map<String,String> params = new HashMap<>();


                Log.i("nnn","Phone: "+phone);
                Log.i("nnn","Phone: "+msg);
                params.put("mobile_no", phone);
                params.put("msg",msg);
                return params;
            }
        };

        RequestQueue requestQueue = Volley.newRequestQueue(this.mContext);
        requestQueue.add(stringRequest);
    }


}
