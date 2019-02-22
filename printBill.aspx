<%@ Page Language="C#" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Generate Bill | Electrify-Shop</title>
    <style>
    body {
    background: grey;
    margin-top: 120px;
    margin-bottom: 120px;
}</style>

<!------ Include the above in your HEAD tag ---------->
</head>
<body>
   <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <%
       SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBConnection"].ToString());
       con.Open();
       String orderID = Request.QueryString["ordID"] != null ? Request.QueryString["ordID"].ToString() : "0";
       String query = "select * from CusOrder where ID="+orderID;
       SqlCommand cmd = new SqlCommand(query,con);
       SqlDataReader reader = cmd.ExecuteReader();
       if (reader.HasRows)
       {
           while (reader.Read())
           {%>
           <div class="container">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-body p-0">
                    <div class="row p-5">
                        <div class="col-md-6">
                            <img width="auto" height="150px" style="overflow: hidden;" src="images/logo.png">
                        </div>

                        <div class="col-md-6 text-right">
                            <p class="font-weight-bold mb-1">Invoice #<% Response.Write(reader["ID"].ToString()); %></p>
                            <p class="text-muted"><% Response.Write(reader["Date"].ToString()); %></p>
                        </div>
                    </div>

                    <hr class="my-5">

                    <div class="row pb-5 p-5">
                        <div class="col-md-6">
                            <p class="font-weight-bold mb-4">Client Information</p>
                            <p class="mb-1"><% Response.Write(reader["Name"].ToString()); %></p>
                            <p class="mb-1"><% Response.Write(reader["MobileNo"].ToString()); %></p>
                            <p class="mb-1"><% Response.Write(reader["Address"].ToString()); %></p>
                            <p class="mb-1"><% Response.Write(reader["Pincode"].ToString()); %></p>
                        </div>

                        <div class="col-md-6 text-right">
                            <p class="font-weight-bold mb-4">Payment Details</p>
                            <p class="mb-1"><span class="text-muted">Payment Type: </span> <% Response.Write(reader["Paytype"].ToString()); %></p>
                            <p class="mb-1"><span class="text-muted">Name: </span> <% Response.Write(reader["Name"].ToString()); %></p>
                        </div>
                    </div>

                    <div class="row p-5">
                        <div class="col-md-12">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="border-0 text-uppercase small font-weight-bold">ID</th>
                                        <th class="border-0 text-uppercase small font-weight-bold"></th>
                                        <th class="border-0 text-uppercase small font-weight-bold">Name</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">Type</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">Quantity</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">Unit Cost</th>
                                        <th class="border-0 text-uppercase small font-weight-bold">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <% SqlCommand cmd1 = new SqlCommand("select * from Product Where ID="+reader["ProID"].ToString(),con);
                                   SqlDataReader readerProduct = cmd1.ExecuteReader();
                                   if (readerProduct.HasRows)
                                   {
                                       while (readerProduct.Read())
                                       {
                                          string ImgName=  readerProduct["Product_img"].ToString();
                                          String[] imgArr = ImgName.Split('|');%>
                                    <tr>
                                        <td><% Response.Write(reader["ID"].ToString()); %></td>
                                        <td><img style="max-height:100px; width:auto; margin-top:-10px;" src="images/products/<% Response.Write(imgArr[0]); %>"></td>
                                        <td style="max-width:200px"><% Response.Write(readerProduct["Name"].ToString()); %></td>
                                        <td><% Response.Write(readerProduct["Type"].ToString()); %></td>
                                        <td><% Response.Write(reader["Qty"].ToString()); %></td>
                                        <td>$<% Response.Write(reader["Price"].ToString()); %></td>
                                        <td>$<% Response.Write(Convert.ToInt32(reader["Price"].ToString()) * Convert.ToInt32(reader["Qty"].ToString())); %></td>
                                    </tr>
                                    <% }
                                   } %>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="d-flex flex-row-reverse bg-dark text-white p-4">
                        <div class="py-3 px-5 text-right">
                            <div class="mb-2">Grand Total</div>
                            <div class="h2 font-weight-light">$<% Response.Write(Convert.ToInt32(reader["Price"].ToString()) * Convert.ToInt32(reader["Qty"].ToString())); %></div>
                        </div>

                        <div class="py-3 px-5 text-right">
                            <div class="mb-2">Quntity</div>
                            <div class="h2 font-weight-light"><% Response.Write(reader["Qty"].ToString()); %></div>
                        </div>

                        <div class="py-3 px-5 text-right">
                            <div class="mb-2">Sub - Total amount</div>
                            <div class="h2 font-weight-light">$<% Response.Write(reader["Price"].ToString()); %></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
   
</div>

           <%}
       } 
       %>
        
     




        
        
<script type="text/javascript">
window.print();
</script>
</body>
</html>
