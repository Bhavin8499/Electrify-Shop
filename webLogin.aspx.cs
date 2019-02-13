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

public partial class adminLogin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["WebID"] != null)
        {
            Response.Write("<script>alert('You Are Already Logged In'); history.go(-1);</script>");
        }
        if (Request.Form["btnLogin"] != null)
        {
            doLogin();
        }
        else if (Request.Form["chngPassword"] != null)
        {
            doForgotPassword();
        }
    }

    protected void doLogin()
    {
        String username = Request.Form["Email"];
        String password = Request.Form["Password"];
        String query = "select * from webMasters where Email='" + username + "' and Password='" + password + "'";
        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                Session["Email"] = reader["Email"].ToString();
                Session["WebID"] = reader["ID"].ToString();
                Response.Write("<script>alert('Welcome " + reader["Name"].ToString() + "'); window.location = 'webMaster/index.aspx';</script>");
                //Response.Redirect("index.aspx");
            }
        }
        else
        {
            Response.Write("<script>alert('Please Enter Correct Username or Password');</script>");
        }
    }

    protected void doForgotPassword() {

        String Email = Request.Form["email"].ToString();
        String Password = Request.Form["Password"].ToString();
        con.Open();
        String query = "update webMasters set Password='"+Password+"' where Email = '"+Email+"' ";
        SqlCommand cmd = new SqlCommand(query, con);
        int affectedRow = cmd.ExecuteNonQuery();

        if (affectedRow > 0)
        {
            Response.Write("<script>alert('Password Changed Successfully'); window.location='webLogin.aspx';</script>");
        }
        con.Close();
    }

}
