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

public partial class CancelOrder : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        DeleteProduct();
    }

    private void DeleteProduct()
    {

        String ID = Request.QueryString["ID"].ToString();
        if (ID != String.Empty)
        {
            con.Open();
            String query = "delete from CusOrder where ID = "+ID;
            SqlCommand cmd = new SqlCommand(query,con);
            int RowEffected = cmd.ExecuteNonQuery();
            if (RowEffected > 0)
            {
                Response.Write("<script>alert('Order Cancelation Done Successfully'); window.location='Order.aspx';</script>");

            }
            else
            {
                Response.Write("<script>alert('There Is Some Problem Please Try It Again'); window.location='TrackOrder.aspx';</script>");
            }
            con.Close();

        }
        else
        {
            Response.Write("<script>alert('There Is Some Problem Please Try It Again'); window.location='Order.aspx';</script>");
        }

    }

}
