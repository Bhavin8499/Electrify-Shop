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
        if (Request.Form["submit"] != null)
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
        String Message = "Your Product Is Waiting For Approval";
        String Name = Request.Form["Name"].ToString();
        String Address = Request.Form["Address"].ToString();
        String Pincode = Request.Form["Pincode"].ToString();
        String MobileNo = Request.Form["Mobile"].ToString();
        String Email = Request.Form["Email"].ToString();
        String PayType = Request.Form["PayType"].ToString();
        String Status = "Order Processing";
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
                    qty = Convert.ToInt32(reader["Qty"].ToString());

                    String productQuery = "select * from Product where ID = "+ProID;
                    SqlCommand cmdProduct = new SqlCommand(productQuery,con);
                    SqlDataReader readerProduct = cmdProduct.ExecuteReader();
                    if (readerProduct.HasRows)
                    {
                        while (readerProduct.Read())
                        {
                            Price = readerProduct["Price"].ToString();
                            SellerID = readerProduct["SellerID"].ToString();
                        }
                    }
                    String queryInsert = "insert into CusOrder values (" + CusID + "," + ProID + ", " + SellerID + "," + Price + "," + Date + ", '" + Message + "','"+Status+"','','" + Name + "','" + Address + "', " + Pincode + ", " + MobileNo + ", '" + Email + "',' " + PayType + "', " + qty + ",'Remain')";
                    SqlCommand insertProductCmd = new SqlCommand(queryInsert, con);
                    insertProductCmd.ExecuteNonQuery();

                    String removeCart = "delete from Customer_Cart where ID = "+reader["ID"].ToString();
                    SqlCommand deleteCommand = new SqlCommand(removeCart, con);
                    deleteCommand.ExecuteNonQuery();

                    String reduceStock = "update Product set Qty=Qty-"+qty+" where ID="+ProID;
                    SqlCommand stockCmd = new SqlCommand(removeCart, con);
                    stockCmd.ExecuteNonQuery();

                    Response.Write("<script>alert('Your Orders Placed Successfully'); window.location = 'Order.aspx';</script>");

                }
            }

        }
        catch (SqlException e)
        {
            Response.Write(e.ToString());
        }


    }
}
