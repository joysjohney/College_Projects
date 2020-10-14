package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.ContextCompat;

import android.content.Intent;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

public class Feedback extends AppCompatActivity {
    ImageView R1,R2,R3,R4;
    Sms sms;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_feedback);

        R1=findViewById(R.id.imageViewR1);
        R2=findViewById(R.id.imageViewR2);
        R3=findViewById(R.id.imageViewR3);
        R4=findViewById(R.id.imageViewR4);



        final EditText name=findViewById(R.id.editTextName);
        final EditText phone=findViewById(R.id.editTextPhone);
        final EditText com=findViewById(R.id.editTextComment);

        Button btn_submit =findViewById(R.id.buttonSubmit);


        Button btn_home =findViewById(R.id.btn_home);
        Button btn_about =findViewById(R.id.btn_about);
        Button btn_profile =findViewById(R.id.btn_profile);
        Button btn_vehicle =findViewById(R.id.btn_vehicle);



        R1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String PACKAGE_NAME = getApplicationContext().getPackageName();
                int imgId = getResources().getIdentifier(PACKAGE_NAME+":drawable/btn_star_big_on" , null, null);
                R1.setImageResource(android.R.drawable.btn_star_big_on);
                R2.setImageResource(android.R.drawable.btn_star_big_off);
                R3.setImageResource(android.R.drawable.btn_star_big_off);
                R4.setImageResource(android.R.drawable.btn_star_big_off);
            }
        });

        R2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String PACKAGE_NAME = getApplicationContext().getPackageName();
                int imgId = getResources().getIdentifier(PACKAGE_NAME+":drawable/btn_star_big_on" , null, null);
                R1.setImageResource(android.R.drawable.btn_star_big_on);
                R2.setImageResource(android.R.drawable.btn_star_big_on);
                R3.setImageResource(android.R.drawable.btn_star_big_off);
                R4.setImageResource(android.R.drawable.btn_star_big_off);
            }
        });
        R3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String PACKAGE_NAME = getApplicationContext().getPackageName();
                int imgId = getResources().getIdentifier(PACKAGE_NAME+":drawable/btn_star_big_on" , null, null);
                R1.setImageResource(android.R.drawable.btn_star_big_on);
                R2.setImageResource(android.R.drawable.btn_star_big_on);
                R3.setImageResource(android.R.drawable.btn_star_big_on);
                R4.setImageResource(android.R.drawable.btn_star_big_off);
            }
        });

        R4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String PACKAGE_NAME = getApplicationContext().getPackageName();
                int imgId = getResources().getIdentifier(PACKAGE_NAME+":drawable/btn_star_big_on" , null, null);
                R1.setImageResource(android.R.drawable.btn_star_big_on);
                R2.setImageResource(android.R.drawable.btn_star_big_on);
                R3.setImageResource(android.R.drawable.btn_star_big_on);
                R4.setImageResource(android.R.drawable.btn_star_big_on);
            }
        });


        btn_submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String head_txt =name.getText().toString();
                String loc_txt = phone.getText().toString();
                String com_txt = com.getText().toString();


                if(head_txt.isEmpty()|| loc_txt.isEmpty()||com_txt.isEmpty())
                {
                    Toast.makeText(Feedback.this, "Fill All !", Toast.LENGTH_SHORT).show();
                }

                else
                {
                    Toast.makeText(Feedback.this, "Submitted !", Toast.LENGTH_SHORT).show();
                    sms = new Sms(Feedback.this);
                    sms.send(GlobalVariables.PHONE, "Dear " + GlobalVariables.user + ", The feedback you provided is very valuable to us. NHAI will use this feedback for further development of this app. Wishing you a Safe Journey");

                }

            }
        });

        btn_vehicle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Feedback.this, Vehicle.class);
                startActivity(intent);
                finish();

            }
        });

        btn_home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Feedback.this, MainActivity.class);
                startActivity(intent);
                finish();

            }
        });


        btn_profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Feedback.this, Profile.class);
                startActivity(intent);
                finish();

            }
        });
        btn_about.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Feedback.this, About.class);
                startActivity(intent);
                finish();

            }
        });
    }
}
