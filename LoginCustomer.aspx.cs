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

public partial class LoginCustomer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["ID"] != null)
        {
            Response.Write("<script>alert('You Are Already Logged In.'); history.go(-1);</script>");
        }
        if (Request.Form["btnForgotPassword"] != null)
        {
            doChangePassword();
        }
        if (Request.Form["submit"] != null)
        {
            doLogin();
        }
    }

    private void doChangePassword()
    {
        
        String email = Request.Form["email"].ToString();
        String password = Request.Form["Password"].ToString();
        con.Open();
        String query = "update Customers set Password='"+password+"' where Email='"+email+"'";
        SqlCommand cmd = new SqlCommand(query,con);
        int affectedRows = cmd.ExecuteNonQuery();
        if (affectedRows > 0)
        {
            Response.Write("<script>alert('Password Changed Successfully'); window.location='LoginCustomer.aspx';</script>");
        }
    }

    protected void doLogin()
    {
        String username = Request.Form["Name"];
        String password = Request.Form["Password"];
        String query = "select * from Customers where Email='"+username+"' and Password='"+password+"'";
        con.Open();
        SqlCommand cmd = new SqlCommand(query,con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.HasRows)
        {
            while (reader.Read())
            {
                Session["NickName"] = reader["NickName"].ToString();
                Session["Email"] = reader["Email"].ToString();
                Session["ID"] = reader["ID"].ToString();
                Response.Write("<script>alert('Welcome " + Session["NickName"] + "'); window.location = 'index.aspx';</script>");
               //Response.Redirect("index.aspx");
            }
        }
        else
        {
            Response.Write("<script>alert('Please Enter Correct Username or Password');</script>");
        }
    }
}
