using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.ADMIN
{
    public partial class getimg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dataclass e1 = new dataclass();
                
                Response.BinaryWrite(e1.HPhoto(Request.QueryString["id"].ToString()));
            }
        }
    }
}
