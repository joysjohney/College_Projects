using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.admin
{
    public partial class airport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HiddenField1.Value = (string)Session["uname"];
                if (HiddenField1.Value != (string)Session["uname"])
                {
                    Response.Redirect("log.aspx");
                }
                dataclass e1 = new dataclass();
                GridView1.DataSource = e1.getitem();
                GridView1.DataBind();
                Button1.Visible = true;
                Button2.Visible = false;
                Button3.Visible = false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            dataclass e1 = new dataclass();
            e1.item_insert(TextBox1.Text, TextBox2.Text);
            GridView1.DataSource = e1.getitem();
            GridView1.DataBind();
            TextBox1.Text = "";
            TextBox2.Text = "";
            Button1.Visible = true;
            Button2.Visible = false;
            Button3.Visible = false;
        }



        protected void Button2_Click(object sender, EventArgs e)
        {
            dataclass e1 = new dataclass();
            e1.item_update(TextBox1.Text, TextBox2.Text);
            GridView1.DataSource = e1.getitem();
            GridView1.DataBind();
            TextBox1.Text = "";
            TextBox2.Text = "";
            Button1.Visible = true;
            Button2.Visible = false;
            Button3.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            dataclass e1 = new dataclass();
            e1.item_delete(TextBox1.Text);
            GridView1.DataSource = e1.getitem();
            GridView1.DataBind();
            TextBox1.Text = "";
            TextBox2.Text = "";
            Button1.Visible = true;
            Button2.Visible = false;
            Button3.Visible = false;
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int rowIndex = Int32.Parse(e.NewEditIndex.ToString());
            TextBox1.Text = GridView1.DataKeys[rowIndex].Values[0].ToString();
            TextBox2.Text = GridView1.DataKeys[rowIndex].Values[1].ToString();
            Button1.Visible = false;
            Button2.Visible = true;
            Button3.Visible = true;

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}