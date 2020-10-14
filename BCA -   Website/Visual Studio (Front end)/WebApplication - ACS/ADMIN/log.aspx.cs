using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.ADMIN
{
    public partial class log : System.Web.UI.Page
    {
        dataclass u1 = new dataclass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void register_Click(object sender, EventArgs e)
        {

            string mail = Request.Form["email"];
            string u = Request.Form["usrname"];
            string p = Request.Form["usrpwd"];
            string rep = Request.Form["repwd"];
            if (p != rep)
            {
                DataTable dt = u1.check(u);
                if (dt.Rows.Count > 0)
                {
                    Response.Write("<script>alert('Username alreday exist')</script>");
                    usrname.Text = "";
                }
            }


            else
            {

                Session["u"] = u;
                u1.logininsert(mail, u, p);
                Response.Write("<script>alert('Registration Succesful')</script>");
            }
        }



        protected void login_Click(object sender, EventArgs e)
        {
            string u = uname.Text;
            string p = pwd.Text;
            string s="";

            DataTable dt = u1.login(u,p);
            if (dt.Rows.Count > 0)
            {
                string user = dt.Rows[0][0].ToString();
                Session["uname"] = user;
                Response.Write("<script>alert('Login succesful!')</script>");
                Response.Redirect("home.aspx");
            }
            else if (uname.Text == s & pwd.Text == s)
            {
                Response.Write("<script>alert('Enter Email ID and Password!')</script>");
            }

            else
            {
                Response.Write("<script>alert('Login invalid! Check username or password')</script>");
                uname.Text = "";
            }
        }
    }
}