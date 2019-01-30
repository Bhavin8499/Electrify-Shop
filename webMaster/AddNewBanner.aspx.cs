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

public partial class webMaster_AddNewBanner : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["btnAddBanner"] != null)
        {
            doAddNewBanner();
        }
    }

    public void doAddNewBanner()
    {

        String Line1 = Request.Form["Line1"].ToString();
        String Line2 = Request.Form["Line2"].ToString();
        String QueryString = Request.Form["Query"].ToString();

        HttpPostedFile img1 = Request.Files["file"];
        Random rand = new Random();
        int proImgID = rand.Next(10000, 1000000);
        String ImgExt = Path.GetExtension(img1.FileName);
        String ImgName = "Banner-" + proImgID.ToString() + "-" + 1 + ImgExt;
        String FilePath = MapPath("../images/Banners/") + ImgName;
        img1.SaveAs(FilePath);

        con.Open();
        String query = "insert into Banners values ('" + Line1 + "','" + Line2 + "','" + QueryString + "','" + ImgName + "')";
        SqlCommand cmd = new SqlCommand(query, con);
        int affectedRows = cmd.ExecuteNonQuery();

        if (affectedRows > 0)
        {
            Response.Write("<script>alert('Banner Is Added Successfully'); window.location='AddNewBanner.aspx';</script>");
        }
    }

}
