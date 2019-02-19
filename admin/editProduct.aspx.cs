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

public partial class admin_editProduct : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["btnEditProduct"] != null)
        {

            doUpdateProduct();

        }
    }

    private void doUpdateProduct()
    {

        String ProID = Request.Form["ProID"].ToString();
        String ProName = Request.Form["product_name"].ToString();
        String Type = Request.Form["product_type"].ToString();
        String MRP = Request.Form["mrp"].ToString();
        String Desc = Request.Form["desc"].ToString();
        String Brand = Request.Form["brand"].ToString();
        String Price = Request.Form["price"].ToString();
        String img1Name = String.Empty;
        String img2Name = String.Empty;
        String img3Name = String.Empty;
        String qty = Request.Form["qty"].ToString();
        String CombinedImageName = String.Empty;
        HttpPostedFile img1 = Request.Files["file"];
        HttpPostedFile img2 = Request.Files["file1"];
        HttpPostedFile img3 = Request.Files["file2"];

        Random rand = new Random();
        int proImgID = rand.Next(10000, 1000000);

        if (img1.ContentLength > 0)
        {
            String ImgExt = Path.GetExtension(img1.FileName);
            String ImgName = ProName + "-" + proImgID.ToString() + "-" + 1 + ImgExt;
            String FilePath = MapPath("../images/products/") + ImgName;
            img1.SaveAs(FilePath);
            img1Name = ImgName;
            CombinedImageName += ImgName;
        }
        if (img2.ContentLength >0)
        {
            String ImgExt = Path.GetExtension(img2.FileName);
            String ImgName = ProName + "-" + proImgID.ToString() + "-" + 2 + ImgExt;
            String FilePath = MapPath("../images/products/") + ImgName;
            img2.SaveAs(FilePath);
            img2Name = ImgName;
            CombinedImageName += "|" + ImgName;
        }
        if (img3.ContentLength > 0)
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
        con.Open();
        if (CombinedImageName.Length > 2)
        {
            String queryUpImage = "update product set Product_img='" + CombinedImageName + "' where ID='" + ProID + "'";
            SqlCommand cmmdUpimg = new SqlCommand(queryUpImage, con);
            cmmdUpimg.ExecuteNonQuery();
        }

        String[] keys = ProName.Split();
        String Keywords = String.Join("||", keys);
        String[] splitOpt = new String[2];
        splitOpt[0] = "||";
        String[] joinWord = Keywords.Split(splitOpt, StringSplitOptions.None);
        String query = "update product set Name='"+ProName+"',Type='"+Type+"',Price='"+Price+"',MRP='"+MRP+"',Description='"+Desc+"',Keyword='"+Keywords+"',BrandName='"+Brand+"',Qty='"+qty+"' where ID='"+ProID+"'";

        
        SqlCommand cmd = new SqlCommand(query, con);
        int rowChanged = cmd.ExecuteNonQuery();
        if (rowChanged > 0)
            Response.Write("<script>alert('Product Added Successfully'); window.location = 'stockManager.aspx'<script>");
   
    }

}
