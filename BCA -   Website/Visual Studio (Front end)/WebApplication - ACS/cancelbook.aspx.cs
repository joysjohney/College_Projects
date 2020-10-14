using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class cancelbook : System.Web.UI.Page
    {
        userclass e1 = new userclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            HiddenField1.Value = (string)Session["email"];
            if (HiddenField1.Value != (string)Session["email"])
            {
                Response.Redirect("login.aspx");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = "";
            if (TextBox1.Text == s || TextBox2.Text == s)
            {

                Response.Write("<script>alert('Enter ID or Name')</script>");
            }
            else
            {
                e1.cancel(TextBox1.Text, TextBox2.Text);
                Response.Redirect("home.aspx");

            }
        }
    }
}