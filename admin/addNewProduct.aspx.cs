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

public partial class admin_addNewProduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

            if(Request.Form["submit"] != null){
                doAddProductToDB();
            }


    }

    private void doAddProductToDB()
    {
        String sellerID = Session["SellerID"].ToString();
        String ProName = Request.Form["product_name"].ToString();
        String Type = Request.Form["product_type"].ToString();
        String MRP = Request.Form["mrp"].ToString();
        String Desc = Request.Form["desc"].ToString();
        String Brand = Request.Form["brand"].ToString();
        String Price = Request.Form["price"].ToString();
        String img1Name = String.Empty;
        String img2Name = String.Empty;
        String img3Name = String.Empty;
        String CombinedImageName = String.Empty;
        String qty = Request.Form["qty"].ToString();
        HttpPostedFile img1 = Request.Files["file"];
        HttpPostedFile img2 = Request.Files["file1"];
        HttpPostedFile img3 = Request.Files["file2"];

        Random rand = new Random();
        int proImgID = rand.Next(10000, 1000000);

        if (img1 != null)
        {
            String ImgExt = Path.GetExtension(img1.FileName);
            String ImgName = ProName + "-" + proImgID.ToString() + "-" + 1 + ImgExt;
            String FilePath = MapPath("../images/products/") + ImgName;
            img1.SaveAs(FilePath);
            img1Name = ImgName;
            CombinedImageName += ImgName;
        }
        if (img2 != null)
        {
            String ImgExt = Path.GetExtension(img2.FileName);
            String ImgName = ProName + "-" + proImgID.ToString() + "-" + 2 + ImgExt;
            String FilePath = MapPath("../images/products/") + ImgName;
            img2.SaveAs(FilePath);
            img2Name = ImgName;
            CombinedImageName += "|" + ImgName;
        }
        if (img3 != null)
        {
            String ImgExt = Path.GetExtension(img3.FileName);
            String ImgName = ProName + "-" + proImgID.ToString() + "-" + 3 + ImgExt;
            String FilePath = MapPath("../images/products/") + ImgName;
            img3.SaveAs(FilePath);
            img3Name = ImgName;
            CombinedImageName += "|" + ImgName;
        }

        /*Name
        Type
        Price
        MRP
        Description
        Keyword
        BrandName
        Product_img
        SellerID

        */
        String[] keys = ProName.Split();
        String Keywords = String.Join("||", keys);
        String query = "insert into Product values ('" + ProName + "','" + Type + "','" + Price + "','" + MRP + "','" + Desc + "','" + Keywords + "','" + Brand + "','" + CombinedImageName + "','" + sellerID + "','" + qty + "' )";

        // String demro = "insert into Product values ('"+ProName+"','"+Type+"',"+Price+","+MRP+",'"+Desc+"','"+Keywords+"','"+Brand+"','"+CombinedImageName+"',1)";

        con.Open();
        SqlCommand cmd = new SqlCommand(query, con);
        int rowChanged = cmd.ExecuteNonQuery();
        if (rowChanged > 0)
        {
            Response.Write("<script>alert('Product Added Successfully'); window.location = 'stockManager.aspx'<script>");
        }
    }

}
