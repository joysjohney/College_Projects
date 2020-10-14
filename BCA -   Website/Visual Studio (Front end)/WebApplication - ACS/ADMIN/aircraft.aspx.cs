using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2.admin
{
    public partial class aircraft : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
              
                dataclass e1 = new dataclass();
                GridView2.DataSource = e1.craftitem();
                GridView2.DataBind();
                Button1.Visible = true;
                Button2.Visible = false;
                Button3.Visible = false;
                HiddenField1.Value = (string)Session["uname"];
                if (HiddenField1.Value != (string)Session["uname"])
                {
                    Response.Redirect("log.aspx");
                }
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
            e1.craft_insert(TextBox1.Text, TextBox2.Text, TextBox3.Text, imgByte, TextBox4.Text);
            GridView2.DataSource = e1.craftitem();
            GridView2.DataBind();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Button1.Visible = true;
            Button2.Visible = false;
            Button3.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Byte[] imgByte = null;
            HttpPostedFile File = FileUpload1.PostedFile;
            if (File.ContentLength > 0)
            {
                imgByte = new Byte[File.ContentLength];
                File.InputStream.Read(imgByte, 0, File.ContentLength);

            }
            dataclass e1 = new dataclass();
            e1.craft_update(TextBox1.Text, TextBox2.Text, TextBox3.Text, imgByte, TextBox4.Text);
            GridView2.DataSource = e1.craftitem();
            GridView2.DataBind();
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
            e1.craft_delete(TextBox1.Text);
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Button1.Visible = true;
            Button2.Visible = false;
            Button3.Visible = false;
        }



       
        protected void GridView2_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int rowIndex = Int32.Parse(e.NewEditIndex.ToString());
            TextBox1.Text = GridView2.DataKeys[rowIndex].Values[0].ToString();
            TextBox2.Text = GridView2.DataKeys[rowIndex].Values[1].ToString();
            TextBox3.Text = GridView2.DataKeys[rowIndex].Values[2].ToString();
            Image1.ImageUrl = "getimgA.aspx?id=" + GridView2.DataKeys[rowIndex].Values[0].ToString();
            TextBox4.Text = GridView2.DataKeys[rowIndex].Values[4].ToString();
            Button1.Visible = false;
            Button2.Visible = true;
            Button3.Visible = true;
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}