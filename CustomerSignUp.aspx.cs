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

public partial class CustomerSignUp : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["submit"] != null)
        {
            addDatatoDB();
        }
        else
        {
        }
    }

    protected void addDatatoDB()
    {
        String name = Request.Form["Name"];
        String Nickname = Request.Form["Nickname"];
        String Email = Request.Form["Email"];
        String Mobile = Request.Form["Mobile"];
        String Password = Request.Form["Password"];
        String Address = Request.Form["Address"];
        String Pincode = Request.Form["PinCode"];
        String Gender = Request.Form["Gender"];
        String UserAvatar = String.Empty;
        if (Gender == "Female") UserAvatar = "femaleAvatar.jpg";
        else UserAvatar = "maleAvatar.jpg";
        con.Open();
        String query = "insert into Customers values ('" + name + "','" + Nickname + "','" + Address + "','" + Pincode + "'," + Mobile + ",'" + Email + "','" + Gender + "','" + Password + "','" + UserAvatar + "',0)";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        Response.Redirect("index.aspx");
    }
}
