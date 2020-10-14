package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class About extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_about);
        Button btn_home =findViewById(R.id.btn_home);
        Button btn_vehicle =findViewById(R.id.btn_vehicle);
        Button btn_profile =findViewById(R.id.btn_profile);

        TextView about =findViewById(R.id.textView5);


        about.setText("ABOUT APP\n\n" +
                "This mobile App is for the National Highway Commuters of India, who wish to cross through a National Toll road in a pre-informed manner. The App also prevents frauds by way of overcharging by a Toll Plaza as it informs the user about the fee applicable. While on move, users can know the places of interest & Route to these places if he/she wishes.\n" +
                "\n" +
                "The App gives user complete freedom in generating QRCode Tags for the number of vehicles. Once the user crosses a plaza, he or she can also give feedback of his experience.\n" +
                "\n" +
                "The application consist of Nearby Toll where the user can search for tolls on route. The application has been specifically made for the users of QRCode Tag system.\n"+
               "\n"+
                "National Highway Authority of India [NHAI] in conjunction with Ministry of Road & Transports, Government of India, has the complete authority over the system and the application even though it was,\n"+
                "\n"+
                "DEVELOPED BY INDIAN MANUFACTURED ELECTRONICS \n");

        btn_home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(About.this, MainActivity.class);
                startActivity(intent);
                finish();

            }
        });
        btn_vehicle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(About.this, Vehicle.class);
                startActivity(intent);
                finish();

            }
        });

        btn_profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(About.this, Profile.class);
                startActivity(intent);
                finish();

            }
        });

    }
}
