using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class ticket : System.Web.UI.Page
    {
        public string name, last, full, dob, emirates, phone, email, total,book,airname,arrival,depat,date,time;
        protected void Page_Load(object sender, EventArgs e)
        {
            userclass e1 = new userclass();
            string uname = (string)Session["uname"];
            
            string bookid = Session["bookid"].ToString();
           
            
            //DataTable dt = new DataTable();
            //dt = e1.getitem(uname);
            //if (dt.Rows.Count > 0)
            //{

            //    Repeater1.DataSource = dt;
            //    Repeater1.DataBind();
            //}

            DataTable dt1 = new DataTable();
            dt1 = e1.getpassenger(bookid);
            if (dt1.Rows.Count > 0)
            {
                name = dt1.Rows[0]["name"].ToString();

                book = dt1.Rows[0]["id"].ToString();
                email = dt1.Rows[0]["email"].ToString();
                emirates = dt1.Rows[0]["idproof"].ToString();
                phone = dt1.Rows[0]["phone"].ToString();
                dob = dt1.Rows[0]["dob"].ToString();
                 total = dt1.Rows[0]["total"].ToString();
                airname=dt1.Rows[0]["airname"].ToString();
                arrival = dt1.Rows[0]["arrival"].ToString();
                    depat=dt1.Rows[0]["depat"].ToString();
                    date=dt1.Rows[0]["date"].ToString();
                    time = dt1.Rows[0]["time"].ToString();
                Repeater1.DataSource = dt1;
                Repeater1.DataBind();
             
            }
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
        }
    }
