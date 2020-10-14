using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class status : System.Web.UI.Page
    {
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
            dataclass d1 = new dataclass();


            GridView1.DataSource = d1.gethistory(HiddenField1.Value);
            GridView1.DataBind();
        }
    }
}