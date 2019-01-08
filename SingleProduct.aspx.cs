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

public partial class SingleProduct : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            AddproductToCart();
        }
    } 

    protected void AddproductToCart()
    {
        String CusID = Request.Form["customerID"].ToString();
        String ProID = Request.Form["productID"].ToString();
        String Quntity = Request.Form["quntity"].ToString();

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
        con.Open();
        String query = "insert into Cart values ("+CusID+","+ProID+","+Quntity+")";

        SqlCommand cmd = new SqlCommand(query, con);
        int num = cmd.ExecuteNonQuery();
        if (num > 0)
        {
            Response.Write("<script>alert('Product Added To Cart Successfully');</script>");
        }
        else
        {
            Response.Write("<script>alert('Sorry For Inconvence But There Is Problem While Adding Product To Cart');</script>");
        }

    }
}
