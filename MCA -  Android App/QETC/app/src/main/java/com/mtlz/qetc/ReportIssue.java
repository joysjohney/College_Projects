package com.mtlz.qetc;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class ReportIssue extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_report_issue);


        final Button btn_management=findViewById(R.id.btn_comp_toll);
        final Button btn_mint=findViewById(R.id.btn_comp_maint);
        final Button btn_saf=findViewById(R.id.btn_comp_safety);
        final Button btn_work=findViewById(R.id.btn_comp_work);
        Button btn_rules=findViewById(R.id.btn_rules);

        btn_management.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                GlobalVariables.ISSUE_HEAD=btn_management.getText().toString();
                Intent intent = new Intent(ReportIssue.this, Issue.class);
                startActivity(intent);

            }
        });
        btn_mint.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                GlobalVariables.ISSUE_HEAD=btn_mint.getText().toString();
                Intent intent = new Intent(ReportIssue.this, Issue.class);
                startActivity(intent);
            }
        });
        btn_saf.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                GlobalVariables.ISSUE_HEAD=btn_saf.getText().toString();
                Intent intent = new Intent(ReportIssue.this, Issue.class);
                startActivity(intent);
            }
        });
        btn_work.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                GlobalVariables.ISSUE_HEAD=btn_work.getText().toString();
                Intent intent = new Intent(ReportIssue.this, Issue.class);
                startActivity(intent);
            }
        });
        btn_rules.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(ReportIssue.this, TollRules.class);
                startActivity(intent);

            }
        });



    }
}
