﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.ADMIN
{
    public partial class reportpaid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HiddenField1.Value = (string)Session["uname"];
            if (HiddenField1.Value != (string)Session["uname"])
            {
                Response.Redirect("log.aspx");
            }
            dataclass d1 = new dataclass();
            string status = "paid";

            GridView1.DataSource = d1.getpaid(status);
            GridView1.DataBind();
        }
    }
}