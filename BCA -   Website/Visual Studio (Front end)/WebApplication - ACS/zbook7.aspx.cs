using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class zbook7 : System.Web.UI.Page
    {
        userclass u1 = new userclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dt = u1.hp7();
                if (dt.Rows.Count > 0)
                {
                    TextBox7.Text = dt.Rows[0]["name"].ToString();
                    TextBox12.Text = dt.Rows[0]["price"].ToString();
                }
                TextBox6.Text = u1.findbook();

                DropDownList1.DataSource = u1.getdep();
                DropDownList1.DataTextField = "name";
                DropDownList1.DataValueField = "id";
                DropDownList1.DataBind();

                DropDownList2.DataSource = u1.getdep();
                DropDownList2.DataTextField = "name";
                DropDownList2.DataValueField = "id";
                DropDownList2.DataBind();


                HiddenField1.Value = (string)Session["email"];
                HiddenField2.Value = DateTime.Now.ToString();
                if (HiddenField1.Value != (string)Session["email"])
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string s = "";
            DateTime d3 = DateTime.Now;
            DateTime d1 = DateTime.Parse(TextBox10.Text).Date;
            int n1 = Convert.ToInt32((d3 - d1).TotalDays);
            if ((n1 >= 0))
            {
                Response.Write("<script>alert('Please select another date fr! Team ACS')</script>");
                TextBox10.Text = "";
            }

            else if (TextBox1.Text == s ||
               TextBox2.Text == s ||
               TextBox3.Text == s ||
               TextBox4.Text == s ||
               TextBox5.Text == s ||
               TextBox10.Text == s ||
               TextBox11.Text == s)
            {
                Response.Write("<script>alert('Recheck your entires! Team ACS')</script>");
            }
            else
            {
                Session["bookid"] = TextBox6.Text;
                u1.booking(TextBox6.Text, TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text, TextBox5.Text, TextBox7.Text, DropDownList1.SelectedValue, DropDownList2.SelectedValue, TextBox10.Text, TextBox11.Text, TextBox12.Text, HiddenField1.Value);
                Session["phone"] = TextBox5.Text;
                Session["name"] = TextBox1.Text;
                Session["total"] = TextBox12.Text;
                Session["uname"] = HiddenField1.Value;

                Response.Redirect("payment.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("helicopter.aspx");
        }
        protected void TextBox10_TextChanged(object sender, EventArgs e)
        {
            Button1.Visible = true;
        }
    }
}