package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class Vehicle extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_vehicle);
        Button btn_home =findViewById(R.id.btn_home);
        Button btn_about =findViewById(R.id.btn_about);
        Button btn_profile =findViewById(R.id.btn_profile);
        Button btn_view_vehicle =findViewById(R.id.btn_view_vhcl);
        Button btn_rules =findViewById(R.id.btn_toll_rule);



        Button btn_add_vehicle =findViewById(R.id.btn_add_vhcl);

        btn_home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Vehicle.this, MainActivity.class);
                startActivity(intent);
                finish();

            }
        });


        btn_profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Vehicle.this, Profile.class);
                startActivity(intent);
                finish();

            }
        });
        btn_about.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Vehicle.this, About.class);
                startActivity(intent);
                finish();

            }
        });



        btn_add_vehicle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Vehicle.this, AddVehicle.class);
                startActivity(intent);

            }
        });

        btn_view_vehicle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Vehicle.this, VehicleList.class);
                startActivity(intent);

            }
        });
        btn_rules.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Vehicle.this, TollRules.class);
                startActivity(intent);

            }
        });

    }
}
