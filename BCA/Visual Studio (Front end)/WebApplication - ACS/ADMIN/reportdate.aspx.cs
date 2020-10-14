using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.ADMIN
{
    public partial class reportdate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HiddenField1.Value = (string)Session["uname"];
            if (HiddenField1.Value != (string)Session["uname"])
            {
                Response.Redirect("log.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dataclass d1 = new dataclass();
            DataTable d2 = d1.getdate(TextBox1.Text);
            {
                if (d2.Rows.Count > 0)
                {

                    GridView1.DataSource = d1.getdate(TextBox1.Text);
                    GridView1.DataBind();
                }
                else
                    Response.Write("<script>alert('No data found on this date!')</script>");
                TextBox1.Text = "";
            }
        }
    }
}