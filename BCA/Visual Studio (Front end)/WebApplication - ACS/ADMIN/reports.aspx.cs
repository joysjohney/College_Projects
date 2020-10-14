using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.ADMIN
{
    public partial class reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HiddenField1.Value = (string)Session["uname"];
            if (HiddenField1.Value != (string)Session["uname"])
            {
                Response.Redirect("log.aspx");
            }
            dataclass d1 = new dataclass();
            

            GridView1.DataSource = d1.getreport();
            GridView1.DataBind();
        }
    }
}