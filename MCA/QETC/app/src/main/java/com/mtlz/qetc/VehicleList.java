package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;

public class VehicleList extends AppCompatActivity {
    ListView listView;
    TextView textView;

    ArrayList<String> vehicle_list = new ArrayList<>();
    ArrayAdapter<String> adapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_vehicle_list);


        getData();

        listView=findViewById(R.id.listView);
        textView=findViewById(R.id.textView);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int position, long l) {
                // TODO Auto-generated method stub
                String reg=adapter.getItem(position);
                Log.i("nnn","Reg:"+reg);

                GlobalVariables.REG_NO=reg;


                Intent intent = new Intent(VehicleList.this, ViewVehicle.class);
                startActivity(intent);
                finish();

            }
        });


    }


    private void getData()
    {

        String url = GlobalVariables.URL_GET_VEHICLE_LIST+GlobalVariables.EMAIL;



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
                        Toast.makeText(VehicleList.this, error.getMessage(), Toast.LENGTH_LONG).show();
                    }
                });

        RequestQueue requestQueue = Volley.newRequestQueue(this);
        requestQueue.add(stringRequest);
    }

    public void parseJsonData(String response) {
        Log.i("nnn", "Response"+response);
        try {
            // Create the root JSONObject from the JSON string.

            JSONObject jsonRootObject = new JSONObject(response);

            //Get the instance of JSONArray that contains JSONObjects
            JSONArray jsonArray = jsonRootObject.optJSONArray("Result");


            for (int i = 0; i < jsonArray.length(); i++)
            {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                String reg_no = jsonObject.optString("reg_no");
                Log.i("nnn", "reg_no: "+reg_no);
                vehicle_list.add(reg_no);
            }

            adapter = new ArrayAdapter<String>(this,
                    android.R.layout.simple_list_item_1, android.R.id.text1, vehicle_list);
            listView.setAdapter(adapter);



        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
}
