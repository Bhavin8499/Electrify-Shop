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

public partial class webMaster_AllContacts : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["delID"] != null)
        {
            delContactForm();
        }
    }

    private void delContactForm()
    {
        String ConID = Request.QueryString["delID"].ToString();

        String query = "delete Contact_Us where ID="+ConID;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
        con.Open();
        SqlCommand cmd = new SqlCommand(query,con);
        int affectedRow = cmd.ExecuteNonQuery();
        if (affectedRow > 0)
        {
            Response.Write("<script>alert('Contact Deleted Successfully'); window.location='AllContacts.aspx';</script>");
        }
        con.Close();
    }
}
