using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class product : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["addToCart"] != null)
        {
            addProdutToCart();
        }
    }

    public void addProdutToCart()
    {
        if (Session["ID"] != null)
        {
            con.Open();
            String proID = Request.Form["ProID"].ToString();
            String CusID = Session["ID"].ToString();
            String query = "insert into Customer_Cart values ('" + CusID + "','" + proID + "','1')";
            SqlCommand cmd = new SqlCommand(query, con);
            int affectedRows = cmd.ExecuteNonQuery();
            if (affectedRows > 0)
            {
                Response.Write("<script>alert('Product Added To Cart Successfully'); window.location='index.aspx';</script>");

            }
            con.Close();
        }
        else
        {
            Response.Write("<script>alert('Please Login To Add Product To Cart'); window.location.href='LoginCustomer.aspx';</script>");
        }
    }

}
