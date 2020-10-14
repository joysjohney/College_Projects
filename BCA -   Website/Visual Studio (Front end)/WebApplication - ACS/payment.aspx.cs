using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class payment : System.Web.UI.Page
    {userclass u1 = new userclass();
        void clean()
        {
             TextBox3.Text = TextBox6.Text = TextBox12.Text = TextBox12.Text =  TextBox8.Text = TextBox7.Text = TextBox11.Text = "";
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            {
                string total = (string)Session["total"];
                TextBox13.Text = total;
                string name = (string)Session["name"];
                TextBox3.Text = name;
                string uname = (string)Session["uname"];
                HiddenField1.Value = uname;
                if (HiddenField1.Value != (string)Session["uname"])
                {
                    Response.Write("<script>alert('Please login to make payment!')</script>");
                    //Response.Redirect("Home.aspx");
                }
                string book = Session["bookid"].ToString();

            }
        }

        protected void TextBox13_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = "";
            if (TextBox3.Text == s || TextBox12.Text == s || TextBox13.Text == s)
            {
                Response.Write("<script>alert('Please make your enteries!')</script>");
            }
            else
            {
                {
                    // string s = "949665";

                    //Your authentication key
                    string authKey = "191249AlJenWR7Pws5a4da48b";
                    //Multiple mobiles numbers separated by comma
                    //string mobileNumber = "960";
                    string mobileNumber = (string)Session["phone"];
                    string name = (string)Session["name"];

                    string total = (string)Session["total"];
                    //Sender ID,While using route4 sender id should be 6 characters long.
                    string senderId = "102234";
                    //Your message to send, Add URL encoding here.
                    string msg = "Dear" + name + ",Thank you for choosing ACS. Your payment for a purchase worth Rs" + total + "is confirmed with us!";
                    //string message = HttpUtility.UrlEncode("hai");
                    string message = HttpUtility.UrlEncode(msg);

                    //Prepare you post parameters
                    StringBuilder sbPostData = new StringBuilder();
                    sbPostData.AppendFormat("authkey={0}", authKey);
                    sbPostData.AppendFormat("&mobiles={0}", mobileNumber);
                    sbPostData.AppendFormat("&message={0}", message);
                    sbPostData.AppendFormat("&sender={0}", senderId);
                    sbPostData.AppendFormat("&route={0}", "default");

                    try
                    {
                        //Call Send SMS API
                        string sendSMSUri = "http://api.msg91.com/api/sendhttp.php";
                        //Create HTTPWebrequest
                        HttpWebRequest httpWReq = (HttpWebRequest)WebRequest.Create(sendSMSUri);
                        //Prepare and Add URL Encoded data
                        UTF8Encoding encoding = new UTF8Encoding();
                        byte[] data = encoding.GetBytes(sbPostData.ToString());
                        //Specify post method
                        httpWReq.Method = "POST";
                        httpWReq.ContentType = "application/x-www-form-urlencoded";
                        httpWReq.ContentLength = data.Length;
                        using (Stream stream = httpWReq.GetRequestStream())
                        {
                            stream.Write(data, 0, data.Length);
                        }
                        //Get the response
                        HttpWebResponse response = (HttpWebResponse)httpWReq.GetResponse();
                        StreamReader reader = new StreamReader(response.GetResponseStream());
                        string responseString = reader.ReadToEnd();

                        //Close the response
                        reader.Close();
                        response.Close();
                    }
                    catch (SystemException ex)
                    {

                    }
                }
                //u1.credit(TextBox3.Text, TextBox12.Text, DropDownList4.SelectedValue, DropDownList3.SelectedValue, TextBox13.Text, HiddenField1.Value);
                //u1.statusupdate(HiddenField1.Value);
                
                //Button1.Visible = false;
                Session["uname"] = HiddenField1.Value;
                string book = Session["bookid"].ToString();
                Session["bookid"] = book;
                Response.Redirect("confirmation.aspx");
                clean();

                //}
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string s = "";
            if (TextBox3.Text == s || TextBox12.Text == s || TextBox13.Text == s)
            {
                Response.Write("<script>alert('Please make your enteries!')</script>");
            }
            else
            {
                {
                    // string s = "949665";

                    //Your authentication key
                    string authKey = "191249AlJenWR7Pws5a4da48b";
                    //Multiple mobiles numbers separated by comma
                    //string mobileNumber = "960";
                    string mobileNumber = (string)Session["phone"];
                    string name = (string)Session["name"];
                    string total = (string)Session["total"];
                    //Sender ID,While using route4 sender id should be 6 characters long.
                    string senderId = "102234";
                    //Your message to send, Add URL encoding here.
                    string msg = "Dear" + name + ",Thank you for choosing ACS. Your payment for a purchase worth Rs" + total + "is confirmed with us!";
                    //string message = HttpUtility.UrlEncode("hai");
                    string message = HttpUtility.UrlEncode(msg);

                    //Prepare you post parameters
                    StringBuilder sbPostData = new StringBuilder();
                    sbPostData.AppendFormat("authkey={0}", authKey);
                    sbPostData.AppendFormat("&mobiles={0}", mobileNumber);
                    sbPostData.AppendFormat("&message={0}", message);
                    sbPostData.AppendFormat("&sender={0}", senderId);
                    sbPostData.AppendFormat("&route={0}", "default");

                    try
                    {
                        //Call Send SMS API
                        string sendSMSUri = "http://api.msg91.com/api/sendhttp.php";
                        //Create HTTPWebrequest
                        HttpWebRequest httpWReq = (HttpWebRequest)WebRequest.Create(sendSMSUri);
                        //Prepare and Add URL Encoded data
                        UTF8Encoding encoding = new UTF8Encoding();
                        byte[] data = encoding.GetBytes(sbPostData.ToString());
                        //Specify post method
                        httpWReq.Method = "POST";
                        httpWReq.ContentType = "application/x-www-form-urlencoded";
                        httpWReq.ContentLength = data.Length;
                        using (Stream stream = httpWReq.GetRequestStream())
                        {
                            stream.Write(data, 0, data.Length);
                        }
                        //Get the response
                        HttpWebResponse response = (HttpWebResponse)httpWReq.GetResponse();
                        StreamReader reader = new StreamReader(response.GetResponseStream());
                        string responseString = reader.ReadToEnd();

                        //Close the response
                        reader.Close();
                        response.Close();
                    }
                    catch (SystemException ex)
                    {

                    }
                }
                //u1.debit(TextBox7.Text, TextBox8.Text,DropDownList1.SelectedValue,DropDownList2.SelectedValue, TextBox13.Text, HiddenField1.Value);
                //u1.statusupdate(HiddenField1.Value);

                Session["uname"] = HiddenField1.Value; string book = Session["bookid"].ToString();
                Session["bookid"] = book;
                Response.Redirect("confirmation.aspx");
                Button1.Visible = true;

                //Button1.Visible = false;
                clean();


                //}
            }
           
}
}
    }
