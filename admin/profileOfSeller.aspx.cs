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
using System.IO;
using System.Data.SqlClient;

public partial class profileOfSeller : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["btnEditProfile"] != null)
        {
            con.Open();
            UpdateUserProfile();
        }
        
    }


    private void UpdateUserProfile()
    {
        String Name = Request.Form["Name"].ToString();
        String NickName = Request.Form["Nickname"].ToString();
        String Address = Request.Form["Address"].ToString();
        String Pincode = Request.Form["Pincode"].ToString();
        String Email = Request.Form["Email"].ToString();
        String Gender = Request.Form["Gender"].ToString();
        String SellerID = Request.Form["SellerID"].ToString();
        HttpPostedFile img1 = Request.Files["file"];

        Random rand = new Random();
        int proImgID = rand.Next(10000, 1000000);
        if (img1 != null)
        {
            String ImgExt = Path.GetExtension(img1.FileName);
            String ImgName = NickName + "-" + proImgID.ToString() + "-" + 1 + ImgExt;
            String FilePath = MapPath("../images/SellerProfile/") + ImgName;
            img1.SaveAs(FilePath);
            String query1 = "update Sellers set ProfileImage='" + ImgName + "' where ID = " + SellerID;
            SqlCommand cmd1 = new SqlCommand(query1, con);
            cmd1.ExecuteNonQuery();
        }

        String query = "update Sellers set Name='"+Name+"',NickName='"+NickName+"', Address='"+Address+"', Pincode='"+Pincode+"', Email='"+Email+"', Gender='"+Gender+"' where ID = "+SellerID;
        SqlCommand cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
    }
}
