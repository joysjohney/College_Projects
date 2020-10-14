package com.mtlz.qetc;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.Button;

import androidx.appcompat.app.AppCompatActivity;

public class Bank extends AppCompatActivity {
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bank);

        Button btn_home =findViewById(R.id.btn_home);
        Button btn_vehicle =findViewById(R.id.btn_vehicle);
        Button btn_about =findViewById(R.id.btn_about);
        Button btn_profile =findViewById(R.id.btn_profile);

        WebView myWebView = findViewById(R.id.bank_view);
        WebSettings webSettings = myWebView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        myWebView.getSettings().setJavaScriptCanOpenWindowsAutomatically(true);
        myWebView.loadUrl("http://findmybank.gov.in/FMB/");

        btn_home.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Bank.this, MainActivity.class);
                startActivity(intent);
                finish();

            }
        });
        btn_vehicle.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Bank.this, Vehicle.class);
                startActivity(intent);
                finish();

            }
        });


        btn_about.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Bank.this, About.class);
                startActivity(intent);
                finish();

            }
        });
        btn_profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Intent intent = new Intent(Bank.this, About.class);
                startActivity(intent);
                finish();

            }
        });
    }
}

