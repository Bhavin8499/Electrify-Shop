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


public partial class admin_EditShippingDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            changeProductStauts();
        }
    }

    private void changeProductStauts()
    {
        String ID = Request.Form["ID"].ToString();
        String Status = Request.Form["status"].ToString();
        String Note = Request.Form["Note"].ToString();
        con.Open();
        String query = "update CusOrder Set Status='"+Status+"', Message='"+Note+"' where ID='"+ID+"'";
        SqlCommand cmd = new SqlCommand(query,con);
        int affectedRows = cmd.ExecuteNonQuery();
        if (affectedRows > 0)
        {
            Response.Redirect("SellerOrders.aspx");
        }
        con.Close();
    }
}
