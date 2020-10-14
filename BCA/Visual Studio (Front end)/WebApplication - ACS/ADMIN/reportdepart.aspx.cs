using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.ADMIN
{
    public partial class reportdepart : System.Web.UI.Page
    {
        dataclass d1 = new dataclass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HiddenField1.Value = (string)Session["uname"];
                if (HiddenField1.Value != (string)Session["uname"])
                {
                    Response.Redirect("log.aspx");
                }
                DropDownList1.DataSource = d1.getairport();
                DropDownList1.DataTextField = "name";
                DropDownList1.DataValueField = "id";
                DropDownList1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            DataTable d2 = d1.getdepart(DropDownList1.SelectedValue);
            {
                if (d2.Rows.Count > 0)
                {

                    GridView1.DataSource = d1.getdepart(DropDownList1.SelectedValue);
                    GridView1.DataBind();
                }
                else
                    Response.Write("<script>alert('No data found on this airport! Select another')</script>");
                
            }
        }
    }
}