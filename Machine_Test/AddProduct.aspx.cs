using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;


public partial class AddProduct : System.Web.UI.Page
{
    string conn = @"Data Source=ANIKET-PC;Initial Catalog=sneha_Test;Integrated Security=True";
    DataSet ds = new DataSet();
    SqlDataAdapter sda;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            using (SqlConnection scon = new SqlConnection(conn))
            {
                if (scon.State == ConnectionState.Closed)
                {
                    scon.Open();
                }
                SqlCommand cmd = new SqlCommand("Select * from sneha_Test..Category;", scon);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DropDownList1.DataSource = ds;
                DropDownList1.DataTextField = "Name";
                DropDownList1.DataValueField = "ID";
                DropDownList1.DataBind();
                DropDownList1.Items.Insert(0, new ListItem("--Select--", "0"));
                scon.Close();

                Bindgrid();
            }
        }
        

        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile != null)
        {
            //image upload
            //string file;
            //FileUpload filedata;
            //string fileex = FileUpload1.FileName;

            //string Dbpath = "~/Images/" + fileex; ;
            //string imagepath = Server.MapPath(Dbpath).Replace("\\aspnet", string.Empty);
            //FileUpload1.SaveAs(imagepath);


            FileUpload1.SaveAs(Server.MapPath("~/Images/") + Path.GetFileName(FileUpload1.FileName));
            string imgpath = "Images/" + Path.GetFileName(FileUpload1.FileName);
            ////image upload end


            //Shiping cost
            decimal ac=0;


            if (RadioButtonList1.SelectedValue.ToString() == "1")
            {
                decimal Actualweight = Convert.ToDecimal(Tbweight.Text) * 50;
                decimal volumetricweight = (Convert.ToDecimal(Tblenth.Text) * Convert.ToDecimal(Tbwidth.Text) * Convert.ToDecimal(Tbheight.Text)) / 5000;

                if (Actualweight > volumetricweight)
                {
                    ac = Actualweight;
                }
                else
                {
                    ac = volumetricweight;
                }
            }
            else if (RadioButtonList1.SelectedValue.ToString() == "2")
            {
                decimal virtualship = 0;
                decimal SellingPer = Convert.ToDecimal(Tbsprice.Text) * 10 / 100;
                if (virtualship < SellingPer)
                {
                    ac = SellingPer;
                    
                }
                else
                {
                    ac = 50;
                }
            }
            else { }
            //shipping cost end
            //int Drop=Convert.ToInt32(DropDownList1.SelectedValue.ToString());
            decimal weightt = 0;
           // bool val = decimal.TryParse(Tbweight.Text, out weightt);
            
            if(decimal.TryParse(Tbweight.Text,out weightt))
            {

           
            if(Tbweight.Text==" ")
            {
                 weightt=0;
            }
            else
            {
                weightt = Convert.ToDecimal(Tbweight.Text);
            }
            }
            SqlConnection scon = new SqlConnection(conn);
            scon.Open();
            SqlCommand cmd = scon.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into sneha_Test..Products values ('" + DropDownList1.SelectedValue.ToString() + "','" + TbprodName.Text + "','" + Tbdesc.Text + "','" + Tbsku.Text + "','" + imgpath + "','" + Tbsprice.Text + "','" + Tbqty.Text + "','" + RadioButtonList1.SelectedItem.Text + "','" + weightt + "','" + Tblenth.Text + "','" + Tbwidth.Text + "','" + Tbheight.Text + "','" + ac + "')";
            cmd.ExecuteNonQuery();
            scon.Close();
            Response.Write("<script>alert('Product Added Successfully!!');</script>");
            Bindgrid();
            DropDownList1.SelectedItem.Text = "";
            TbprodName.Text = "";
            Tbdesc.Text = "";
            Tbheight.Text = "";
            Tblenth.Text = "";
            Tbqty.Text = "";
            Tbsku.Text = "";
            Tbsprice.Text = "";
            Tbweight.Text = "";
            Tbwidth.Text = "";
           
        }

        else
        {
            Response.Write("<script>alert('Oops!! Something went wrong');</script>");
        }

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue.ToString()=="2")
        {
            Tbweight.Visible = false;
            Tbwidth.Visible = false;
            Tblenth.Visible = false;
            Tbheight.Visible = false;
            lblweight.Visible = false;
            lblwidth.Visible = false;
            lbllength.Visible = false;
            lblHeight.Visible = false;
        }
        else
        {
            Tbweight.Visible = true;
            Tbwidth.Visible = true;
            Tblenth.Visible = true;
            Tbheight.Visible = true;
            lblweight.Visible = true;
            lblwidth.Visible = true;
            lbllength.Visible = true;
            lblHeight.Visible = true;
        }
    }
    public void Bindgrid()
    {
        using (SqlConnection scon = new SqlConnection(conn))
        {
            sda = new SqlDataAdapter("Select ID,Imagepath,SKU,Name,description from products", scon);
            ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        Bindgrid();

    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        
        string ProdId = GridView1.DataKeys[e.RowIndex].Value.ToString();
        // find values for update    
        TextBox Pname = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox2");
        TextBox SKUU = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox1");
        TextBox Desc = (TextBox)GridView1.Rows[e.RowIndex].FindControl("TextBox3");
        FileUpload FileUpload1 = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload2");
        SqlConnection scon = new SqlConnection(conn);
        string path = "/Images/";
        if (FileUpload1.HasFile)
        {
            path += FileUpload1.FileName;
            //save image in folder    
            FileUpload1.SaveAs(MapPath(path));
        }
        else
        {
            // use previous user image if new image is not changed    
            Image img = (Image)GridView1.Rows[e.RowIndex].FindControl("Image2");
            path = img.ImageUrl;
        }
        SqlCommand cmd = new SqlCommand("update sneha_Test..Products set Name='" + Pname.Text + "',description='" + Desc.Text + "',SKU='" + SKUU.Text + "', ImagePath='" + path + "' where ID=" + ProdId + "", scon);
         
        scon.Open();
        cmd.ExecuteNonQuery();
        scon.Close();
        GridView1.EditIndex = -1;
        Bindgrid();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        Bindgrid();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        SqlConnection scon = new SqlConnection(conn);
        scon.Open();
        SqlCommand cmd = new SqlCommand("delete FROM sneha_Test..Products where ID='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", scon);
        cmd.ExecuteNonQuery();
        scon.Close();
        Bindgrid();
    }
    
}

    


