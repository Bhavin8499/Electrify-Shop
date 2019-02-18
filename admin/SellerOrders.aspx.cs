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

public partial class admin_SellerOrders : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["status"] != null)
        {
            doProductProcess();
        }
    }

    private void doProductProcess()
    {
        String Status = Request.QueryString["status"].ToString();
        String id = Request.QueryString["ID"].ToString();
        String query = "update CusOrder set Approved='" + Status + "' where ID='" + id + "'";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        Response.Redirect("SellerOrders.aspx?pending=YES");
        con.Close();
    }


}
