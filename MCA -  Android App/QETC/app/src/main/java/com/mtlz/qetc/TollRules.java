package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class TollRules extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_toll_rules);




        TextView rules =findViewById(R.id.textView_rules);


        rules.setText(
                "CONDUCT TO FOLLOW :\n\n" +
                "1.\tHonking should be avoided under any circumstances. \n" +
                "2.\tLine departures should be made once you’re in one. \n" +
                "3.\tEmergency vehicles should restrict themselves to the allocated lane. \n\n" +
                "TOLL PLAZA RULES\n\n" +
                "1.\tEmergency vehicles, Police and other diplomats have free of charge transport through toll plazas\n" +
                "2.\tToll line should have only maximum of 6 vehicles per lane. \n" +
                "3.\tIf vehicles exceeds rule 2 then Toll plaza management have the authority to open a lane for free flow of traffic. \n" +
                "4.\tDiplomats, Ministers and other government officers, Defense personal will have a reduction in toll charges across India for their private vehicles. \n" +
                "5.\tThe rule 4 should be coincided with able document proof\n" +
                "6.\tThe traffic control should be administered as per the guidelines from police. \n" +
                "7.\tThe cost of each ticket should be displayed.\n" +
                "8.\tAn ambulance should be with every toll plaza for emergencies. \n" +
                "9.\tThe toll collectors should be diligent and should show courtesy to the customers. \n" +
                "10.\tThe fee should be collected manually and exact changes should be tendered. \n" +
                "11.\tAny disputes at toll plaza should be directed to the nearest police station\n" +
                "12.\tFailed to do so of rule 11, KPA and appropriate CrPC act will be invoked against the toll management. \n" +
                "13.\tNot giving amble support the emergency vehicle will have IPC act and KMVA proceedings against toll plaza. \n" +
                "14.\tAll govt. vehicles are free of charge to pass through the toll plaza gates. \n\n\n");


    }
}
