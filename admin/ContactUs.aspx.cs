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

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            doSubmitContact();
        }
    }

    private void doSubmitContact()
    {
        String Name = Request.Form["Name"].ToString();
        String Email = Request.Form["Email"].ToString();
        String Message = Request.Form["Message"].ToString();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
        con.Open();
        String query = "insert into Contact_Us values ('"+Name+"','"+Email+"','"+Message+"');";
        SqlCommand cmd = new SqlCommand(query, con);
        int EffectedRows = cmd.ExecuteNonQuery();
        if (EffectedRows > 0)
        {
            Response.Write("<script>alert('Thanks For Giving Feedback We Will Response You ASAP.'); window.loction='index.aspx'</script>");

        }
    }

}
