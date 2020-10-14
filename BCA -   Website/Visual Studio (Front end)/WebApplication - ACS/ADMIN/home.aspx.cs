using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.admin
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //Label lbluserType = new Label();
                //lbluserType = (Label)Page.Master.FindControl("Label1");
                //string value1 = lbluserType.Text.ToString();
              
            }
        }
    }
}