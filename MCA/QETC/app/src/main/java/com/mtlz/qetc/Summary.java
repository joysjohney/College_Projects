package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;
import androidx.fragment.app.DialogFragment;

import android.annotation.SuppressLint;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.TimePickerDialog;
import android.content.Intent;
import android.os.Bundle;
import android.text.format.DateFormat;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.TimePicker;
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
import java.util.Calendar;

public class Summary extends AppCompatActivity {
    ListView listView;
    ArrayList<String> summary_list = new ArrayList<>();
    ArrayAdapter<String> adapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_summary);

        listView=findViewById(R.id.summary_list);

        Button btn_home =findViewById(R.id.btn_home);
        Button btn_about =findViewById(R.id.btn_about);
        Button btn_profile =findViewById(R.id.btn_profile);
        Button btn_vehicle =findViewById(R.id.btn_vehicle);




        Button btn_show =findViewById(R.id.buttonShow);


        GlobalVariables.from=findViewById(R.id.textViewFrom);
        GlobalVariables.to=findViewById(R.id.textViewTo);


        btn_show.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                summary_list.clear();
                listView.setAdapter(null);
                getData();
            }
        });


        GlobalVariables.from.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.i("nnn","Clicked");
                GlobalVariables.flag=0;
                showDatePickerDialog();

            }
        });

        GlobalVariables.to.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.i("nnn","Clicked");
                GlobalVariables.flag=1;
                showDatePickerDialog();

            }
        });





        btn_vehicle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Summary.this, Vehicle.class);
                startActivity(intent);

            }
        });

        btn_home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Summary.this, MainActivity.class);
                startActivity(intent);

            }
        });


        btn_profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Summary.this, Profile.class);
                startActivity(intent);

            }
        });
        btn_about.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Summary.this, About.class);
                startActivity(intent);

            }
        });
    }


    public void showDatePickerDialog() {
        DialogFragment newFragment = new DatePickerFragment();
        newFragment.show(getSupportFragmentManager(), "datePicker");
    }



    public static class DatePickerFragment extends DialogFragment
            implements DatePickerDialog.OnDateSetListener {

        @Override
        public Dialog onCreateDialog(Bundle savedInstanceState) {
            // Use the current date as the default date in the picker
            final Calendar c = Calendar.getInstance();
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH)+1;
            int day = c.get(Calendar.DAY_OF_MONTH);



            // Create a new instance of DatePickerDialog and return it
            return new DatePickerDialog(getActivity(), this, year, month, day);
        }

        public void onDateSet(DatePicker view, int year, int month, int day) {
            // Do something with the date chosen by the user

            if(GlobalVariables.flag==1)
            {
                GlobalVariables.to.setText(year+"-"+ month +"-"+day);
            }
            else {
                GlobalVariables.from.setText(year+"-"+ month +"-"+day);
            }



        }
    }




    private void getData()
    {

        String url = GlobalVariables.URL_GET_SUMMARY+GlobalVariables.EMAIL+"&from="+GlobalVariables.from.getText().toString()+"&to="+GlobalVariables.to.getText().toString();



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
                        Toast.makeText(Summary.this, error.getMessage(), Toast.LENGTH_LONG).show();
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

            Log.i("nnn", "Length : "+jsonArray.length());
            for (int i = 0; i < jsonArray.length(); i++)
            {
                JSONObject jsonObject = jsonArray.getJSONObject(i);
                String log = "Reg NO: "+jsonObject.optString("reg_no")+"\nDate: "+jsonObject.optString("date")+"\nAmount: "+jsonObject.optString("amount");
                summary_list.add(log);
            }

            adapter = new ArrayAdapter<String>(this,
                    android.R.layout.simple_list_item_1, android.R.id.text1, summary_list);
            listView.setAdapter(adapter);



        } catch (JSONException e) {
            e.printStackTrace();
        }
    }


}
