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
public partial class admin_stockManager : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["deleteProduct"] != null)
        {
            doProductDelete();
        }
        else if (Request.Form["ProductID"] != null)
        {
            doRestockProduct();
        }
    }

    private void doProductDelete()
    {
        con.Open();
        String ID = Request.QueryString["deleteProduct"].ToString();
        String query = "update Product set Qty=0,SellerID=0 where ID="+ID;
        SqlCommand cmd = new SqlCommand(query, con);
        int affectedRows = cmd.ExecuteNonQuery();
        con.Close();
        if (affectedRows > 0)
        {
            Response.Write("<script>alert('Product is Deleted Successfully'); window.location = 'stockManager.aspx';</script>");
        }
    }

    private void doRestockProduct()
    {
        con.Open();
        String ID = Request.Form["ProductID"].ToString();
        String Qty = Request.Form["quantity"].ToString();
        String query = "update Product set Qty="+Qty+" where ID=" + ID;
        SqlCommand cmd = new SqlCommand(query, con);
        int affectedRows = cmd.ExecuteNonQuery();
        con.Close();
        if (affectedRows > 0)
        {
            Response.Write("<script>alert('Stock Updated Successfully'); window.location = 'stockManager.aspx';</script>");
        }

    }

}
