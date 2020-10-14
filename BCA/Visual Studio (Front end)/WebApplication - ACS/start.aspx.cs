using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class start : System.Web.UI.Page
    {
        //userclass u1 = new userclass();
        //void clean()
        //{
        //    TextBox1.Text = TextBox2.Text = TextBox3.Text = TextBox6.Text = TextBox12.Text = TextBox12.Text = TextBox10.Text = TextBox9.Text = TextBox8.Text = TextBox7.Text = TextBox11.Text = "";
        //}

        protected void Page_Load(object sender, EventArgs e)
        {
            //{
            //    string total = (string)Session["total"];
            //    TextBox13.Text = total;
            //    string uname = (string)Session["uname"];
            //    HiddenField1.Value = uname;
            //    if (HiddenField1.Value != (string)Session["uname"])
            //    {
            //        Response.Write("<script>alert('Please login to make payment!')</script>");
            //        //Response.Redirect("Home.aspx");
            //    }
            //    string book = Session["bookid"].ToString();

            //}
        }

        protected void TextBox13_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //if (HiddenField1.Value != (string)Session["uname"])
            //{
            //    Response.Write("<script>alert('Sorry for the inconvinience! login not found')</script>");
            //    Response.Redirect("Home.aspx");
            //}
            //else
            //{

            //u1.credit(TextBox3.Text, TextBox12.Text, TextBox2.Text, TextBox1.Text, TextBox13.Text, HiddenField1.Value);
            //u1.statusupdate(HiddenField1.Value);
            //Button1.Visible = true;
            ////Button1.Visible = false;
            //Session["uname"] = HiddenField1.Value;
            //string book = Session["bookid"].ToString();
            //Session["bookid"] = book;
            //Response.Redirect("ticket.aspx");
            //clean();

            ////}
            Response.Redirect("home.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //if (HiddenField1.Value != (string)Session["user"])
            //{
            //    Response.Write("<script>alert('Sorry for the inconvinience! Login not found')</script>");
            //    Response.Redirect("Home.aspx");
            //}
            //else
            //{

            Response.Redirect("ADMIN/log.aspx");


            //}
        }
    }
}