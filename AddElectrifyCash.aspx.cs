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

public partial class AddElectrifyCash : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["btnSubmit"] != null)
        {
            addCash();
        }
    }

    private void addCash()
    {
        String cash = Request.Form["addCash"].ToString();
        String ID = Request.Form["ID"].ToString();
        String query = "update Customers set ElectriCash=ElectriCash+"+cash+" where ID="+ID;
        con.Open();
        SqlCommand cmd = new SqlCommand(query,con);
        cmd.ExecuteNonQuery();
        con.Close();
    }
}
