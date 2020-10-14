using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.ADMIN
{
    public partial class helicopter : System.Web.UI.Page
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
                GridView3.DataSource = e1.heliitem();
                GridView3.DataBind(); Button1.Visible = true;
                Button2.Visible = false;
                Button3.Visible = false;
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            dataclass e1 = new dataclass();
            Byte[] imgByte = null;
            HttpPostedFile File = FileUpload1.PostedFile;
            if (File.ContentLength > 0)
            {
                imgByte = new Byte[File.ContentLength];
                File.InputStream.Read(imgByte, 0, File.ContentLength);

            }
            e1.heli_insert(TextBox1.Text, TextBox2.Text, TextBox3.Text, imgByte, TextBox4.Text);
            GridView3.DataSource = e1.heliitem();
            GridView3.DataBind();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = ""; Button1.Visible = true;
            Button2.Visible = false;
            Button3.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            dataclass e1 = new dataclass();
            Byte[] imgByte = null;
            HttpPostedFile File = FileUpload1.PostedFile;
            if (File.ContentLength > 0)
            {
                imgByte = new Byte[File.ContentLength];
                File.InputStream.Read(imgByte, 0, File.ContentLength);

            }
            e1.heli_update(TextBox1.Text, TextBox2.Text, TextBox3.Text, imgByte, TextBox4.Text);
            GridView3.DataSource = e1.heliitem();
            GridView3.DataBind();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Button1.Visible = true;
            Button2.Visible = false;
            Button3.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            dataclass e1 = new dataclass();
            e1.heli_delete(TextBox1.Text);
            GridView3.DataSource = e1.heliitem();
            GridView3.DataBind();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = ""; Button1.Visible = true;
            Button2.Visible = false;
            Button3.Visible = false;
        }

        protected void GridView3_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int rowIndex = Int32.Parse(e.NewEditIndex.ToString());
            TextBox1.Text = GridView3.DataKeys[rowIndex].Values[0].ToString();
            TextBox2.Text = GridView3.DataKeys[rowIndex].Values[1].ToString();
            TextBox3.Text = GridView3.DataKeys[rowIndex].Values[2].ToString();
            Image1.ImageUrl = "getimg.aspx?id=" + GridView3.DataKeys[rowIndex].Values[0].ToString();
            TextBox4.Text = GridView3.DataKeys[rowIndex].Values[4].ToString();
            Button1.Visible = false;
            Button2.Visible = true;
            Button3.Visible = true;
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}