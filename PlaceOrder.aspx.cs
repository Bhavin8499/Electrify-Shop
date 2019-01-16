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


public partial class PlaceOrder : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form[""] != null)
        {
            doPlaceOrder();
        }
    }

    private void doPlaceOrder()
    {
        con.Open();

        String CusID = Request.Form["CusID"].ToString();
        String ProID = String.Empty;
        String SellerID = String.Empty;
        String Price = String.Empty;
        String Date = String.Empty;
        String Message = "Your Product Is Placed";
        String Name = Request.Form["Name"].ToString();
        String Address = Request.Form["Address"].ToString();
        String Pincode = Request.Form["Pincode"].ToString();
        String MobileNo = Request.Form["Mobile"].ToString();
        String Email = Request.Form["Email"].ToString();
        String PayType = Request.Form["PayType"].ToString();
        int qty = 0;
        
        try
        {
            String query = "select * from Customer_Cart";
            SqlCommand cmd = new SqlCommand(query,con);
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Date = DateTime.Now.ToShortDateString();
                    ProID = reader["ProductID"].ToString();
                    qty = reader["Qty"];

                    String productQuery = "select * from Product where ID = "+ProID;
                    SqlCommand cmdProduct = new SqlCommand(productQuery,con);
                    SqlDataReader readerProduct = cmdProduct.ExecuteReader();
                    if (readerProduct.HasRows)
                    {
                        while (readerProduct.Read())
                        {
                            Price = reader["Price"].ToString();
                            SellerID = readerProduct["SellerID"].ToString();
                        }
                    }
                    String queryInsert = "insert into CusOrder ()";
                    SqlCommand insertProductCmd = new SqlCommand(queryInsert, con);
                    insertProductCmd.ExecuteNonQuery();

                    String removeCart = "delete from Customer_Cart where ID = "+reader["ID"].ToString();
                    SqlCommand deleteCommand = new SqlCommand(removeCart, con);
                    deleteCommand.ExecuteNonQuery();

                }
            }

        }
        catch (SqlException e)
        {
            Response.Write(e.ToString());
        }


    }
}
