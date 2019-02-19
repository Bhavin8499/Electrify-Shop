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
using System.Web.Services;
using System.Data.SqlClient;

public partial class Cart : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["delProduct"] != null)
        {
            DeleteCartProduct();
        }
    }

    public void DeleteCartProduct()
    {
        String ID = Request.QueryString["ID"].ToString();
        String query = "Delete Customer_Cart where ID="+ID;
        con.Open();
        SqlCommand cmd = new SqlCommand(query,con);
        cmd.ExecuteNonQuery();
        Response.Redirect("Cart.aspx");
        con.Close();
    }
}
