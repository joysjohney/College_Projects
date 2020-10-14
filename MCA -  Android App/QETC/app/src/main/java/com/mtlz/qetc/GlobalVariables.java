package com.mtlz.qetc;

import android.widget.TextView;

public class GlobalVariables {

    static String user="Friend";

  //  static String host="http://192.168.0.7/";
    static String host="http://qetc.mcompany.in/";
    static String URL_REG= host+ "reg.php";
    static String URL_LOGIN= host+ "login.php";
    static String URL_GET_BALANCE=host+"select_amount.php";
    static String URL_UPDATE_AMOUNT=host+"update_amount.php";

    static String URL_GET_PROFILE=host+"get_profile.php";

    static String URL_CHANGE_PASSWORD=host+"change_password.php";

    static String URL_GET_VEHICLE_LIST=host+"get_vehicle_list.php?email=";

    static String URL_GET_SUMMARY=host+"get_summary.php?email=";

    static String URL_GET_VEHICLE_DETAILS=host+"get_vehicle_details.php?reg_no=";

    static String URL_DELETE_VEHICLE=host+"delete_vehicle.php?reg_no=";

    static String URL_SMS=host+"send_sms.php";

    static String URL_FORGOT=host+"forgot.php";





  static String REG_NO="";

    static String ISSUE_HEAD="";

    static String EMAIL="";

    static String PHONE="";

    static String PASS="";



    static Double BALANCE=0.0;

    static String FROM_DATE="";


    public static TextView from,to;

    static int flag=0;

}
