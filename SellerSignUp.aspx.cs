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
using System.IO;

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
        con.Open();

        HttpPostedFile img1 = Request.Files["img1"];

        Random rand = new Random();
        int proImgID = rand.Next(10000, 1000000);
        String imgName = String.Empty;
        if (img1.ContentLength > 0)
        {
            String ImgExt = Path.GetExtension(img1.FileName);
            String ImgName = Nickname + "-" + proImgID.ToString() + "-" + 1 + ImgExt;
            String FilePath = MapPath("images/SellerProfile/") + ImgName;
            img1.SaveAs(FilePath);
            imgName = ImgName;
        }

        String query = "insert into Sellers values ('"+name+"','"+Nickname+"','"+Address+"','"+Pincode+"',"+Mobile+",'"+Email+"','"+Gender+"','"+Password+"','"+imgName+"')";
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        Response.Redirect("index.aspx");
    }
}
