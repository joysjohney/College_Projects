using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class login : System.Web.UI.Page
    {
        userclass u1 = new userclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["previouspage"] = Request.UrlReferrer.ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = TextBox1.Text;
            string pass = TextBox2.Text;
            string val = TextBox3.Text;
            string s = "";
            if (pass != val)
            {
                Response.Write("<script>alert('Password didn't Match! enter again')</script>");
            }
             DataTable dt = u1.check(email);
                if (dt.Rows.Count > 0)
                {
                    string tit = dt.Rows[0]["email"].ToString();
                    if (tit == TextBox1.Text)
                    {
                        Response.Write("<script>alert('Username already exist')</script>");
                        TextBox1.Text = TextBox2.Text = TextBox3.Text = "";
                    }
                }
              
            else if (TextBox1.Text == s || TextBox2.Text == s || TextBox3.Text == s)
            {
                Response.Write("<script>alert('Check your entries agian!')</script>");
            }

            else 
            {
                Session["email"] = email;
                u1.register(email, pass);
                Response.Write("<script>alert('Registration Succesful!')</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string email = TextBox4.Text;
            string pass = TextBox5.Text;
            string s = "";
            DataTable dt = u1.login(email, pass);
            if (dt.Rows.Count > 0)
            {
                string uname = dt.Rows[0][0].ToString();
                Session["email"] = email;
                string y = "";
                y = (string)ViewState["previouspage"];
                Response.Redirect(y);
            }
            else if (TextBox4.Text == s & TextBox5.Text == s)
            {
                Response.Write("<script>alert('Enter Email ID and Password!')</script>");
            }
            else
            {
                Response.Write("<script>alert('Enter valid username and password! Team ACS')</script>");
            }
            
            
        }
    }
}